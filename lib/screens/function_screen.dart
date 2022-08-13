import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//File
import 'dart:async';
import 'dart:io';
// import 'dart:ui';
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
  bool isLoading = false;

  selectFromCamera() async {
    final image =
    await ImagePicker.platform.pickImage(source: ImageSource.camera);
    if (image != null) {
      imageToPredict = File(image.path);
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
            const SizedBox(height: 15),
            Text('DỰ ĐOÁN BỆNH CHO CÂY ',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.blue[900])),
            Image.asset(
              'lib/images/Home_page.png',
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 20),
            const Text('Chọn hoặc chụp ảnh để hệ thống dự đoán ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontFamily: 'Poppins')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
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
                      child: Text( imageToPredict == null ? 'Chọn ảnh' : 'Chọn ảnh khác',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black26,
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
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
              const Text('')
            else
              Material (
                borderRadius: BorderRadius.all(Radius.circular(15)),
                elevation: 5,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Image.file(File(imageToPredict!.path))),),
            !isLoading ? RoundedButton(
                corner: BorderRadius.circular(30.0),
                color: Colors.blueAccent,
                textColor: Colors.white,
                title: 'BẮT ĐẦU',
                function: () async {
                  setState(() {
                    predictionData = null;
                    isLoading = true;
                  });
                  final res = await getPlantPrediction(
                      File(imageToPredict!.path),
                      "https://lobster-app-rken7.ondigitalocean.app/predict_image");
                  if (res.body.isNotEmpty) {
                    setState(() {
                      isLoading = false;
                    });
                  } else {
                    debugPrint("FAILED");
                  }
                }) : const SizedBox(height: 20),
            if (predictionData != null && imageToPredict != null)
              Column(
                children: [
                  Text(
                    predictionData["name"],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (predictionData['symptom'] != "")
                  InfoCard(
                      title: 'Các triệu chứng khi cây nhiễm bệnh',
                      content: predictionData['symptom']),
                  if (predictionData['treatment'] != "")
                    InfoCard(
                      title: 'Phương thức điều trị',
                      content: predictionData['treatment']),
                  if (predictionData['rc'] != "")
                    InfoCard(
                      title: 'Cách điều trị các bệnh tương tự',
                      content: predictionData['rc'].join("\n"))
                ],
              )
            else if (predictionData == null && imageToPredict == null)
              const Text('')
            else if (predictionData == null && imageToPredict != null)
              isLoading
                  ? Column(
                      children: [
                        const Text('Đang dự đoán, vui lòng chờ...',
                            style: TextStyle(fontSize: 16)),
                        const SizedBox(
                          height: 20,
                        ),
                        const CircularProgressIndicator(strokeWidth: 5.0),
                        predictionData != null ? const SizedBox(height: 0) : const SizedBox(height: 20)
                      ],
                    )
                  : const Text('Sẵn sàng để dự đoán',
                      style: TextStyle(fontSize: 16))
            else
              const Text('Đã có lỗi xảy ra, vui lòng thử lại',
                  style: TextStyle(fontSize: 16))
          ]),
        ],
      ),
    );
  }
}
