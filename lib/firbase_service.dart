

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
/*  FirebaseService.privateCon();
  static final FirebaseService instance = FirebaseService.privateCon();*/

  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference ref = FirebaseFirestore.instance.collection('users').doc(
      FirebaseAuth.instance.currentUser?.uid).collection('notes');

  Future signUp(String email, String password) async {
    {
      try {
        await auth.createUserWithEmailAndPassword(
            email: email,
            password: password);
        return true;
      } on FirebaseAuthException catch (e) {

      }
    }
  }

  Future signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password);
      return true;
    } on FirebaseAuthException catch (e) {


    }
  }

  static addNote(String title, String description) async {
    CollectionReference ref = FirebaseFirestore.instance.collection('users')
        .doc(
        FirebaseAuth.instance.currentUser?.uid)
        .collection('notes');

   /* DocumentReference documentReference = ref.doc();
    await ref.doc(document.title).set({
      "title": title,
      "description": description
    });*/
    var data  = {
      'title': title,
      'description': description,
    };
     ref.add(data);
  }
}