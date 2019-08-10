import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<http.Response> getCategory() {
  return http.get('https://api.avgle.com/v1/categories');
}

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CategoryScreenState();
}

class CategoryScreenState extends State<CategoryScreen> with AutomaticKeepAliveClientMixin {
  int _counter = 0;

  void _incrememtnCounter() {
    setState(() {
      _counter++;
    });
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('HELLO:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrememtnCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}