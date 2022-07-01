import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:myaquaponic/dashboard.dart';
import 'package:myaquaponic/registrasi.dart';
import 'package:myaquaponic/src/screens/forgotpassword.dart';
import 'package:myaquaponic/start.dart';

// class MyApp extends StatelessWidget {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   class _LoginsPageState extends State<LoginsPage> {
//   bool _isHidden = true;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginsPage extends StatefulWidget {
  const LoginsPage({Key? key}) : super(key: key);
  @override
  _LoginsPageState createState() => _LoginsPageState();
}

class _LoginsPageState extends State<LoginsPage> {
  bool _isHidden = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;

    return MaterialApp(
        home: Scaffold(
            // appBar: AppBar(
            //   title: Text("Registrasi",
            //       style: TextStyle(
            //           fontSize: 18.0,
            //           fontWeight: FontWeight.bold,
            //           color: Color(0xff123456),
            //           fontFamily: "Poppins")),
            //   backgroundColor: Colors.white,
            //   leading: IconButton(
            //     icon: Icon(
            //       Icons.arrow_back_sharp,
            //       color: Color(0xff123456),
            //     ),
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //   ),
            // ),
            body: SafeArea(
                child: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 10),
          child: IconButton(
            icon: Icon(Icons.clear),
            iconSize: 30,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 25),
          child: Text(
            "Hello!",
            style: TextStyle(
                color: Color(0xff123456),
                fontFamily: "Poppins",
                fontSize: 50,
                fontWeight: FontWeight.bold),
          ),
        ),
        Image.asset(
          "images/logo.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4.5,
        ),
        Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff123456),
                      fontFamily: "NunitoSans"),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                validator: MultiValidator([
                  RequiredValidator(errorText: "*Wajib diisi"),
                  EmailValidator(errorText: "Email tidak valid"),
                ]),
                decoration: InputDecoration(
                  hintText: 'Masukkan Email',
                  fillColor: Color(0xffF6F9FE),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 30),
                child: Text(
                  "Kata Sandi",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff123456),
                      fontFamily: "NunitoSans"),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: MultiValidator([
                  RequiredValidator(errorText: "*Wajib diisi"),
                  MinLengthValidator(6,
                      errorText: "Kata sandi minimal 6 karakter"),
                  MaxLengthValidator(15,
                      errorText: "Kata sandi tidak boleh melebihi 15 karakter")
                ]),
                obscureText: _isHidden,
                decoration: InputDecoration(
                  hintText: 'Masukkan Kata Sandi',
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isHidden ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _isHidden = !_isHidden;
                      });
                    },
                  ),
                  fillColor: Color(0xffF6F9FE),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(top: 10.0, left: 30.0),
            //   child: TextButton(
            //     onPressed: () {
            //       // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //       //   return ForgotPassword();
            //       // }));
            //     },
            //     child: Text("Lupa Kata Sandi",
            //         style: TextStyle(
            //             color: Colors.blue,
            //             fontSize: 12.0,
            //             fontWeight: FontWeight.bold,
            //             fontFamily: "NunitoSans")),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: Container(
                  margin: EdgeInsets.only(top: 50.0),
                  width: 350,
                  height: 45,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return Dashboard();
                      }));
                    },
                    child: Text(
                      "Masuk",
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: (16.0),
                          fontFamily: "NunitoSans",
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            SafeArea(
              top: false,
              bottom: true,
              child: Container(
                  width: 350,
                  height: 45,
                  margin:
                      EdgeInsets.only(top: 10, right: 30, left: 30, bottom: 20),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      side: BorderSide(
                        width: 1.5,
                        color: Colors.blue,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RegistPages();
                      }));
                    },
                    child: Text(
                      "Daftar Baru",
                      style: TextStyle(
                          color: Color(0xff123456),
                          fontSize: (16.0),
                          fontFamily: "NunitoSans",
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 20, right: 180, left: 180),
            //   child: Text(
            //     "ATAU",
            //     style: TextStyle(color: Colors.grey.shade800),
            //   ),
            // ),

            // Padding(
            //   padding: const EdgeInsets.only(left: 130),
            //   child: Image.asset(
            //     "images/googlee.png",
            //     width: 130,
            //     height: 150,
            //   ),
            // )
          ]),
        ),
      ]),
    ))));
  }
}
