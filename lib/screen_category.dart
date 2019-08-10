import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:avgle_viewer_flutter/data/categories.dart';

Future<Categories> getCategories() async {
  final response = 
      await http.get('https://api.avgle.com/v1/categories');

  if (response.statusCode == 200) {
    return Categories.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class CategoryScreen extends StatefulWidget {
  final Future<Categories> categories;

  CategoryScreen({Key key, this.categories}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CategoryScreenState();
}

class CategoryScreenState extends State<CategoryScreen> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print('This sould only be called once.');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: Center(
        child: FutureBuilder<Categories>(
          future: getCategories(), 
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.response.categories[0].name);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}