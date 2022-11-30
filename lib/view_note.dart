import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class ViewNote extends StatefulWidget {
  final Map data;
  final DocumentReference ref;

  const ViewNote({super.key, required this.data, required this.ref});

  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  String? title;
  String? description;
  bool isEdit = true;

  Future<void> delete() async {
    await widget.ref.delete();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    title = widget.data['title'];
    description = widget.data['description'];
    return Scaffold(
      appBar: AppBar(
        actions: [ElevatedButton(onPressed: () {
          save();
        }, child: Icon(Icons.save_alt_outlined)),
          ElevatedButton(
              onPressed: () {
                isEdit = !isEdit;
              },
              child: Icon(Icons.edit)),
          ElevatedButton(onPressed: () {delete();}, child: Icon(Icons.delete))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: title,
              enabled: isEdit,
              onChanged: (value) {
                title = value;
              },
            ),
            TextFormField(
              initialValue: description,
              enabled: isEdit,
              onChanged: (value) {
                description = value;
              },
            ),
          ],
        ),
      ),
    );
  }

  save() async {
    await widget.ref.update({'title': title, 'description': description});
    Navigator.pop(context);
  }
}