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
import '../Views/BookingHistory.dart';
import '../Components/BottomNavBarCustom.dart';


class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  final arrIconData = [Icons.mood, Icons.history, Icons.lock];
  final arrTitle = ['My Profile', 'Booking History', 'Change Password'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyDrawer,
      drawer: DrawerScreen(),
      appBar: AppBarStyle(
        title: 'Profile',
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
      bottomNavigationBar: bottomNavBarCustom(),
      body: Column(children: [
        Container(
          height: 2,
          color: ColorStyle.grey_DAE1E7,
        ),
        const SizedBox(
          height: 29,
        ),
        Row(
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
            Text(
              'John Doe',
              style: TextStylesCustom.textStyles_26.apply(
                  color: ColorStyle.primaryColor_1570A5, fontWeightDelta: 1),
            )
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
                switch (index) {
                  case 0:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyProfile()));
                    break;
                  case 1:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookingHistory()));
                    break;
                  case 2:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChangePassword()));
                    break;
                  default:
                    break;
                }
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
        Row(
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
              'Log Out',
              style: TextStylesCustom.textStyles_14.apply(
                color: ColorStyle.red_ED0925,
              ),
            )
          ],
        ),
      ]),
    );
  }
}
