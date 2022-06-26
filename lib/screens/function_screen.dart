import 'dart:convert';
import 'package:prefs/prefs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//File
import 'dart:async';
import 'dart:io';
//Screen and components
import 'package:plant_disease/constant.dart';
import 'package:plant_disease/components/rounded_button.dart';
import 'package:plant_disease/components/info_card.dart';
// For Image Processing
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

final ImagePicker _picker = ImagePicker();

class FunctionScreen extends StatefulWidget {
  static String id = 'function_screen';

  const FunctionScreen({Key? key}) : super(key: key);
  @override
  _FunctionScreenState createState() => _FunctionScreenState();
}

class _FunctionScreenState extends State<FunctionScreen> {
  XFile? cameraFile, galleryFile;
  File? imageToPredict;
  var predictionData;

  selectFromCamera() async {
    if (cameraFile != null) {
      cameraFile = await _picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 50.0,
        maxWidth: 50.0,
      );
      print(File(cameraFile!.path));
      // imageToPredict = cameraFile;
      imageToPredict = File(cameraFile!.path);
    }
    setState(() {});
  }

  selectFromGallery() async {
    final image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageToPredict = File(image.path);
    }
    setState(() {});
  }

  getPlantPrediction(File file, String link) async {
    var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
    var length = await file.length();
    var uri = Uri.parse(link);
    var request = http.MultipartRequest("POST", uri);
    var multipartFile = http.MultipartFile('image', stream, length,
        filename: basename(file.path));
    request.files.add(multipartFile);
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    predictionData = json.decode(response.body);
    debugPrint('returnData: $predictionData');
    return response;
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
            if (imageToPredict == null)
              const Text('Please add or take a picture')
            else
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Image.file(File(imageToPredict!.path))),
            RoundedButton(
                corner: BorderRadius.circular(30.0),
                color: Colors.blueAccent,
                textColor: Colors.white,
                title: 'BẮT ĐẦU',
                function: () async {
                  final res = await getPlantPrediction(
                      File(imageToPredict!.path),
                      "https://8acb-171-244-185-10.ap.ngrok.io/predict_image");
                  if (res.body.isNotEmpty) {
                    debugPrint(res.body);
                    var val = json.decode(res.body);
                    debugPrint("val: $val");
                    //  Display Result on App After Predict on Server
                  } else {
                    debugPrint("FAILED");
                  }
                }),
            if (predictionData != null)
              Column(
                children: [
                  Text(
                    predictionData["name"],
                    style: const TextStyle(
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InfoCard(
                      title: 'Các triệu chứng khi cây nhiễm bệnh',
                      content: predictionData['symptom']),
                  InfoCard(
                      title: 'Phương thức điều trị',
                      content: predictionData['treatment']),
                  // InfoCard('Cách điều trị các bệnh tương tự', predictionData['rc'])
                ],
              )
            else if (imageToPredict == null)
              const Text('')
            else if (imageToPredict != null)
              const Text('Ready to predict')
            else
              const Text('Failed to predict please try again')
          ]),
        ],
      ),
    );
  }
}
