import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:myaquaponic/login.dart';
import 'package:myaquaponic/start.dart';

class RegistPages extends StatelessWidget {
  final GlobalKey<FormState> _registKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Registrasi",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "Poppins")),
        backgroundColor: Colors.lightBlue.shade200,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _registKey,
          child: ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 45, left: 20),
                  child: Text("Nama",
                      style: TextStyle(
                          color: Color(0xff123456),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "NunitoSans"))),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Wajib diisi ';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Masukkan Nama",
                      fillColor: Color(0xffF6F9FE),
                      filled: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 25, left: 20),
                  child: Text("No. Telp",
                      style: TextStyle(
                          color: Color(0xff123456),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "NunitoSans"))),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Wajib diisi ';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Masukkan No. Telp",
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      fillColor: Color(0xffF6F9FE),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 25, left: 20),
                  child: Text("Email",
                      style: TextStyle(
                          color: Color(0xff123456),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "NunitoSans"))),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "*Wajib diisi"),
                    EmailValidator(errorText: "Email tidak valid"),
                  ]),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Masukkan Email",
                      fillColor: Color(0xffF6F9FE),
                      filled: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 25, left: 20),
                  child: Text("Kata Sandi",
                      style: TextStyle(
                          color: Color(0xff123456),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "NunitoSans"))),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Wajib diisi ';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Masukkan Kata Sandi",
                      fillColor: Color(0xffF6F9FE),
                      filled: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
