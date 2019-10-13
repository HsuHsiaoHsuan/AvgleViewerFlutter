import 'dart:async';
import 'dart:convert';

import 'package:avgle_viewer_flutter/data/collections.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// 參考 https://book.flutterchina.club/chapter6/gridview.html

// try put getCollections into CollectionsScreenState
Future<Collections> getCollections() async {
  final response = await http.get('https://api.avgle.com/v1/collections/0');

  if (response.statusCode == 200) {

    final Collections result = Collections.fromJson(json.decode(response.body));

//    setState(() {
//      _selectedIndex = index;
      // update _hasMoreItems if there are more
//      _hasMoreItems = result.response.hasMore;
//      _loadingMore = false;
//    });


    return result;
  } else {
    throw Exception('Failed to load data');
  }
}

class CollectionsView extends StatefulWidget {
  final Future<Collections> collections;

  CollectionsView({Key key, this.collections}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CollectionsViewState();
}

class CollectionsViewState extends State<CollectionsView>
    with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                    crossAxisCount: 3,
                    childAspectRatio: 1.2
                  ),
                  itemCount: snapshot.data.response.collections.length,
                  itemBuilder: (context, index) {
                    var tmp = snapshot.data.response.collections[index];
                    return Card(
                      semanticContainer: false,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderOnForeground: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 320 / 180,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.topCenter,
                                  image: NetworkImage(tmp.coverUrl)
                                )
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: EdgeInsets.only(top:6, left: 6, bottom: 6),
                              child: Text(
                                tmp.title,
                                style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.0),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return CircularProgressIndicator();
          },
        ),
      )
    );
  }

  @override
  void initState() {
    super.initState();
    print('This sould only be called once in screen_collections.');
  }
}