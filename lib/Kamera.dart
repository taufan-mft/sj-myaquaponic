import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  // get controller => null;
  String imageUrl = '';
  static const twentyMillis = Duration(seconds:10);
  late Timer timer;

  _initImage() async {
    final storageRef = FirebaseStorage.instance.ref().child("pictures/image.jpg");
    var url = await storageRef.getDownloadURL();
    setState(() {
      imageUrl = url;
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  void initState() {
    super.initState();
    _initImage();
    timer = new Timer.periodic(twentyMillis, (timer){
      _initImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: imageUrl != '' ? Image.network(imageUrl) : Container(),
      ),
    );
  }
}
