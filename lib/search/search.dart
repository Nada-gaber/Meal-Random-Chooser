import 'package:flutter/material.dart';
import 'package:mealchooser/breakfast/breakdet.dart';
import 'package:mealchooser/breakfast/details.dart';
import 'package:page_transition/page_transition.dart';
import '../widgets/textstyle.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

TextEditingController searchTextEditing = TextEditingController();
List<Recipe> filteredMeal = [];

class _SearchState extends State<Search> {
  searchMeal(String quary) {
    setState(() {
      filteredMeal = Recipe.allRecipe().where((meal) {
        return meal.name.toLowerCase().contains(quary.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF6F6F6),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),

              Text(
                'Search',
                style: const TextStyle(
                  color: Color(0xff403939),
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 21),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 21,
                      ),
                      hintText: 'meal name',
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange.shade900, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  controller: searchTextEditing,
                  onChanged: searchMeal,
                ),
              ),
              if (filteredMeal.isEmpty)
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Image.asset(
                        'image/search.gif',
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.width * 0.8,
                      ),
                      Text(
                        'start searching',
                        style: const TextStyle(
                          color: Color(0xFF61605D),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: filteredMeal.length,
                    itemBuilder: (context, index) {
                      final meal = filteredMeal[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rotate,
                                  alignment: Alignment.center,
                                  duration: Duration(milliseconds: 500),
                                  child: Details(
                                      recipe: meal.recipe,
                                      ingrediens: meal.des,
                                      //     image: "image/" + meal.image,
                                      recipeName: meal.name),
                                  childCurrent: this.widget));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange.shade900,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: textStyle(
                                                meal.name,
                                                25,
                                                FontWeight.bold,
                                                Colors.white,
                                                context,
                                                0.1,
                                                TextAlign.right,
                                                top: 10,
                                                bottom: 0,
                                                right: 0),
                                          ),
                                        ),
                                      ),
                                      //   textStyle(
                                      //       meal.category,
                                      //       18,
                                      //       FontWeight.bold,
                                      //       Colors.white,
                                      //       context,
                                      //       0.09,
                                      //       TextAlign.right,
                                      //       top: 5,
                                      //       bottom: 15,
                                      //       right: 0),
                                    ],
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.23,
                                    child: Image.asset(
                                      "image/" + meal.image,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
//),
              //   ),
            ],
          ),
        ));
  }
}
