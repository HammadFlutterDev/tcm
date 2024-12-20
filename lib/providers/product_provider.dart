import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tcm/models/category_data_model.dart';
import 'package:tcm/models/product_data_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductDataModel> nearByProducts = [
    ProductDataModel(
      id: 1,
      productName: 'Pepsi',
      productImage: 'https://i.ibb.co/Rhm9Txj/image.png',
      productPrice: '1.50',
      isFavourite: false,
      productSampleImages: [
        'https://www.pepsico.com/images/default-source/products-brands/pepsi_12oz.png?sfvrsn=46c9ae09_3',
        'https://i.pinimg.com/736x/6e/9d/3c/6e9d3c47c2b4d396abb5209140125c2c.jpg'
      ],
      productDescription:
          'Refreshing cola beverage with a bold taste and a hint of citrus. Pepsi is a globally recognized carbonated soft drink that delivers a refreshing burst of flavor. With its unique blend of sweetness and citrus notes, Pepsi is perfect for quenching your thirst on a hot day or as a complement to your favorite meals. Enjoy it chilled for the best experience.',
      keyFeatures: [
        "Bold Flavor: A distinct taste that sets it apart from other soft drinks, making it a favorite among cola enthusiasts.Carbonated Refreshment: The perfect level of carbonation to provide a fizzy sensation with every sip.Versatile Pairing: Pairs well with a wide variety of foods, enhancing the overall dining experience."
      ],
      productOwner: ProductOwnerData(
        id: 1,
        username: 'BeverageWorld',
        userImage:
            'https://upload.wikimedia.org/wikipedia/en/0/04/All-american-boy-song.jpg',
        userFeedback: 'Perfect for any occasion!',
      ),
      locationData: LocationData(
        lat: 34.0522,
        long: -118.2437,
        address: '123 Beverage Ave, Los Angeles',
      ),
    ),
    ProductDataModel(
      id: 2,
      productName: 'Nutella',
      productImage: 'https://i.ibb.co/hdh4zwF/image2.png',
      productPrice: '5.99',
      isFavourite: true,
      productSampleImages: [
        'https://www.flourconfections.com/images/thumbs/300_300/fullsizeoutput_7c34.webp',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrx2hfl4J39fLOhRSHGvRq9RNZ5Mn47qzUPA&s'
      ],
      productDescription:
          'Nutella is a creamy hazelnut spread enriched with cocoa, perfect for spreading on toast, pancakes, or simply enjoying by the spoonful. Its rich flavor and smooth texture make it an indulgent treat for breakfast or dessert.',
      keyFeatures: [
        'Rich Hazelnut Flavor: Made from high-quality hazelnuts, offering a deliciously nutty taste.Versatile Use: Ideal for spreading on bread, mixing into desserts, or as an ingredient in baking.No Artificial Preservatives: Made with natural ingredients, ensuring a wholesome treat.'
      ],
      productOwner: ProductOwnerData(
        id: 2,
        username: 'SweetTreats',
        userImage:
            'https://upload.wikimedia.org/wikipedia/en/0/04/All-american-boy-song.jpg',
        userFeedback: 'A must-have for chocolate lovers!',
      ),
      locationData: LocationData(
        lat: 45.4215,
        long: -75.6972,
        address: '456 Sweet St, Ottawa',
      ),
    ),
    ProductDataModel(
      id: 1,
      productName:
          'Organic Green Tea Made from the Finest Organic Leaves for Wellness',
      productImage: 'green_tea.png',
      productPrice: '5.99',
      isFavourite: true,
      productSampleImages: ['green_tea_sample_1.png', 'green_tea_sample_2.png'],
      productDescription:
          'A soothing and healthy green tea made from organic leaves.',
      keyFeatures: ['Organic', 'Rich in Antioxidants', 'Supports Digestion'],
      productOwner: ProductOwnerData(
        id: 1,
        username: 'HealthyShop',
        userImage: 'healthy_shop_logo.png',
        userFeedback: 'We care about your health!',
      ),
      locationData: LocationData(
        lat: 12.9716,
        long: 77.5946,
        address: '123 Wellness Lane, Bangalore',
      ),
    ),
    ProductDataModel(
      id: 2,
      productName:
          'High-Quality Bluetooth Wireless Headphones with Noise-Canceling Technology',
      productImage: 'wireless_headphones.png',
      productPrice: '49.99',
      isFavourite: false,
      productSampleImages: [
        'headphones_sample_1.png',
        'headphones_sample_2.png'
      ],
      productDescription:
          'High-quality wireless headphones with noise-canceling technology.',
      keyFeatures: ['Noise-Canceling', 'Bluetooth 5.0', 'Long Battery Life'],
      productOwner: ProductOwnerData(
        id: 2,
        username: 'TechStore',
        userImage: 'techstore_logo.png',
        userFeedback: 'Your tech needs, our priority!',
      ),
      locationData: LocationData(
        lat: 40.7128,
        long: -74.0060,
        address: '456 Tech Plaza, New York',
      ),
    ),
    ProductDataModel(
      id: 3,
      productName:
          'Premium Non-Slip Yoga Mat for Comfortable and Eco-Friendly Workouts',
      productImage: 'yoga_mat.png',
      productPrice: '25.99',
      isFavourite: true,
      productSampleImages: ['yoga_mat_sample_1.png', 'yoga_mat_sample_2.png'],
      productDescription:
          'Non-slip, thick premium yoga mat for a comfortable workout experience.',
      keyFeatures: ['Non-Slip', 'Eco-Friendly Material', 'Extra Thick'],
      productOwner: ProductOwnerData(
        id: 3,
        username: 'FitGear',
        userImage: 'fitgear_logo.png',
        userFeedback: 'Fitness starts here!',
      ),
      locationData: LocationData(
        lat: 34.0522,
        long: -118.2437,
        address: '789 Fitness Road, Los Angeles',
      ),
    ),
    ProductDataModel(
      id: 4,
      productName:
          'Compact 10000mAh Portable Power Bank for Fast Charging Devices',
      productImage: 'power_bank.png',
      productPrice: '19.99',
      isFavourite: false,
      productSampleImages: [
        'power_bank_sample_1.png',
        'power_bank_sample_2.png'
      ],
      productDescription:
          'Compact and reliable 10000mAh power bank to keep your devices charged on the go.',
      keyFeatures: [
        'Compact Design',
        'Fast Charging',
        'Multiple Device Support'
      ],
      productOwner: ProductOwnerData(
        id: 4,
        username: 'PowerUp',
        userImage: 'powerup_logo.png',
        userFeedback: 'Stay charged, anytime, anywhere.',
      ),
      locationData: LocationData(
        lat: 51.5074,
        long: -0.1278,
        address: '101 Charging Lane, London',
      ),
    ),
    ProductDataModel(
      id: 5,
      productName:
          'Smart LED Desk Lamp with Adjustable Brightness for Eye-Care Lighting',
      productImage: 'led_desk_lamp.png',
      productPrice: '35.99',
      isFavourite: true,
      productSampleImages: ['led_lamp_sample_1.png', 'led_lamp_sample_2.png'],
      productDescription:
          'Adjustable LED desk lamp with multiple brightness levels and a touch control panel.',
      keyFeatures: [
        'Adjustable Brightness',
        'Touch Control',
        'Eye-Care Technology'
      ],
      productOwner: ProductOwnerData(
        id: 5,
        username: 'HomeDecorStore',
        userImage: 'homedecorstore_logo.png',
        userFeedback: 'Brighten up your home!',
      ),
      locationData: LocationData(
        lat: 48.8566,
        long: 2.3522,
        address: '202 Decor Street, Paris',
      ),
    ),
  ];

  void favouriteToggeleNearbyItem(int index) {
    // Ensure the index is valid
    if (index >= 0 && index < nearByProducts.length) {
      final product = nearByProducts[index];
      // Toggle the 'isFavourite' value of the selected item
      nearByProducts[index] = ProductDataModel(
        id: product.id,
        productName: product.productName,
        productImage: product.productImage,
        productPrice: product.productPrice,
        isFavourite: !product.isFavourite!,
        productSampleImages: product.productSampleImages,
        productDescription: product.productDescription,
        keyFeatures: product.keyFeatures,
        productOwner: product.productOwner,
        locationData: product.locationData,
      );

      // Notify listeners about the change
      notifyListeners();
    }
  }

  List<CategoryDataModel> fruits =
      List.from(CategoryDataModel.buyInnerSuCategories);

  void checkList(int index) {
    final CategoryDataModel category = fruits[index];

    fruits[index] = CategoryDataModel(
        id: category.id,
        title: category.title,
        imageUrl: category.imageUrl,
        isSelected: !category.isSelected);
    notifyListeners();
  }
}

final productDataProvider = ChangeNotifierProvider<ProductProvider>(
  (ref) => ProductProvider(),
);
