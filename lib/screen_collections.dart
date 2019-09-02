import 'dart:async';
import 'dart:convert';

import 'package:avgle_viewer_flutter/data/collection.dart';
import 'package:avgle_viewer_flutter/data/collections.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/**
 * 參考 https://book.flutterchina.club/chapter6/gridview.html
 */

Future<Collections> getCollections() async {
  final response = await http.get('https://api.avgle.com/v1/collections/0');

  if (response.statusCode == 200) {
    var result = Collections.fromJson(json.decode(response.body));
    for (Collection hihi in result.response.collections) {
      print('~~~~~~~~>>>>>   ${hihi.title}');
    }
    return result;
  } else {
    throw Exception('Failed to load data');
  }
}

class CollectionsScreen extends StatefulWidget {
  final Future<Collections> collections;

  CollectionsScreen({Key key, this.collections}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CollectionsScreenState();
  }

class CollectionsScreenState extends State<CollectionsScreen> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
//    getCollections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collections'),
      ),
      body: Center(
        child: FutureBuilder<Collections>(
          future: getCollections(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0
                  ),
                  itemCount: snapshot.data.response.collections.length,
                  itemBuilder: (context, index) {
                    var tmp = snapshot.data.response.collections[index];
                    return Text(tmp.title);
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return CircularProgressIndicator();
//            return GridView (
//              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 2,
//                childAspectRatio: 1.0
//              ),
//              children: List<Collections>.generate(, generator),
//            );
          },
        ),
      )
    );
  }
}