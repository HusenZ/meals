import 'package:flutter/material.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filters.glutenFree]!,
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).setFilter(Filters.glutenFree, isChecked);
              },
              title: const Text('Gluten-free',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),),
              subtitle: const Text('Only include Gluten-free meals',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filters.lactoseFree]!,
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).setFilter(Filters.lactoseFree, isChecked);
              },
              title: const Text('Lactose-free',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),),
              subtitle: const Text('Only include Lactose-free meals',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filters.vegetarian]!,
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).setFilter(Filters.vegetarian, isChecked);
              },
              title: const Text('Vegetarian meal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),),
              subtitle: const Text('Only include Vegetarian meals',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filters.vegan]!,
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).setFilter(Filters.vegan, isChecked);
              },
              title: const Text('Vegan meal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),),
              subtitle: const Text('Only include Vegan meals',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      );
  }
}
