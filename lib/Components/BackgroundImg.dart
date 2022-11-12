import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  const BgImage(this.data);

  final Widget data;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        margin: EdgeInsets.only(top: 50),
        child: data
        //     Column(
        //   children: [],
        // )

        );
  }
}
