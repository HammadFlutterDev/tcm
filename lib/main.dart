import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/utils/app_theme.dart';

import 'utils/app_router.dart';
import 'view/onboarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SharedPreferenceManager.init();
  // await Firebase.initializeApp(
  //   options: !Platform.isIOS ? DefaultFirebaseOptions.currentPlatform : null,
  // );
  // await FirebaseService.firebaseTokenInitial();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(390, 947),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (_, __) {
        return MaterialApp(
          title: 'TCM',
          debugShowCheckedModeBanner: false,
          navigatorKey: AppRouter.navKey,
          theme: AppTheme.lightTheme,
          // theme: ref.watch(themeProvider),
          home: const OnboardingView(),
        );
      },
    );
  }
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
