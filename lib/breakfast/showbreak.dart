import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mealchooser/breakfast/breakdet.dart';
import 'package:mealchooser/pages/desing.dart';
import 'package:mealchooser/widgets/textstyle.dart';

var listToShowBreak = [];
List<Recipe> allRecipe = Recipe.allRecipe();
final favoritesBox = Hive.box('favorites');
final _random = Random();

void updateDataInList() {
  listToShowBreak =
      List.generate(1, (_) => allRecipe[_random.nextInt(allRecipe.length)]);
}

addToFavorites(
  Recipe Recipe,
) {
  final favoritesList = favoritesBox.values.toList();
  if (favoritesList.any((item) => item.name == Recipe.name)) {
    return Get.snackbar(
      'Alert',
      'you added ${Recipe.name} before ',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      icon: const Icon(
        Icons.warning_amber_rounded,
        size: 30,
      ),
    );
  }

  favoritesBox.add(Recipe);
  return Get.snackbar(
    'Awosome',
    'you added ${Recipe.name} to your favorites ',
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.pinkAccent,
    icon: const Icon(
      Icons.favorite,
      size: 40,
    ),
  );
}

void initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeAdapter());
  await Hive.openBox('favorites');
}

showpageBreak(BuildContext context) {
  if (listToShowBreak.isEmpty) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            'image/load.gif',
            width: MediaQuery.of(context).size.width * 0.8,
          ),
        ),
        textStyle(
            'start choosing your meal', 18, FontWeight.w600, Colors.grey, context, 0,TextAlign.right,
            top: 10, bottom: 10, right: 0)
      ],
    );
  } else {
    return Expanded(
      child: ListView.builder(
        itemCount: listToShowBreak.length,
        itemBuilder: (context, index) {
          return columndesign(
            listToShowBreak[index].name,
            context,
            "image/" + listToShowBreak[index].image,
            listToShowBreak[index].des,
            listToShowBreak[index].recipe,
            () {
              final recipe = Recipe(
                name: listToShowBreak[index].name,
                des: listToShowBreak[index].des,
                image: "image/" + listToShowBreak[index].image,
                recipe: listToShowBreak[index].recipe,
              );
              addToFavorites(recipe);
            },
          );
        },
      ),
    );
  }
}