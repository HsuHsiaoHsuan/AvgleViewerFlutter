import 'package:flutter/material.dart';

class CollectionsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CollectionsScreenState();
}

class CollectionsScreenState extends State<CollectionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collections'),
      ),
    );
  }
}