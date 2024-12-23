class ProductDataModel {
  late final int? id;
  late final String? productName;
  late final String? productImage;
  late final String? productPrice;
  late final bool? isFavourite;
  late final List<String>? productSampleImages;
  late final String? productDescription;
  late final List<String>? keyFeatures;
  late final ProductOwnerData? productOwner;
  late final LocationData locationData;
  late final bool isStoreProduct; 

  ProductDataModel({
    this.id,
    this.productName,
    this.productImage,
    this.productPrice,
    this.isFavourite = false,
    this.productSampleImages,
    this.productDescription,
    this.keyFeatures,
    this.productOwner,
    required this.locationData,
    this.isStoreProduct = false
  });

  // fromJson method to parse JSON into a ProductDataModel object
  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      id: json['id'] as int? ?? 1, // Default value for id
      productName: json['productName'] as String? ?? 'Unknown Product',
      productImage: json['productImage'] as String? ?? '',
      productPrice: json['productPrice'] as String? ?? '0.00',
      isFavourite: json['isFavourite'] as bool? ?? false,
      productSampleImages: (json['productSampleImages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      productDescription: json['productDescription'] as String? ?? 'No description available',
      keyFeatures: (json['keyFeatures'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      productOwner: json['productOwner'] != null
          ? ProductOwnerData.fromJson(json['productOwner'])
          : null,
      locationData: LocationData.fromJson(json['locationData'] ?? {}),
    );
  }
}

class ProductOwnerData {
  late final int? id;
  late final String? username;
  late final String? userImage;
  late final String? userFeedback;

  ProductOwnerData({
    this.id = 1, // Default value
    this.username = 'Unknown User',
    this.userImage = '',
    this.userFeedback = 'No feedback',
  });

  // fromJson method for ProductOwnerData
  factory ProductOwnerData.fromJson(Map<String, dynamic> json) {
    return ProductOwnerData(
      id: json['id'] as int? ?? 1,
      username: json['username'] as String? ?? 'Unknown User',
      userImage: json['userImage'] as String? ?? '',
      userFeedback: json['userFeedback'] as String? ?? 'No feedback',
    );
  }
}

class LocationData {
  late final double? lat;
  late final double? long;
  late final String? address;

  LocationData({
    this.lat = 0.0, // Default value for lat
    this.long = 0.0, // Default value for long
    this.address = 'Unknown address',
  });

  // fromJson method for LocationData
  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
      lat: json['lat'] as double? ?? 0.0,
      long: json['long'] as double? ?? 0.0,
      address: json['address'] as String? ?? 'Unknown address',
    );
  }
}
