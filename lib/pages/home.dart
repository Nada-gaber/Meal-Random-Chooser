import 'package:flutter/material.dart';
import 'package:mealchooser/breakfast/showbreak.dart';
import 'package:mealchooser/pages/favorite.dart';
import 'package:mealchooser/search/search.dart';
import 'package:mealchooser/widgets/textstyle.dart';

class Breakfast extends StatefulWidget {
  Breakfast({Key? key}) : super(key: key);

  @override
  State<Breakfast> createState() => _BreakfastState();
}

class _BreakfastState extends State<Breakfast> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade900,
        title: Center(
            child: Text(
          'Meal Chooser',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
      backgroundColor: Color(0xFFF6F6F6),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          showpageBreak(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Ink(
                decoration: ShapeDecoration(
                  color: Colors.deepOrange.shade900,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Search()));
                  },
                  icon: Icon(Icons.search),
                  color: Colors.white,
                  iconSize: 35,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Favorite()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange.shade900,
                      borderRadius: BorderRadius.circular(6)),
                  child: Center(child: headText('Favorites', 25, Colors.white)),
                ),
              ),
              Ink(
                decoration: ShapeDecoration(
                  color: Colors.deepOrange.shade900,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      updateDataInList();
                    });
                  },
                  icon: Icon(Icons.shuffle),
                  color: Colors.white,
                  iconSize: 35,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
