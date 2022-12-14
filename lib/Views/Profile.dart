import 'package:bbz/Styles/ImageStyle.dart';
import 'package:bbz/Views/BookingHistory.dart';
import 'package:flutter/material.dart';
import './MyProfile.dart';
import './ChangePassword.dart';
import '../Styles/TextStyles.dart';
import '../Styles/ColorStyle.dart';
import '../Components/AppBarStyle.dart';
import 'package:get/get.dart';
import '../Utils/Constant.dart';
import '../Views/DrawerScreen.dart';
import '../Controller/LoginController.dart';
import '../Controller/MyProfileController.dart';
import '../Utils/Global.dart';
import '../Controller/ExamDetailController.dart';
import '../Controller/PersistentNavBarController.dart';


class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  GlobalKey<ScaffoldState> keyDrawer = GlobalKey();

  final arrIconData = [Icons.mood, Icons.history, Icons.lock];
  final arrTitle = ['My Profile'.tr, 'Booking History'.tr, 'Change Password'.tr];
  final loginController = Get.put(LoginController());
  final controllerMyProfile = Get.put(MyProfileController());
  final examDetailController = Get.put(ExamDetailController());
  // final navBarController = Get.put(PersistentNavBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyDrawer,
      drawer: DrawerScreen(),
      appBar: AppBarStyle(
        title: 'Profile'.tr,
        styleTitle: TextStylesCustom.textStyles_23
            .apply(fontWeightDelta: 1, color: ColorStyle.primaryColor_1570A5),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: ColorStyle.primaryColor_1570A5,
            size: 30,
          ),
          onPressed: () {
            keyDrawer.currentState!.openDrawer();
          },
        ),
        elevation: 0,
      ),
      body: GetBuilder(
        init: MyProfileController(),
        initState: (_) {
          controllerMyProfile.updateOnMyProfile();
          // navBarController.isNavBarActive.value = true;
        },
        builder: (_) {
          return Obx(() => Column(children: [
            Container(
              height: 2,
              color: ColorStyle.grey_DAE1E7,
            ),
            const SizedBox(
              height: 29,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                const SizedBox(
                  width: 19,
                ),
                SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset(
                    ImageStyle.account,
                    fit: BoxFit.fill,
                    color: ColorStyle.primaryColor_1570A5,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(child: Text(
                  controllerMyProfile.name.value,
                  style: TextStylesCustom.textStyles_26.apply(
                      color: ColorStyle.primaryColor_1570A5, fontWeightDelta: 1
                  ),
                )),
              ],
            ),
            const SizedBox(
              height: 27,
            ),
            Container(
              height: 2,
              color: ColorStyle.grey_DAE1E7,
            ),
            const SizedBox(
              height: 30,
            ),
            ListView.separated(
              itemCount: arrTitle.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 30,
                );
                //--------------------------------My profile---------------------->
                // InkWell(
                //   onTap: () {
                //     Navigator.push(context, MaterialPageRoute(
                //         builder: (context) => MyProfile()
                //     ));

                //     // Get.to(()=>const MyProfile());
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {

                    examDetailController.isVerityEmail(index);
                  },
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 22,
                      ),
                      Icon(
                        arrIconData[index],
                        color: ColorStyle.primaryColor_1570A5,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Text(
                        arrTitle[index],
                        style: TextStylesCustom.textStyles_14.apply(
                          color: ColorStyle.grey_5E6D77,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              height: 2,
              color: ColorStyle.grey_DAE1E7,
            ),
            const SizedBox(
              height: 32,
            ),
            //--------------------------------Logout---------------------->
            InkWell(
              onTap: (){
                loginController.logout();
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: 22,
                  ),
                  Icon(
                    Icons.power_settings_new,
                    color: ColorStyle.red_ED0925,
                    size: 22,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    'Log Out'.tr,
                    style: TextStylesCustom.textStyles_14.apply(
                      color: ColorStyle.red_ED0925,
                    ),
                  )
                ],
              ),
            ),
          ]));
        },
      ),
    );
  }
}
