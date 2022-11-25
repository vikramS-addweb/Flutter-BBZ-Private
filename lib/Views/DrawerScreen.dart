import 'package:bbz/Styles/ImageStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bbz/Styles/ColorStyle.dart';
import '../../Components/AppBarStyle.dart';
import '../../Styles/TextStyles.dart';
import '../../Styles/ImageStyle.dart';
import '../Components/ProgressBarCustom.dart';
import '../../Components/ElevatedButtonCustom.dart';
import '../Views/DrawerScreen.dart';
import '../Views/ContactUs.dart';
import '../Views/AboutUs.dart';
import '../Views/News.dart';
import '../Views/HowWeWork.dart';
import '../Utils/Constant.dart';
import '../Utils/Global.dart';
import 'Location.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({Key? key}) : super(key: key);

  final arrIconData = [
    SvgPicture.asset(
      ImageStyle.iconMaterialGroup,
    ),
    SvgPicture.asset(
      ImageStyle.group,
    ),
    SvgPicture.asset(
      ImageStyle.call,
    ),
    Image.asset(
      ImageStyle.location,
    ),
    SvgPicture.asset(
      ImageStyle.newspaper,
    ),
    SvgPicture.asset(
      ImageStyle.language,
    ),


  ];
  final arrTitle = ['ABOUT US', 'HOW WE WORK', 'Contact', 'Location', 'NEWS', 'LANGUAGE'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width - 80,
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Row(
                      children: [
                        // Icon(
                        //   Icons.waving_hand_outlined,
                        //   size: 60,
                        //   color: ColorStyle.primaryColor_1570A5,
                        // ),
                        Image.asset(ImageStyle.wavingHand, width: 45, height: 45,),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Text(
                            'Hello there!',
                            style: TextStylesCustom.textStyles_26.apply(
                              color: ColorStyle.primaryColor_1570A5,
                              fontWeightDelta: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 2,
                    // width: 111,
                    color: ColorStyle.grey_DAE1E7,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListView.separated(
                    itemCount: arrTitle.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 30,
                      );
                    },
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          keyDrawer.currentState!.closeDrawer();

                          switch (index) {
                            case 0:
                              AboutUs(urlCustom: 'https://bbzstage.addwebprojects.com/page/about-us',).navigateToCustom(context);
                              break;
                            case 1:
                              HowWeWork().navigateToCustom(context);
                              break;
                            case 2:
                              ContactUs().navigateToCustom(context);
                              break;
                            case 3:
                              Location(urlCustom: 'https://bbzstage.addwebprojects.com/page/locations',).navigateToCustom(context);
                              break;
                            case 4:
                              News().navigateToCustom(context);
                              break;
                            default:
                              break;
                          }
                        },
                        child: Row(
                          children: [
                            // Image.asset(arrIconData[index], width: 30, height: 30,),
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: arrIconData[index],
                            ),
                            // arrIconData[index],
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Text(
                                arrTitle[index],
                                style: TextStylesCustom.textStyles_16.apply(
                                  color: ColorStyle.grey_5E6D77,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            child: Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(7),
                    bottomRight: Radius.circular(7),
                  )),
              child: SafeArea(
                child: Image.asset(
                  ImageStyle.cancelDrawer,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            onTap: () {
              keyDrawer.currentState!.closeDrawer();
            },
          )
        ],
      ),
    );
  }
}
