

class CategoryDataModel {
  late final int id;
  late final String title;
  late final String imageUrl;
  late final bool isSelected; // New boolean field

  // Constructor now includes the boolean field
  CategoryDataModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.isSelected = false, // Default value is false
  });

  // Static lists updated with the new boolean field
  static List<CategoryDataModel> categories = [
    CategoryDataModel(id: 1, title: "Grocery", imageUrl: "https://i.ibb.co/2gWB6tL/image-10.png", isSelected: false),
    CategoryDataModel(id: 2, title: "Toiletries", imageUrl: "https://i.ibb.co/hDn2R9v/image.png", isSelected: false),
    CategoryDataModel(id: 3, title: "Food", imageUrl: "https://i.ibb.co/8z4VWYS/1.png", isSelected: false),
    CategoryDataModel(id: 4, title: "Beverages", imageUrl: "https://i.ibb.co/zV9ZRnk/image-14.png", isSelected: false),
    CategoryDataModel(id: 5, title: "Laundry", imageUrl: "https://i.ibb.co/D1Jp9Vp/2.png", isSelected: false),
    CategoryDataModel(id: 6, title: "Infant", imageUrl: "https://i.ibb.co/hDnGGcT/image-15.png", isSelected: false),
    CategoryDataModel(id: 7, title: "Entertainment", imageUrl: "https://i.ibb.co/5KgQXMT/entertainment.png", isSelected: false),
  ];

  static List<CategoryDataModel> sellSubCategories = [
    CategoryDataModel(id: 1, title: "Bath & Shower", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 2, title: "Oral Care", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 3, title: "Skin Care", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 4, title: "Baby Toiletries", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 5, title: "Frozen Foods", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 6, title: "Pantry Staples", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 7, title: "Oils and Fats", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 8, title: "Oral Care", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 9, title: "Skin Care", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 10, title: "Baby Toiletries", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 11, title: "Frozen Foods", imageUrl: "", isSelected: false),
  ];

  static List<CategoryDataModel> sellSubInnerCategories = [
    CategoryDataModel(id: 1, title: "Body Wash", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 2, title: "Bar Soap", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 3, title: "Loofahs & Sponges", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 4, title: "Bath Bombs & Salts", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 5, title: "Shower Gel", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 6, title: "Bar Soap", imageUrl: "", isSelected: false),
  ];

  static List<CategoryDataModel> buySubCategories = [
    CategoryDataModel(id: 1, title: "Fresh Produce", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 2, title: "Dairy and Eggs", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 3, title: "Bakery Items", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 4, title: "Meat and Seafood", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 5, title: "Frozen Foods", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 6, title: "Pantry Staples", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 7, title: "Oils and Fats", imageUrl: "", isSelected: false),
  ];

  static List<CategoryDataModel> buyInnerCategories = [
    CategoryDataModel(id: 1, title: "Fruits", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 2, title: "Vegetables", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 3, title: "Fresh Herbs", imageUrl: "", isSelected: false),
  ];

  static List<CategoryDataModel> buyInnerSuCategories = [
    CategoryDataModel(id: 1, title: "Oranges", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 2, title: "Lemons", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 3, title: "Limes", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 4, title: "Grapefruits", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 5, title: "Tangerines", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 6, title: "Strawberries", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 7, title: "Blueberries", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 8, title: "Raspberries", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 9, title: "Blackberries", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 10, title: "Cranberries", imageUrl: "", isSelected: false),
    CategoryDataModel(id: 11, title: "Pineapples", imageUrl: "", isSelected: false),
  ];
}

