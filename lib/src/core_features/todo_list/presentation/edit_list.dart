import 'dart:convert';

import 'package:clippy/src/common_widgets/home.dart';
import 'package:clippy/src/common_widgets/notifications/snack_bar_mixin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

class EditList extends StatefulWidget {
  final String? title;
  final String? description;
  final String? id;

  const EditList({
    super.key,
    this.title,
    this.description,
    this.id,
  });

  @override
  State<EditList> createState() => _EditListState();
}

class _EditListState extends State<EditList> with SnackBarMixin {
  String? _id;
  String? _title;
  String? _description;

  final titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _id = widget.id;
      _title = widget.title;
      _description = widget.description;
    });
    titleController.text = widget.title ?? 'Title';
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var parseDescription = jsonDecode(_description ?? '[{}]');
    QuillController controller = _description != null
        ? QuillController(
            document: Document.fromJson(parseDescription),
            selection: TextSelection.collapsed(offset: 0),
          )
        : QuillController.basic();

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomePage()),
              )
            },
          ),
          title: Container(
            alignment: Alignment.centerLeft,
            child: TextField(
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
              controller: titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.save,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                print(_id);
                if (_id != null) {
                  final db = FirebaseFirestore.instance.collection('lists');
                  final list = <String, dynamic>{
                    "title": titleController.text,
                    "content":
                        jsonEncode(controller.document.toDelta().toJson()),
                    "date": Timestamp.now(),
                  };
                  db
                      .doc(_id) // <-- Doc ID where data should be updated.
                      .update(list)
                      .then((value) => {
                            showSnackBar(context, 'Saved', null,
                                Theme.of(context).colorScheme.primary)
                          });
                } else {
                  final db = FirebaseFirestore.instance;
                  final list = <String, dynamic>{
                    "title": titleController.text,
                    "content":
                        jsonEncode(controller.document.toDelta().toJson()),
                    "date": Timestamp.now(),
                  };
                  db.collection("lists").add(list).then((value) => {
                        //showSnackBar(context, 'Added successfully!'),
                        setState(() => _id = value.id)
                      });
                }
              },
            )
          ],
        ),
        body: QuillProvider(
          configurations: QuillConfigurations(
            controller: controller,
            sharedConfigurations: const QuillSharedConfigurations(),
          ),
          child: Column(
            children: [
              const QuillToolbar(),
              Expanded(
                child: QuillEditor.basic(
                  configurations: const QuillEditorConfigurations(
                    readOnly: false, // true for view only mode
                    padding: EdgeInsets.all(8),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
