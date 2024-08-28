import 'package:flutter/material.dart';
import 'package:menu/constans/constant.dart';
import 'package:menu/widgets/topicClass.dart';

class menuTopics extends StatefulWidget {
  const menuTopics(
      {super.key, required this.selectedTopic, required this.onSelected});
  final String selectedTopic;
  final ValueChanged<String> onSelected;
  @override
  State<menuTopics> createState() => _menuTopicsState();
}

class _menuTopicsState extends State<menuTopics> {
  String? selectedTopic;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.const_height / 7,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topicsList.length,
        itemBuilder: (context, index) {
          isSelected = topicsList[index].title == widget.selectedTopic;
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.onSelected(topicsList[index].title);
                });
              },
              child: Column(children: [
                Image.asset(
                  topicsList[index].image,
                  width: isSelected
                      ? ScreenSize.const_width / 10
                      : ((topicsList[index].image == "assets/icons/bbq2.png")
                          ? ScreenSize.const_width / 7.6
                          : ScreenSize.const_width / 8),
                ),
                Text(topicsList[index].title,
                    style: const TextStyle(fontFamily: "Schyler", fontSize: 18)),
              ]),
            ),
          );
        },
      ),
    );
  }
}
