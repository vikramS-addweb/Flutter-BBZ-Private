
import 'package:flutter/material.dart';
import 'package:get/get.dart';



// GlobalKey<ScaffoldState> keyDrawer = GlobalKey();

String kBaseUrl = 'https://cuddlingbirds-backend.vercel.app/';
// String kBaseUrl = 'http://localhost:3000/';

const kASSETURL = 'assets/image/';
const kDefaultImage = 'mainlogo.png';
const kTOKEN = 'token';
String kTOKENSAVED = '113|Quu6fxgJbJzAnlxLNLieY2nKDTt2Laqyczy0v8qN';
const networkImage = 'https://bbzstage.addwebprojects.com/uploads/';

bool isLoggedIn = false;
RxInt indexSelectedTab = 0.obs;
RxBool isBackOnAuth = false.obs;