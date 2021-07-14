import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  // const DetailsPage({Key? key}) : super(key: key);
  final String imdbId;
  DetailsPage({required this.imdbId});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie Detail'),),
      body: Text('Details for ${widget.imdbId} '),
    );
  }
}
