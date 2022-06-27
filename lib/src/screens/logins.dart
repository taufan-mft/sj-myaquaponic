import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myaquaponic/dashboard.dart';
import 'package:myaquaponic/navigasi/navigasi.dart';
import 'package:myaquaponic/src/screens/forgotpassword.dart';
import 'package:myaquaponic/src/screens/register.dart';
import 'package:myaquaponic/start.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String email = '_email';
  String password = '_password';
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: formkey,
              child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light,
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.white,
                      child: SingleChildScrollView(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // IconButton(
                            //   icon: Icon(Icons.arrow_back),
                            //   onPressed: () {
                            //     Navigator.pop(context);
                            //   },
                            // ),

                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Image.asset(
                                "images/hello.png",
                                width: MediaQuery.of(context).size.width / 2,
                                height: MediaQuery.of(context).size.width / 2.5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                "Selamat Datang!",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 5),
                            //   child: Text(
                            //     "Masuk untuk melanjutkan",
                            //     style: TextStyle(
                            //       fontSize: 16,
                            //       color: Colors.black,
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 40),
                            //   child: Text(
                            //     "Email",
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.bold, fontSize: 18),
                            //   ),
                            // ),
                            SizedBox(height: 50),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {
                                email = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "*Wajib diisi";
                                }
                              },
                              textAlign: TextAlign.start,
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Email',
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 20),
                            //   child: Text(
                            //     "Kata Sandi",
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.bold, fontSize: 18),
                            //   ),
                            // ),
                            SizedBox(height: 20),
                            TextFormField(
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "*Wajin diisi";
                                }
                              },
                              onChanged: (value) {
                                password = value;
                              },
                              textAlign: TextAlign.start,
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Kata Sandi',
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  )),
                            ),
                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ResetPassword(),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Lupa Kata Sandi?",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.blue),
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 20),
                            //   child: Text(
                            //     "Lupa Kata Sandi?",
                            //     style:
                            //         TextStyle(fontSize: 14, color: Colors.blue),
                            //   ),
                            // ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.only(top: 10.0, left: 30.0),
                            //   child: TextButton(
                            //     onPressed: () {
                            //       Navigator.push(context,
                            //           MaterialPageRoute(builder: (context) {
                            //         return ForgotPassword();
                            //       }));
                            //     },
                            //     child: Text("Lupa Kata Sandi",
                            //         style: TextStyle(
                            //             color: Colors.blue,
                            //             fontSize: 12.0,
                            //             fontWeight: FontWeight.bold,
                            //             fontFamily: "NunitoSans")),
                            //   ),
                            // ),
                            SizedBox(height: 50),
                            Container(
                              width: 360,
                              height: 50,
                              // margin: EdgeInsets.only(top: 30),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    shape: StadiumBorder(),
                                    backgroundColor: Color(0xff123456)),
                                child: Text(
                                  "Masuk",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    setState(() {
                                      isloading = true;
                                    });
                                    try {
                                      await _auth.signInWithEmailAndPassword(
                                          email: email, password: password);

                                      await Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (contex) => NavPage(),
                                        ),
                                      );

                                      setState(() {
                                        isloading = false;
                                      });
                                    } on FirebaseAuthException catch (e) {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: Text("Maaf! Login Gagal"),
                                          content: Text('${e.message}'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              },
                                              child: Text('Okay'),
                                            )
                                          ],
                                        ),
                                      );
                                      print(e);
                                    }
                                    setState(() {
                                      isloading = false;
                                    });
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 30),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => RegistrationScreen(),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Belum punya akun?",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black87),
                                  ),
                                  SizedBox(width: 10),
                                  Hero(
                                    tag: '1',
                                    child: Text(
                                      'Daftar',
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
