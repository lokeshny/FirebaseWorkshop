import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:workshop6/note_page.dart';

import 'firbase_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  FirebaseService firebaseService = FirebaseService();

  String email = " ";
  String password = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: 'email'
              ),
            ),
          ),
          Container(
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: 'password'
              ),

            ),

          ),
          ElevatedButton(onPressed: () async {
          dynamic  result = await firebaseService.signUp(
                emailController.text, passwordController.text);
          if(result == null){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(seconds: 1),
                content: Text('Not existt')));
          } else{
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NotePage()));
          }
            
          }, child: Text('Register')),

        ],
      ),
    );
  }
}
