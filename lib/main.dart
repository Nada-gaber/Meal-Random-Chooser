import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mealchooser/breakfast/breakdet.dart';
import 'package:mealchooser/pages/home.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(
    RecipeAdapter(),
  );
  await Hive.openBox('favorites');

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Chooser',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange.shade900),
        useMaterial3: true,
      ),
      home: Breakfast(),
    );
  }
}
