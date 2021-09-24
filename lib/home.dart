import 'package:flutter/material.dart';

import 'nim_generator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String email = 'example@gmail.com';
  String password = '123456';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(String email, String password) {
    if (email == this.email && password == this.password) {
      print("Login berhasil");
    } else {
      print("Email atau password salah");
    }
  }

  @override
  Widget build(BuildContext context) {
    // var appBarHeight = AppBar().preferredSize.height;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("First Apps"),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          alignment: Alignment.center,
          // padding: EdgeInsets.all(16),
          // margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height / 5,
                color: Colors.blue,
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: size.height / 5,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: size.height / 5,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: size.height / 5,
                      color: Colors.pink,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: size.height / 5,
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: size.height / 5,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => NimGenerator(idStudent: '12',),
                    ),
                  );
                }, 
                child: Text("Move Page")
              )
              // TextField(
              //   controller: emailController,
              //   decoration: InputDecoration(
              //     hintText: "Masukkan Email"
              //   ),
              // ),
              // TextField(
              //   obscureText: true,
              //   controller: passwordController,
              //   decoration: InputDecoration(
              //     hintText: "Masukkan Password"
              //   ),
              // ),
              // ElevatedButton(onPressed: (){
              //   login(emailController.text, passwordController.text);
              // }, child: Text("Login"))
            ],
          )),
    );
  }
}
