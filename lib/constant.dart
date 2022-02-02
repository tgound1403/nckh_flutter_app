import 'package:flutter/material.dart';

MaterialColor myAccentColor = const MaterialColor(0xffA2E4A4,{});
MaterialColor myPrimaryColor = const MaterialColor(0xffEDFAED,{});
MaterialColor mySecondaryColor = const MaterialColor(0xff1877F2,{});


const kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black26, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black45, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);