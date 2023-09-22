import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget{
  const MainDrawer({super.key, required this.onSelectedScreen});

  final void Function(String identifier) onSelectedScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.redAccent,
                    Colors.deepOrange,
                  ],
                  begin: Alignment.center,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children:  [
                  const Icon(Icons.fastfood, size: 48,),
                  const SizedBox(width: 18,),
                  Text(
                      'Cooking Up!',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 26,
                      ),
                  ),
                ],

          ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant, size: 26,),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24,
              ),),
            onTap: (){
              onSelectedScreen('meals');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, size: 26,),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24,
              ),),
            onTap: (){
              onSelectedScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}