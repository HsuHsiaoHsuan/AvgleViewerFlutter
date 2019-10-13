import 'package:flutter/material.dart';

import 'package:avgle_viewer_flutter/category_model.dart';
import 'package:avgle_viewer_flutter/category_model.dart' as prefix0;

class CategoryView extends StatefulWidget {
  CategoryView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CategoryViewState();
}

class CategoryViewState extends State<CategoryView>
    with AutomaticKeepAliveClientMixin {
  final model = CategoryModel();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    print('This sould only be called once in screen_collections.');
    model.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: model.categoryState,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            if (!snapshot.hasData ||
                snapshot.data == prefix0.CategoryViewState.Busy) {
              return CircularProgressIndicator();
            }

            if (snapshot.data == prefix0.CategoryViewState.NoData) {
              return Text('Failed to laod data');
            }
            return ListView.builder(
              itemCount: model.data.response.categories.length,
              itemBuilder: (context, index) {
                var tmp = model.data.response.categories[index];
                return GestureDetector(
                    onTap: () {
                      print('object');
                    },
                    child: Card(
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
                                      image: NetworkImage(tmp.coverUrl))),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 10, left: 15, bottom: 10),
                              child: Text(
                                tmp.name,
                                style: DefaultTextStyle.of(context)
                                    .style
                                    .apply(fontSizeFactor: 1.3),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                );
              },
            );
          },
        ),
      ),
    );
  }
}
