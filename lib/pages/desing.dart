import 'package:flutter/material.dart';
import 'package:mealchooser/breakfast/details.dart';
import 'package:mealchooser/widgets/button.dart';
import 'package:mealchooser/widgets/textstyle.dart';

columndesign(
  String nameOfRecipe,
  BuildContext context,
  String imageOfRecipe,
  String des,
  String recipe,
  void Function()? onpressed,
) {
  return Column(
    children: <Widget>[
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            stylishButton('love', Icons.favorite_border, onpressed, context),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Align(
                alignment: Alignment.center,
                child: textStyle(nameOfRecipe, 20, FontWeight.bold,
                    Colors.black, context, 0, TextAlign.right,
                    top: 0, bottom: 20, right: 0),
              ),
            ),
            stylishButton('recipe', Icons.cookie_outlined, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Details(
                            recipe: recipe,
                            ingrediens: des,
                            recipeName: nameOfRecipe,
                          )));
            }, context),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: 25.0,
          right: 25.0,
          top: 10,
        ),
        child: Container(
          height: MediaQuery.of(context).size.width - 50,
          width: MediaQuery.of(context).size.width,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.asset(
              imageOfRecipe,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ],
  );
}
