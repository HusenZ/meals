import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/main.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/filters_provider.dart';

const  kInitialFilters = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegetarian: false,
  Filters.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget{
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if(identifier == 'filters') {
      await Navigator.of(context).push<Map<Filters, bool>>(
          MaterialPageRoute(
            builder: (ctx)=> const FiltersScreen(),
          ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(availableMeals: availableMeals,);
    var activePageTitle = 'Categories';

    if(_selectedPageIndex == 1){
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle, style: const TextStyle(color: Colors.white),),
        backgroundColor: theme.scaffoldBackgroundColor,
      ),
      drawer: MainDrawer(onSelectedScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){_selectPage(index);},
        backgroundColor: theme.scaffoldBackgroundColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories', backgroundColor: Colors.white ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites', backgroundColor: Colors.white),
        ],
      ),
    );
  }
}