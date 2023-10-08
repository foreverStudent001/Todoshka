import 'package:flutter/material.dart';

class EditList extends StatelessWidget {
  final String title;
  final String description;

  const EditList({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: Container(
        child: Center(
          child: Text(
            '$title\n\n$description',
            style: TextStyle( fontSize: 18),
          ),
        ),
      ),
    );
  }
}
