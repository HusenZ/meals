import 'package:flutter/material.dart';
import 'package:meals/main.dart';
import 'package:meals/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title, style: const TextStyle(color: Colors.white),),
        backgroundColor: theme.scaffoldBackgroundColor,
        actions: [
          IconButton(onPressed: (){
            final wasAdded = ref.read(favoriteMealsProvider.notifier).toggleMealsFavoriteStatus(meal);
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(wasAdded ? 'Meal added as a favorite':'Meal removed form list of favorite'),
                )
            );
            },
              icon: AnimatedSwitcher(
                duration: const Duration(microseconds: 300),
                  transitionBuilder: (child, animation){
                    return RotationTransition(
                      turns: Tween(begin: 0.5, end: 1.0).animate(animation),
                      child: child,);
                  },
                  child: Icon(isFavorite ? Icons.star : Icons.star_border,
                    key: ValueKey(isFavorite),),
              ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14,),
            const Text('Ingredients', style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 14,),
            for (final ingredient in meal.ingredients)
              Text(ingredient, style:const TextStyle(color: Colors.white),),
            const SizedBox(height: 24,),
            const Text('Steps', style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 14,),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Text(step,
                  textAlign:TextAlign.center,
                  style:const TextStyle(color: Colors.white),),
              ),

          ],
        ),
      ),
    );
  }
}