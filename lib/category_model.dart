import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:avgle_viewer_flutter/data/categories.dart';

enum CategoryViewState { Busy, DataRetrived, NoData }

class CategoryModel {
  final StreamController<CategoryViewState> _stateController = 
    StreamController();

  Categories data;

  Stream<CategoryViewState> get categoryState => _stateController.stream;

  Future getCategories() async {
    _stateController.add(CategoryViewState.Busy);

    final response = await http.get('https://api.avgle.com/v1/categories');

    if (response != null && response.statusCode == 200) {
      data = Categories.fromJson(json.decode(response.body));
      _stateController.add(CategoryViewState.DataRetrived);
    } else {
      return _stateController.addError('Failed to laod data');
    }
  }
}