
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// GlobalKey<ScaffoldState> keyDrawer = GlobalKey();

String kBaseUrl = 'https://cuddlingbirds-backend.vercel.app/';
// String kBaseUrl = 'http://localhost:3000/';

const kASSETURL = 'assets/image/';
const kDefaultImage = 'mainlogo.png';

const kUserDetails = 'user';
Map<String, dynamic> kUserDetailsSAVED = {};

const kUserID = 'id';
String kSavedUserID = '';

const kTOKEN = 'token';

String kTOKENSAVED = '113|Quu6fxgJbJzAnlxLNLieY2nKDTt2Laqyczy0v8qN';

Map<String, dynamic> dictUserSaved = {};

const kBaseURL_Image = 'https://bbzstage.addwebprojects.com/uploads/';

final alphaSpace = RegExp(r'^[a-zA-Z ]*$');

bool isLoggedIn = false;
RxInt indexSelectedTab = 1.obs;
RxBool isBackOnAuth = false.obs;


