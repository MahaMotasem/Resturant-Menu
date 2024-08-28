import 'package:flutter/material.dart';
import 'package:menu/constans/constant.dart';
import 'package:menu/models/menuModel.dart';

class menuList extends StatefulWidget {
  menuList({super.key, required this.sellectedTopic});
  final String sellectedTopic;

  @override
  State<menuList> createState() => _menuListState();
}

class _menuListState extends State<menuList> {
  Map<String, List<MenuModel>> MenuMap = {
    "Pizza": pizzaList,
    "Burger": burgerList,
    "Shawerma": shawermaList,
    "Pasta": pastaList,
    "Soup": soupList,
    "Grilled": grilledList
  };
   String? _activeImage;

  void _toggleOverlay(String imageUrl) {
    setState(() {
      if (_activeImage == imageUrl) {
        _activeImage = null; // Hide overlay if the same image is clicked
      } else {
        _activeImage = imageUrl; // Show overlay for the clicked image
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    List<MenuModel> menuList = MenuMap[widget.sellectedTopic] ?? [];
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: menuList.length,
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                width: ScreenSize.const_width / 2,
                height: ScreenSize.const_height / 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(menuList[index].img),
                      fit: BoxFit.cover,
                    ),
                    ),
                child:  GestureDetector(
                  onTap: () {
                    _toggleOverlay(menuList[index].img);
                  },
                  child:_activeImage == menuList[index].img? Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(156, 13, 13, 13),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child:
                     Column(
                      children: [

                        Container(
                          width: 50,
                          decoration: BoxDecoration(
                           color:  kprimaryColor,

                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            menuList[index].price,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          menuList[index].weight,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ) ,
                  ):null,
                ),
              ),
              Text(
                          menuList[index].name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(

                            fontSize: 15,

                            color: Colors.black,

                            fontStyle: FontStyle.italic,
                          ),
                        ),
            ],
          );
        },
      ),
    );
  }
}
