import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String? titel;
  String? descritpion;

  Note({required this.titel, required this.descritpion});

  static Note toJason(QueryDocumentSnapshot<Object?> element) {
    return Note(titel: element['titel'], descritpion: element['descritpion']);
  }

  static Note fromJson(Map map) {
    return Note(titel: map['titel'], descritpion: map['descritpion']);
  }
}
