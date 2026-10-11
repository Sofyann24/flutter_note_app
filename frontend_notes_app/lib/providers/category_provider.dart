import 'package:flutter/material.dart';
import 'package:notes_apps/models/models.dart';
import 'package:notes_apps/services/api_services.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> _categories = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<CategoryModel> get category => _categories;
  bool get isLoading => _isLoading;
  String? get errorMassage => _errorMessage;

  Future<void> fetchCategories() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await ApiServices.get('/category');
      final List<dynamic> data = response['data'] ?? response;

      _categories = data.map((items) {
        return CategoryModel.fromJson(items);
      }).toList();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addCategory(String nameCategory) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await ApiServices.post(
        '/category/store',
        data: {'name_category': nameCategory},
      );

      await fetchCategories();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      debugPrint('❌ Error add category: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
