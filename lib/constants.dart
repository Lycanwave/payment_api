import 'package:flutter/material.dart';


const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);
const kPrimaryColor = Color(0xff6621e4);
const kPrimaryLightColor = Color(0xff6621e4);

const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);


const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Please enter valid email";
const String kPassNullError = "Please enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please enter your name";
const String kPhoneNumberNullError = "Please enter your phone number";
const String kAddressNullError = "Please enter your address";
const String noInternet =
    "No internet connection available. Please check your connection.";
const String connectionIssue =
    "Connection issue! Please check your internet connection.";
const String changeDpText =
    "Please try changing your DP or upload new photos and do selfie verification again to get verified.";
const String uploadPhotoText =
    "Please upload at least two good quality photos to verify yourself ";
const String kInviteTextWhatsapp =
    'Meeting someone single has never been this easy! Download UrbanMatch and stumble upon your match at exclusive singles only events: Download Link - ';
const String base_url = "http://52.66.253.57:8000/api/v1/"; //qa base url
const String baseUrl = "http://52.66.253.57:8000/api/"; //qa base url
// const String base_url = "http://3.110.19.109:8000/api/v1/"; // release base url
// const String baseUrl = "http://3.110.19.109:8000/api/"; // release base url
// const String base_url =
//     "https://4a82-2406-7400-63-df52-8c0a-21a-3557-16c.in.ngrok.io/api/v1/"; //ngrok url
// const String baseUrl =
//     "https://4a82-2406-7400-63-df52-8c0a-21a-3557-16c.in.ngrok.io/api/"; //ngrok url

const APP_ID = '2ab81dcfb18c43f2a1f191a2c7eaec5e';
const FACE_MATCH_APP_ID = "f2b6cf";
const FACE_MATCH_APP_KEY = "6a5517f9df8d9ec29d98";

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.grey[300]!),
  );
}

