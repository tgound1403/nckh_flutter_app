import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plant_disease/constant.dart';
import 'package:plant_disease/components/rounded_button.dart';
// For Image Processing
import 'dart:io';
import 'package:image_picker/image_picker.dart';

final ImagePicker _picker = ImagePicker();

class FunctionScreen extends StatefulWidget {
  static String id = 'function_screen';
  @override
  _FunctionScreenState createState() => _FunctionScreenState();
}

class _FunctionScreenState extends State<FunctionScreen> {
  XFile? cameraFile, galleryFile;

  selectFromCamera() async {
    cameraFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 50.0,
      maxWidth: 50.0,
    );
    setState(() {});
  }

  selectFromGallery() async {
    galleryFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 50.0,
      maxWidth: 50.0,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: myAccentColor,
        title: Row(children: [
          const SizedBox(
            width: 50,
          ),
          Text(
            'PLANT',
            style: TextStyle(
              color: mySecondaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Text(
            ' DISEASE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          )
        ]),
      ),
      backgroundColor: myAccentColor,
      body: ListView(
        children: [
          Column(children: [
            const SizedBox(height: 20),
            Text('DỰ ĐOÁN BỆNH CHO CÂY ',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.blue[900])),
            Image.asset(
              'lib/images/Home_page.png',
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Text('Chọn ảnh để hệ thống dự đoán bệnh cho cây ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontFamily: 'Poppins')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Material(
                    elevation: 5.0,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      elevation: 5.0,
                      onPressed: () {
                        selectFromGallery();
                      },
                      minWidth: 240.0,
                      height: 42.0,
                      child: const Text('Chọn file',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black12,
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Material(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    elevation: 5,
                    child: MaterialButton(
                      onPressed: selectFromCamera,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 2.0),
                        child: Icon(FontAwesomeIcons.camera,
                            color: Colors.blueAccent, size: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            RoundedButton(
                corner: BorderRadius.circular(30.0),
                color: Colors.blueAccent,
                textColor: Colors.white,
                title: 'BẮT ĐẦU',
                function: () {}),
          ]),
        ],
      ),
    );
  }
}
