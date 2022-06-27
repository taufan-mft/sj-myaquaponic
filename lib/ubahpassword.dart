import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

class UbahPassword extends StatefulWidget {
  @override
  _UbahPasswordState createState() => _UbahPasswordState();
}

class _UbahPasswordState extends State<UbahPassword> {
  final GlobalKey<FormState> _UbahpassKey = GlobalKey<FormState>();

  bool _isHidden = true;
  bool _isHiddens = true;
  bool _isHiddenss = true;

  String _password = '';

  String _confirmPassword = '';

  void _trySubmitForm() {
    final isValid = _UbahpassKey.currentState!.validate();
    if (isValid) {
      print(_password);
      print(_confirmPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          // title: new Text(
          //   "Ubah Kata Sandi",
          //   style: TextStyle(
          //       fontSize: 18,
          //       fontWeight: FontWeight.bold,
          //       fontFamily: "Poppins",
          //       color: Color(0xff123456)),
          // ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            icon: GestureDetector(
              child: Icon(
                Icons.arrow_back,
                color: Colors.blue,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              FocusScope.of(context).requestFocus(new FocusNode());
            },
          ),
        ),
        body: SafeArea(
            child: Form(
                key: _UbahpassKey,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 20),
                          child: Text(
                            "Ubah Kata Sandi",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Image.asset(
                            "images/password.png",
                            width: MediaQuery.of(context).size.width / 1,
                            height: MediaQuery.of(context).size.width / 3,
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 30, top: 60),
                        //   child: Text("Kata Sandi Saat Ini",
                        //       style: TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: 14,
                        //           fontFamily: "NunitoSans",
                        //           color: Color(0xff123456))),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 60, right: 30, left: 30),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return '*Kata Sandi Wajib diisi';
                                  }
                                  if (value.trim().length < 6) {
                                    return 'Kata sandi minimal 6 karakter';
                                  }

                                  return null;
                                },
                                obscureText: _isHiddenss,
                                decoration: InputDecoration(
                                  hintText: 'Kata Sandi Saat Ini',
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  fillColor: Color(0xffF6F9FE),
                                  filled: true,
                                  suffixIcon: IconButton(
                                    icon: Icon(_isHiddenss
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _isHiddenss = !_isHiddenss;
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 30, top: 25),
                        //   child: Text("Kata Sandi Baru",
                        //       style: TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: 14,
                        //           fontFamily: "NunitoSans",
                        //           color: Color(0xff123456))),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 30, left: 30),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return '*Kata Sandi Wajib diisi';
                                  }
                                  if (value.trim().length < 6) {
                                    return 'Kata sandi minimal 6 karakter';
                                  }

                                  return null;
                                },
                                obscureText: _isHidden,
                                onChanged: (value) => _password = value,
                                decoration: InputDecoration(
                                  hintText: 'Kata Sandi Baru',
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  fillColor: Color(0xffF6F9FE),
                                  filled: true,
                                  suffixIcon: IconButton(
                                    icon: Icon(_isHidden
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _isHidden = !_isHidden;
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 30, top: 25),
                        //   child: Text("Konfirmasi Kata Sandi",
                        //       style: TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: 14,
                        //           fontFamily: "NunitoSans",
                        //           color: Color(0xff123456))),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 30, left: 30),
                          child: Column(children: [
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '*Kata Sandi Wajib diisi';
                                }

                                if (value != _password) {
                                  return 'Konfirmasi kata sandi tidak sesuai';
                                }

                                return null;
                              },
                              obscureText: _isHiddens,
                              onChanged: (value) => _confirmPassword = value,
                              decoration: InputDecoration(
                                hintText: 'Silakan Konfirmasi Kata Sandi',
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 10, 10, 0),
                                fillColor: Color(0xffF6F9FE),
                                filled: true,
                                suffixIcon: IconButton(
                                  icon: Icon(_isHiddens
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      _isHiddens = !_isHiddens;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 75),
                              child: Container(
                                width: 320,
                                height: 45,
                                child: OutlinedButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      side: BorderSide(
                                        width: 1.5,
                                        color: Color(0xff123456),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (!_UbahpassKey.currentState!
                                          .validate()) {
                                        return;
                                      }

                                      _trySubmitForm;

                                      int count = 0;
                                      Navigator.popUntil(context, (route) {
                                        return count++ == 1;
                                      });

                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UbahPassword()),
                                      );
                                    },
                                    child: Text(
                                      "Konfirmasi",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff123456),
                                          fontFamily: "NunitoSans"),
                                    )),
                              ),
                            ),
                          ]),
                        )
                      ]),
                ))));
  }
}
