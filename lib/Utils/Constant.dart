
import 'package:flutter/material.dart';
import 'package:get/get.dart';



GlobalKey<ScaffoldState> keyDrawer = GlobalKey(); // Create a key

String kBaseUrl = 'https://cuddlingbirds-backend.vercel.app/';
// String kBaseUrl = 'http://localhost:3000/';

const kASSETURL = 'assets/image/';
const kDefaultImage = 'mainlogo.png';
const kTOKEN = 'token';
String kTOKENSAVED = '';

bool isLoggedIn = false;
RxInt indexSelectedTab = 0.obs;
RxBool isBackOnAuth = false.obs;