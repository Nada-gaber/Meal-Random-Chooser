import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mealchooser/breakfast/details.dart';
import 'package:mealchooser/widgets/textstyle.dart';

class Favorite extends StatefulWidget {
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final favoritesBox = Hive.box('favorites');
    final favoriteObjects = favoritesBox.values.toList();

    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Favorite',
              style: const TextStyle(
                color: Color(0xff403939),
                fontWeight: FontWeight.bold,
                fontSize: 27,
              ),
            ),
            if (favoriteObjects.isEmpty)
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Image.asset(
                      'image/favorite.gif',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    Text(
                      'start add your favorite',
                      style: const TextStyle(
                        color: Color(0xFF61605D),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: favoriteObjects.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                      recipe: favoriteObjects[index].recipe,
                                      ingrediens: favoriteObjects[index].des,
                                      //  image: favoriteObjects[index].image,
                                      recipeName: favoriteObjects[index].name,
                                    )));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        //  height: MediaQuery.of(context).size.height * 0.15,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    height: MediaQuery.of(context).size.width *
                                        0.25,
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                    decoration: BoxDecoration(
                                        color: Colors.deepOrange.shade900,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              favoritesBox.delete(
                                                  favoriteObjects[index].key);
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 1, bottom: 1, right: 10),
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.02,
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.45,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: textStyle(
                                              favoriteObjects[index].name,
                                              18,
                                              FontWeight.bold,
                                              Colors.white,
                                              context,
                                              0.3,
                                              TextAlign.left,
                                              top: 30,
                                              bottom: 30,
                                              right: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Image.asset(
                                        favoriteObjects[index].image)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
