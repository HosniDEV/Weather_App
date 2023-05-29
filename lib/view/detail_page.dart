import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  DetailPage({
    super.key,
    required this.text,
  });

  var text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('$text'),
    );
  }
}
