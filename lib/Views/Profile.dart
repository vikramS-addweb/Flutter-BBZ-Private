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



class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyDrawer,
      drawer: DrawerScreen(),
      appBar: AppBarStyle(
        title: 'Profile',
        styleTitle: TextStylesCustom.textStyles_20
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
            Icon(
              Icons.account_circle_outlined,
              color: ColorStyle.primaryColor_1570A5,
              size: 45,
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
        //--------------------------------My profile---------------------->
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => MyProfile()
            ));

            // Get.to(()=>const MyProfile());
          },
          child: Row(
            children: [
              const SizedBox(
                width: 22,
              ),
              Icon(
                Icons.mood,
                color: ColorStyle.primaryColor_1570A5,
                size: 25,
              ),
              const SizedBox(
                width: 18,
              ),
              Text(
                'My Profile',
                style: TextStylesCustom.textStyles_14.apply(
                  color: ColorStyle.grey_5E6D77,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        //--------------------------------Booking History---------------------->
        InkWell(
          onTap: () {
            // Get.to(()=> const BookingHistory());
          },
          child: Row(
            children: [
              const SizedBox(
                width: 22,
              ),
              Icon(
                Icons.history,
                color: ColorStyle.primaryColor_1570A5,
                size: 25,
              ),
              const SizedBox(
                width: 18,
              ),
              Text(
                'Booking History',
                style: TextStylesCustom.textStyles_14.apply(
                  color: ColorStyle.grey_5E6D77,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        //--------------------------------Change Password---------------------->
        InkWell(onTap: (){
          Get.to(()=> const ChangePassword());
        },
          child: Row(
            children: [
              const SizedBox(
                width: 22,
              ),
              Icon(
                Icons.lock,
                color: ColorStyle.primaryColor_1570A5,
                size: 25,
              ),
              const SizedBox(
                width: 18,
              ),
              Text(
                'Change Password',
                style: TextStylesCustom.textStyles_14.apply(
                  color: ColorStyle.grey_5E6D77,
                ),
              )
            ],
          ),
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
              size: 28,
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
