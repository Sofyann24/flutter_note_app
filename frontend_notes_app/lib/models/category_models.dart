class CategoryModel {
  final int id;
  final String nameCategory;

  CategoryModel({required this.id, required this.nameCategory});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      CategoryModel(id: json['id'], nameCategory: json['name_category']);
}
