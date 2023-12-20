import 'package:flutter/material.dart';
import 'package:mealchooser/widgets/textstyle.dart';

// ignore: must_be_immutable
class Details extends StatelessWidget {
  String recipe;
  String ingrediens;
  String recipeName;
  Details({
    Key? key,
    required this.recipe,
    required this.ingrediens,
    required this.recipeName,
  }) : super(key: key);
  void initState() {
    recipe;
    ingrediens;
    recipeName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: textStyle(
                        recipeName,
                        45,
                        FontWeight.bold,
                        Colors.deepOrange.shade900,
                        context,
                        0.42,
                        TextAlign.right,
                        top: 5,
                        bottom: 10,
                        right: 0),
                  ),
                ),
              ),
              textStyle(
                  'ingredients',
                  30,
                  FontWeight.bold,
                  Color.fromARGB(255, 51, 51, 51),
                  context,
                  0.4,
                  TextAlign.right,
                  top: 10,
                  bottom: 0,
                  right: 10),
              longText(ingrediens, Colors.grey, FontWeight.bold, 20, 4),
              SizedBox(
                height: 5,
              ),
              textStyle(
                  'How to make',
                  30,
                  FontWeight.bold,
                  Color.fromARGB(255, 51, 51, 51),
                  context,
                  0.4,
                  TextAlign.right,
                  top: 10,
                  bottom: 0,
                  right: 10),
              longText(recipe, Colors.grey, FontWeight.bold, 20, 7),
            ],
          ),
        ),
      ),
    );
  }
}
