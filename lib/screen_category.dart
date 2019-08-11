import 'dart:async';
import 'dart:convert';

import 'package:avgle_viewer_flutter/data/categories.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Categories> getCategories() async {
  final response = await http.get('https://api.avgle.com/v1/categories');

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

class CategoryScreenState extends State<CategoryScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

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
              return ListView.builder(
                itemCount: snapshot.data.response.categories.length,
                itemBuilder: (context, index) {
                  var tmp = snapshot.data.response.categories[index];
                  return Column(
                    children: <Widget>[
                      Card(
                        semanticContainer: false,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderOnForeground: false,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 384 / 216,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fitWidth,
                                      alignment: Alignment.topCenter,
                                      image: NetworkImage(tmp.coverUrl))
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(tmp.name),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print('This sould only be called once.');
  }
}
