import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  File ? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:const Text("Select Image"),backgroundColor: Colors.lightBlue),
        body: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: _pickimagefromgallery, icon:const Icon(Icons.camera),iconSize: 50),
                IconButton(onPressed: _pickimagefromcamera, icon:const Icon(Icons.folder),iconSize: 50),
              ],
            ),
            _selectedImage != null ? Image.file(_selectedImage!) :const Text("Please Selecte Image")
          ]
        )
      ),
    );
  }

  Future _pickimagefromgallery() async {
    final returnImage =  await ImagePicker().pickImage(source: ImageSource.gallery);

    if(returnImage == null) return;
    setState(() {
      _selectedImage = File(returnImage.path);
    });

  }
  
  Future _pickimagefromcamera() async {
    final returnImage =  await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _selectedImage = File(returnImage!.path);
    });

  }
}