class CategoryModels {
  final int id;
  final String nameCategory;

  CategoryModels({required this.id, required this.nameCategory});

  factory CategoryModels.fromJson(Map<String, dynamic> json) =>
      CategoryModels(id: json['id'], nameCategory: json['name_category']);
}
