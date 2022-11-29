import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:workshop6/firbase_service.dart';
import 'package:workshop6/rigister_page.dart';

import 'note_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseService firebaseService = FirebaseService();

  String email = " ";
  String password = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'email'),
            ),
          ),
          Container(
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'password'),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
               final isSuccess =  await firebaseService.signIn(
                    emailController.text, passwordController.text);

               if(isSuccess) {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>NotePage()));
               }
              },
              child: Text('Login')),
          SizedBox(
            height: 12,
          ),
          RichText(text: TextSpan(
              text: "Creat?",
              style: TextStyle(
                  color: Colors.black87
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()))

          ))
        ],
      ),
    );
  }
}
