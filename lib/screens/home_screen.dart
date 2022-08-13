import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plant_disease/components/rounded_button.dart';
import 'package:plant_disease/constant.dart';
import 'function_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myAccentColor,
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
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Colors.blue[900],
                      // fontFamily: 'Poppins'
                    )),
                Image.asset(
                  'lib/images/Home_page.png',
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Text(
                      'Phân tích nhanh bệnh lý của cây trồng, tìm ra giải pháp điều trị phù hợp để tăng năng suất cho cây.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      )),
                ),
                RoundedButton(
                    corner: BorderRadius.circular(30.0),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    title: 'BẮT ĐẦU',
                    function: () {
                      Navigator.pushNamed(context, FunctionScreen.id);
                    }),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '"Nếu ai cũng có thể trồng một cái cây trong cuộc đời thì nỗi cô đơn chỉ còn là đứa trẻ của niềm vui"',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]),
                ),
                Text(
                  '-Trồng một cái cây trong cuộc đời-',
                  style: TextStyle(fontSize: 14, color: Colors.blue[900]),
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
                              'Sử dụng trí tuệ nhân tạo để dự đoán bệnh cho cây thông qua hình ảnh bạn chụp',
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
                              'Diễn đàn',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Nơi bạn có thể giao lưu hỏi đáp với những người khác có chung tình yêu với sức khỏe cây trồng',
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
                              'Đề xuất',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Sử dụng trí tuệ nhân tạo để đề xuất cây trồng hoặc phân bón phù hợp cho đất trồng của bạn',
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(28.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: const [
            //           Text('ABOUT US',
            //               style: TextStyle(
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.bold,
            //               )),
            //           Text(
            //             'Our mission',
            //           ),
            //           Text(
            //             'Our team',
            //           ),
            //           Text(
            //             'Corporate Sponsor',
            //           ),
            //           Text(
            //             'Financial',
            //           ),
            //           Text(
            //             'Media Center',
            //           )
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.all(28.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: const [
            //           Text('ABOUT US',
            //               style: TextStyle(
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.bold,
            //               )),
            //           Text(
            //             'Our mission',
            //           ),
            //           Text(
            //             'Our team',
            //           ),
            //           Text(
            //             'Corporate Sponsor',
            //           ),
            //           Text(
            //             'Financial',
            //           ),
            //           Text(
            //             'Media Center',
            //           )
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(height:20),
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
