import 'package:flutter/material.dart';
import 'package:zendai_flutter_test/meal.dart';
import 'package:zendai_flutter_test/meal_bottom_bar.dart';
import 'package:zendai_flutter_test/meal_info.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withAlpha(0),
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: theme.colorScheme.surface.withAlpha(191),
          ),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.surface.withAlpha(191),
            ),
            icon: Badge.count(
              count: 2,
              backgroundColor: theme.colorScheme.primary,
              child: const Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(child: MealInfo(meal: meal)),
      bottomNavigationBar: MealBottomBar(
        price: meal.price,
        onAddToCart: () {},
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }
}
