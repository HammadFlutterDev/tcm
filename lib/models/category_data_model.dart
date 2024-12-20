

class CategoryDataModel {
  late final int id;
  late final String title;
  late final String imageUrl;

  CategoryDataModel({required this.id, required this.title, required this.imageUrl});

  static List<CategoryDataModel> categories = [
  CategoryDataModel(id: 1, title: "Grocery", imageUrl: "https://i.ibb.co/M88wwsC/grocery.png"),
  CategoryDataModel(id: 2, title: "Toiletries", imageUrl: "https://i.ibb.co/M88wwsC/grocery.png"),
  CategoryDataModel(id: 3, title: "Food", imageUrl: "https://i.ibb.co/M88wwsC/grocery.png"),
  CategoryDataModel(id: 4, title: "Beverages", imageUrl: "https://i.ibb.co/M88wwsC/grocery.png"),
  CategoryDataModel(id: 5, title: "Snacks", imageUrl: "https://i.ibb.co/M88wwsC/grocery.png"),
];
static List<CategoryDataModel> subCategories = [
  CategoryDataModel(id: 1, title: "Bath & Shower", imageUrl: "https://i.ibb.co/M88wwsC/grocery.png"),
  CategoryDataModel(id: 2, title: "Travel Toiletries", imageUrl: "https://i.ibb.co/M88wwsC/grocery.png"),
  CategoryDataModel(id: 3, title: "Oral Care", imageUrl: "https://i.ibb.co/M88wwsC/grocery.png"),
  CategoryDataModel(id: 4, title: "Hair Care", imageUrl: "https://i.ibb.co/M88wwsC/grocery.png"),
  CategoryDataModel(id: 5, title: "Fragrances", imageUrl: "https://i.ibb.co/M88wwsC/grocery.png"),
  CategoryDataModel(id: 5, title: "Skin Care", imageUrl: "https://i.ibb.co/M88wwsC/grocery.png"),
  CategoryDataModel(id: 4, title: "Deodorants & Antiperspirants", imageUrl: "https://i.ibb.co/M88wwsC/grocery.png"),
  CategoryDataModel(id: 5, title: "Feminine Hygiene", imageUrl: "https://i.ibb.co/M88wwsC/grocery.png"),
  CategoryDataModel(id: 5, title: "Men's Grooming", imageUrl: "https://i.ibb.co/M88wwsC/grocery.png"),
  CategoryDataModel(id: 5, title: "Baby Toiletries", imageUrl: "https://i.ibb.co/M88wwsC/grocery.png"),


];
  
}