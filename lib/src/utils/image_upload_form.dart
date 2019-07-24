/*
*  Filename    :   image_upload_form.dart
*  Purpose     :	
*  Created     :   2019-07-24 11:51 by Detective Conan
*  Updated     :   2019-07-24 11:51 by Detective Conan 
*  Changes     :
*/

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';

class ImageUploadForm extends StatefulWidget {
  @override
  _ImageUploadFormState createState() => _ImageUploadFormState();
}

class _ImageUploadFormState extends State<ImageUploadForm> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _image == null
            ? Icon(
                MountCarmelIcons.profile,
                size: MediaQuery.of(context).size.height / 5,
                color: Colors.brown[300],
              )
            : Image.file(
                _image,
                fit: BoxFit.contain,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
