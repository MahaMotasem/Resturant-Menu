import 'package:flutter/material.dart';

class EditName extends StatefulWidget {
  const EditName({super.key});

  @override
  State<EditName> createState() => _EditNameState();
}
 TextEditingController restaurantName =
      TextEditingController(text: "Resturant");

      GlobalKey<FormState> formKey = GlobalKey();

class _EditNameState extends State<EditName> {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          restaurantName.text,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: 'Schyler',
          ),
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
           onPressed: () {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text("Enter Resturant Name"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Form(
                          key: formKey,
                          child: TextFormField(
                            controller: restaurantName,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter a name";
                              }
                              return null;
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                restaurantName.text = restaurantName.text;
                              });
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  );
                });
          },

          icon: Icon(
            Icons.edit,
            size: 30,
          ),
        ),
      ],
    );
  }
}
