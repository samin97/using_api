import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_api/main_screens/home_screen.dart';

import '../global/error_dialog.dart';
import '../models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  formValidation() {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      loginNow();
    } else {
      showDialog(
          context: context,
          builder: (c) {
            return const ErrorDialog(
              message: "Please write email/password",
            );
          });
    }
  }

  Future loginNow() async {
    LoginModel user = LoginModel(email: '', password: '');
    setState(() {
      user.email = usernameController.text.trim();
      String base64password = passwordController.text.trim();
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      String encoded = stringToBase64.encode(base64password);
      user.password = encoded;
    });

    var response = await http.post(
        Uri.parse("http://103.69.126.198:8080/Api/Token/Create"),
        body: user);
    print(user);
    if (response.statusCode == 200) {
      var s = json.decode(response.body);
      print(s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'User Name'),
                controller: usernameController,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Password'),
                controller: passwordController,
              ),
              ElevatedButton(
                  onPressed: () {
                    formValidation();
                  },
                  child: Text("Sumbit")),


              // this is to directly access homepage as i was looking to complete te cart
              ElevatedButton(
                  onPressed: () {
                    Route newRoute =
                        MaterialPageRoute(builder: (_) => const HomeScreen());
                    Navigator.pushReplacement(context, newRoute);
                  },
                  child: Text("homepage"))
            ],
          ),
        ),
      ),
    );
  }
}
