import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plant_disease/components/rounded_button.dart';
import 'package:plant_disease/constant.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myAccentColor,
      appBar: AppBar(
        // elevation: 5,
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
      body: Stack(children: [
        ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('SINH TRẮC BỆNH LÝ CÂY TRỒNG',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.blue[900])),
                Image.asset(
                  'lib/images/Home_page.png',
                  fit: BoxFit.fill,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  child: Text(
                      'Phân tích nhanh bệnh lý của cây trồng, tìm ra giải pháp điều trị phù hợp để tăng năng suất cho cây.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, fontFamily: 'Poppins')),
                ),
                RoundedButton(
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    title: 'BẮT ĐẦU',
                    function: () {}),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '"Em có biết tại sao lá cây lại màu xanh"',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]),
                ),
                Text(
                  '-Câu châm ngôn gì đó-',
                  style: TextStyle(fontSize: 16, color: Colors.blue[900]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 88),
                  child: Material(
                      color: Colors.white,
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Dự đoán',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Sử dụng công nghệ gì đó để tìm ra loại bệnh mà cây đang mắc phải...',
                            )
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 88),
                  child: Material(
                      color: Colors.white,
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Dự đoán',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Sử dụng công nghệ gì đó để tìm ra loại bệnh mà cây đang mắc phải...',
                            )
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 88),
                  child: Material(
                      color: Colors.white,
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Dự đoán',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Sử dụng công nghệ gì đó để tìm ra loại bệnh mà cây đang mắc phải...',
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('ABOUT US',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        'Our mission',
                      ),
                      Text(
                        'Our team',
                      ),
                      Text(
                        'Corporate Sponsor',
                      ),
                      Text(
                        'Financial',
                      ),
                      Text(
                        'Media Center',
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('ABOUT US',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        'Our mission',
                      ),
                      Text(
                        'Our team',
                      ),
                      Text(
                        'Corporate Sponsor',
                      ),
                      Text(
                        'Financial',
                      ),
                      Text(
                        'Media Center',
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(FontAwesomeIcons.facebookF,
                          color: Colors.black, size: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(FontAwesomeIcons.google,
                          color: Colors.black, size: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(FontAwesomeIcons.github,
                          color: Colors.black, size: 18),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
