import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/data/enums/api_status.dart';
import 'package:tcm/models/place_detail_model.dart';
import 'package:tcm/models/product_data_model.dart';
import 'package:tcm/providers/google_map_api_provider.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_logger.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/view/checkout_view.dart';
import 'package:tcm/widgets/common_screen_template_widget.dart';
import 'package:tcm/widgets/custom_back_button_widget.dart';
import 'package:tcm/widgets/custom_button_widget.dart';
import 'package:tcm/widgets/custom_google_map_widget.dart';
import 'package:tcm/widgets/custom_loading_widget.dart';

import '../models/place_listing_model.dart';
import '../widgets/custom_search_bar_widget.dart';

class SelectLocationView extends StatefulWidget {
  final ProductDataModel? product;
  const SelectLocationView({super.key, required this.product});

  @override
  State<SelectLocationView> createState() => _SelectLocationViewState();
}

class _SelectLocationViewState extends State<SelectLocationView> {
  final TextEditingController controller = TextEditingController();
  bool showSuggestion = false;
  PlaceDetailModel? location;
  setLocation(String id, WidgetRef ref) async {
    ref.read(googleMapApiProvider.notifier).getPlaceDetail(id).then((v) {
      location = v;

      setState(() {
        setLatLong(location?.result?.geometry?.location?.lat ?? 0.0,
            location?.result?.geometry?.location?.lng ?? 0.0);
      });
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(
      () {
        googleMapController = controller;
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            const CameraPosition(
                target: LatLng(40.71302519172581, -74.01013023107718),
                zoom: 15),
          ),
        );
      },
    );
  }

  setLatLong(double lat, double long) {
    final CameraUpdate cameraUpdate =
        CameraUpdate.newLatLng(LatLng(lat, long)); // Example position
    googleMapController?.moveCamera(cameraUpdate);
    googleMapController
        ?.animateCamera(cameraUpdate); // Animate to the camera update
  }

  GoogleMapController? googleMapController;

  @override
  Widget build(BuildContext context) {
    return CommonScreenTemplateWidget(
        leadingWidget: const CustomBackButtonWidget(),
        appBarHeight: 150.h,
        bottomAppbarWidget: PreferredSize(
            preferredSize: Size.fromHeight(200.h),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppStyles.screenHorizontalPadding,
                  vertical: AppStyles.screenHorizontalPadding),
              child: Consumer(
                builder: (_, WidgetRef ref, __) {
                  return CustomSearchBarWidget(
                    hintText: "Search Location",
                    controller: controller,
                    onTap: () {
                      if (controller.text != "" && !showSuggestion) {
                        showSuggestion = true;
                        setState(() {});
                      }
                    },
                    onChanged: (c) {
                      if (c != "") {
                        showSuggestion = true;
                        Future.delayed(const Duration(milliseconds: 500), () {
                          ref.read(googleMapApiProvider).searchPlace(c);
                        });
                      } else {
                        showSuggestion = false;
                      }
                      setState(() {});
                    },
                  );
                },
              ),
            )),
        title: "Select Location",
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            if (showSuggestion) {
              showSuggestion = false;
              setState(() {});
            }
          },
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              CustomGoogleMapWidget(
                lat: location?.result?.geometry?.location?.lat ??
                    40.71302519172581,
                long: location?.result?.geometry?.location?.lng ??
                    -74.01013023107718,
                location: location,
                onMapCreated: _onMapCreated,
                zoom: 13,
              ),
              Container(
                height: 165.h,
                width: double.infinity,
                padding: EdgeInsets.only(
                    top: 50.r,
                    left: AppStyles.screenHorizontalPadding,
                    right: AppStyles.screenHorizontalPadding),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withAlpha(2), // rgba(255, 255, 255, 0.00)
                    Colors.white, // #FFF
                  ],
                  stops: const [
                    0.0,
                    0.5
                  ], // First color at 0% and second color at 50%
                )),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButtonWidget(
                        title: "Select",
                        onPressed: () {
                          AppRouter.back();
                          AppRouter.pushReplacement(CheckoutView(
                            isLocationSet: true,
                            product: widget.product,
                          ));
                        }),
                  ],
                ),
              ),
              if (showSuggestion)
                Container(
                  height: context.screenheight * 0.3,
                  margin:
                      EdgeInsets.only(bottom: 500.r, left: 17.r, right: 17.r),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withAlpha(40),
                            offset: const Offset(0, 3),
                            blurRadius: 2,
                            spreadRadius: 1)
                      ]),
                  child: Consumer(
                    builder: (_, WidgetRef ref, __) {
                      final googleMapResponse = ref.watch(googleMapApiProvider);
                      return googleMapResponse.placeListApiResponse.status ==
                              Status.completed
                          ? googleMapResponse.placeListApiResponse.data !=
                                      null &&
                                  googleMapResponse.placeListApiResponse.data!
                                      .predictions!.isNotEmpty
                              ? ListView.builder(
                                  itemCount: googleMapResponse
                                      .placeListApiResponse
                                      .data!
                                      .predictions!
                                      .length,
                                  // shrinkWrap: true,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 17.r),
                                  itemBuilder: (context, index) => ListTile(
                                    onTap: () {
                                      controller.text = googleMapResponse
                                              .placeListApiResponse
                                              .data!
                                              .predictions![index]
                                              .description ??
                                          "";
                                      showSuggestion = false;
                                      setState(() {});
                                      setLocation(
                                          googleMapResponse
                                              .placeListApiResponse
                                              .data!
                                              .predictions![index]
                                              .placeId!,
                                          ref);
                                    },
                                    contentPadding: EdgeInsets.zero,
                                    horizontalTitleGap: -2.9,
                                    minLeadingWidth: 30.r,
                                    minTileHeight: 40.h,
                                    leading: SvgPicture.asset(
                                      Assets.locationIcon,
                                      width: 12.r,
                                      colorFilter: const ColorFilter.mode(
                                          Colors.red, BlendMode.srcIn),
                                    ),
                                    title: Text(
                                      googleMapResponse
                                              .placeListApiResponse
                                              .data!
                                              .predictions![index]
                                              .description ??
                                          "",
                                      style: context.textStyle.bodyMedium!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: Text("No Place Find"),
                                )
                          : googleMapResponse.placeListApiResponse.status ==
                                  Status.error
                              ? const Center(
                                  child: Text("Something went wrong!"),
                                )
                              : const CustomLoadingWidget();
                    },
                  ),
                ),
            ],
          ),
        ));
  }
}

// void displaySearchModalSheet(
//     BuildContext context, TextEditingController controller) {
//   showModalBottomSheet(
//     context: context,
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
//     isScrollControlled: true, // allows the bottom sheet to take up more space
//     builder: (BuildContext context) {
//       return Container(
//         constraints: BoxConstraints(
//             maxHeight: context.screenheight * 0.46,
//             minHeight: context.screenheight * 0.10),
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             CustomSearchBarWidget(
//               hintText: "Search Location",
//               controller: controller,
//             ),
//             20.ph,
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 2,
//                 // shrinkWrap: true,
//                 itemBuilder: (context, index) => ListTile(
//                   contentPadding: EdgeInsets.zero,
//                   horizontalTitleGap: -2.9,
//                   leading: SvgPicture.asset(Assets.locationIcon),
//                   title: Text(
//                     "gdhasghdgash" * 10,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//     },
//   );
// }
