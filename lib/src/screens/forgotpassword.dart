import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myaquaponic/login.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  // final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String _email = 'email';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text("Lupa Kata Sandi"),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 10),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.blue,
                  ),
                  iconSize: 30,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  "Lupa Kata Sandi?",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Center(
                  child: Image.asset(
                    "images/forgotpass.png",
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 3,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                child: Text(
                    "Masukkan alamat email yang terdaftar. kami akan mengirim tautan untuk mereset kata sandi Anda",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "NunitoSans",
                        color: Color(0xff123456))),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 15.0),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(width: 0.8),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).primaryColor,
                          )),
                      hintText: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      )),
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                  controller: emailController,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: 360,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Color(0xff123456)),
                    child: Text(
                      "Lanjutkan",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _auth.sendPasswordResetEmail(email: _email);
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              // TextButton(
              //   child: Text('Reset'),
              //   onPressed: () {
              //     _auth.sendPasswordResetEmail(email: _email);
              //     Navigator.of(context).pop();
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
