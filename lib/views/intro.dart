import 'package:flutter/material.dart';
import 'package:menu/constans/constant.dart';
import 'package:menu/views/homePage.dart';


class welcomeScr extends StatefulWidget {
  const welcomeScr({super.key});

  @override
  State<welcomeScr> createState() => _welcomeScrState();
}

class _welcomeScrState extends State<welcomeScr> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(
         builder: (BuildContext context) {
          return Home();
         },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: ScreenSize.const_width / 7.5,
              backgroundImage: const AssetImage("assets/logo.png"),
            ),
            const SizedBox(
              height: 50,
            ),
            CircularProgressIndicator(
              color: const Color.fromARGB(255, 255, 195, 68),
            ),
          ],
        ),
      ),
    );
  }
}
