import 'package:hive_flutter/adapters.dart';
part 'breakdet.g.dart';

@HiveType(typeId: 0)
class Recipe extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String des;
  @HiveField(3)
  final String recipe;

  Recipe(
      {required this.name,
      required this.image,
      required this.des,
      required this.recipe});

  static List<Recipe> allRecipe() {
    var breakfastRecipe = <Recipe>[];

    breakfastRecipe.add(Recipe(
        name: "Grilled mozzarella fingers",
        image: "اصابع الموتزريلا المشوية.jpg",
        des:
            '- Mozzarella cheese\n- Egg whites\n- Breadcrumbs\n- Vegetable oil',
        recipe:
            '- Prepare an oven tray and grease it with oil.\n- Mix the egg whites well.\n- Dip the cheese sticks into the egg whites, then into the bread crumbs until they are completely covered.\n- Distribute the mozzarella sticks in the oven tray.\n- Preheat the oven grill to high heat. Medium, then grill the cheese sticks for 10-12 minutes until they brown and become crispy.\n- Place the mozzarella sticks in a serving dish and serve them hot.'));
    breakfastRecipe.add(Recipe(
        name: "Eggs the Turkish way",
        image: "البيض بالطريقة التركية.jpg",
        des:
            '- Egg\n- Milk\n- Cheddar\n- Mozzarella cheese\n- Salt\n- Black pepper\n- Oil',
        recipe:
            '- In a frying pan over medium heat, heat the oil, then add the onions and stir until they soften.\n- Add the garlic and tomatoes. Stir the mixture for 15 minutes until the sauce thickens. Season with salt and black pepper.\n- Make into tomato mixture. Crack the eggs into the holes and cover the pan. Reduce the heat and leave the pan on low heat for 5-6 minutes until the eggs are cooked.\n- Garnish with parsley and serve the dish hot'));
    breakfastRecipe.add(Recipe(
        name: "Saidi beans",
        image: "الفول الصعيدي.jpg",
        des:
            '- Mashed beans\n- Minced garlic\n- Sauce\n- Oil\n- Egg\n- Salt\n- Black pepper\n- Cumin',
        recipe:
            '- Prepare a frying pan and put the oil in it and leave it on medium heat until it is hot.\n- Add the chopped garlic to the frying pan and stir until it is fragrant.\n- Add the sauce, stir a little, then add a spoon of water.\n- Season the sauce by sprinkling salt, black pepper, and cumin and stir until it thickens. \n- Add the beans to the sauce and stir until well combined.\n- Transfer the beans to a casserole and make a cavity inside the beans.\n- Place an egg inside a cavity on top of the beans and put the bean casserole in the oven until it is cooked, then serve it alongside local bread.'));
    breakfastRecipe.add(Recipe(
        name: "steamed beans",
        image: "الفول المبخر.jpg",
        des:
            '- Butter\n- Chopped onion\n- Chopped bell pepper\n- Chopped tomatoes\n- Chopped parsley\n- Chopped garlic\n- Chopped hot pepper\n- Peeled beans\n- Tomato paste\n- Salt\ n- Black pepper\n- Cumin\n- Olive oil\n- Chickpeas\n- Liquid tahini\n- Squeezed lemon\n- Yogurt\n- Charcoal for steaming',
        recipe:
            '- Put the onions, hot peppers and tomato paste in a pot on the fire and stir well.\n- When the onions are wilted, add the chopped tomatoes, cumin, coriander, salt and peeled beans and leave them until they are combined.\n- Add the tahini mixture and stir well.\n- Place the beans in a plate. Serve and garnish with tomatoes, parsley, tahini and olive oil.'));
    breakfastRecipe.add(Recipe(
        name: "vegetable omelette",
        image: "اومليت الخضار.jpg",
        des:
            '- Eggs\n- Onions\n- Colored peppers\n- Mozzarella cheese\n- Tomatoes\n- Flour\n- Salt\n- Black pepper\n- Vegetable oil',
        recipe:
            '- Put the two eggs in a bowl, add pepper and salt, and stir well.\n- Heat the oil in a frying pan.\n- Pour the egg mixture into the pan.\n- Turn the omelet to the other side, and leave it to cook.\n- Put Place the omelet on tissues to absorb the excess oil. -\nWe stuff the omelet with onions, tomatoes, peppers, and ketchup,\n- Then we wrap it.'));
    breakfastRecipe.add(Recipe(
        name: "Omelette with potatoes and cheddar",
        image: "اومليت بالبطاطس و الشيدر.jpg",
        des:
            '- Potatoes\n- Onions\n- Cheddar cheese\n- Eggs\n- Salt\n- Black pepper\n- Butter',
        recipe:
            '- Peel the potatoes, wash them, then grate them in the food processor.\n- Beat the eggs, salt, and black pepper, then add the potatoes and cheese, and blend all the ingredients until you get a homogeneous mixture.\n- Put the butter in a pan until it melts, then pour the omelette mixture Fry over low heat for ten minutes, stirring from time to time, until browned on both sides.'));
    breakfastRecipe.add(Recipe(
        name: "Omelet with mushroom and cheese",
        image: "اومليت بالمشروم و الجبنة.jpg",
        des:
            '- Eggs\n- Finely chopped onions\n- Mushroom slices\n- Salt and black pepper\n- Mozzarella cheese',
        recipe:
            '- Beat the eggs well with salt and black pepper.\n- In a non-stick frying pan, put a little oil on the fire, and sauté the onions and mushrooms in it until the onions wilt.\n- Pour the beaten eggs over the onions and mushrooms, and leave on low heat until cooked, then Turn to the other side.\n- Place a sprinkle of mozzarella cheese on top, cover until it melts, then place the egg and mushroom omelet on a serving plate and garnish with parsley.'));

    return breakfastRecipe;
  }
}
