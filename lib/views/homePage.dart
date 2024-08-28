import 'package:flutter/material.dart';
import 'package:menu/constans/constant.dart';
import 'package:menu/views/topicsList.dart';
import 'package:menu/widgets/menuList.dart';
import 'package:menu/widgets/name.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedTopic = "Pizza";
  void updateSelectedTopic(String topic) {
    setState(() {
      selectedTopic = topic;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 225, 193),
        body: Container(
            width: ScreenSize.const_width,
            height: ScreenSize.const_height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage("assets/best.jpg"),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: ScreenSize.const_height * 0.8,
                  left: ScreenSize.const_width / 1.8,
                  child: Text(
                    restaurantName.text,
                    style: const TextStyle(
                        color: Colors.white, fontFamily: "Bride", fontSize: 50),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: ScreenSize.const_width,
                    height: ScreenSize.const_height / 1.43,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: ScreenSize.const_height / 12),
                        EditName(),
                        menuTopics(

                          onSelected: updateSelectedTopic,
                           selectedTopic: selectedTopic,
                        ),
                        menuList(
                          sellectedTopic: selectedTopic,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: ScreenSize.const_height / 4.8,
                  child: CircleAvatar(
                    radius: ScreenSize.const_width / 7.5,
                    backgroundImage: const AssetImage("assets/logo.png"),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
