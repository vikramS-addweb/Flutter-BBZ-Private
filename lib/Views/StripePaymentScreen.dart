import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import '../Components/AppBarStyle.dart';
import './DrawerScreen.dart';
import '../Utils/Constant.dart';

class StripePaymentScreen extends StatefulWidget {
  @override
  State<StripePaymentScreen> createState() => _StripePaymentScreenState();
}

class _StripePaymentScreenState extends State<StripePaymentScreen> {
  GlobalKey<ScaffoldState> keyDrawer = GlobalKey();
  CardFieldInputDetails? _card = CardFieldInputDetails(complete: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.black,
      key: keyDrawer,
      drawer: DrawerScreen(),
      // bottomNavigationBar: bottomNavBarCustom(),
      appBar: AppBarStyle(
        title: 'Payment',
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
        styleTitle: TextStylesCustom.textStyles_23.apply(
          color: ColorStyle.primaryColor_1570A5,
          fontWeightDelta: 1,
        ),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardFormField(
                onCardChanged: (card) {
                  setState(() {
                    _card = card;
                  });
                },
                controller: CardFormEditController(),),
            ),
            if(_card?.complete ?? false)
              ElevatedButton(
                onPressed: ((){}),
                child: Text('Pay'),
              )

          ],
        ),
      ),
    );
  }
}