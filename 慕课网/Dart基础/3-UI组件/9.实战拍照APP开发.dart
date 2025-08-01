import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoApp extends StatefulWidget {
  const PhotoApp({super.key});

  @override
  State<PhotoApp> createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  List<File> list = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "实战拍照APP开发",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("实战拍照APP开发"),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: _genImages(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _pickImage(),
          tooltip: "",
          child: const Icon(Icons.add_a_photo),
        ),
      ),
    );
  }

  List<Widget> _genImages() {
    return list.map((file) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.file(
              file,
              width: 120,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              onTap: () => setState(() {
                list.remove(file);
              }),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(11),
                ),
                padding: const EdgeInsets.all(3),
                child: const Icon(
                  Icons.close,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    }).toList();
  }

  void _pickImage() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 180,
            child: Column(
              children: [
                _item('拍照', true),
                _item('从相册选择', false),
              ],
            ),
          );
        });
  }

  _item(String title, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
        title: Text(title),
        onTap: () => getImage(isTakePhoto),
        leading: isTakePhoto
            ? const Icon(Icons.camera_alt)
            : const Icon(Icons.photo_library),
      ),
    );
  }

  Future<void> getImage(bool isTakePhoto) async {
    Navigator.pop(context);
    XFile? pickedFile = await ImagePicker().pickImage(
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        list.add(File(pickedFile.path));
      });
    }
  }
}
