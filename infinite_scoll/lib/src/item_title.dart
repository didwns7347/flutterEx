import 'package:flutter/material.dart';
import 'api/item.dart';

class ItemTitle extends StatelessWidget {
  final Item item;
  const ItemTitle({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: AspectRatio(
          aspectRatio: 1,
          child: Container(
            color: item.color,
          ),
        ),
        title: Text(item.name, style: Theme.of(context).textTheme.titleLarge,),
        trailing: Text('\$ ${(item.price / 100).toStringAsFixed(2)}'),
      ),
    );
  }
}

class LoadingItemTitle extends StatelessWidget {
  const LoadingItemTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const AspectRatio(aspectRatio: 1, child: Placeholder(),
        ),
        title: Text('...', style: Theme.of(context).textTheme.titleLarge,),
        trailing: const Text('\$ ...'),
      ),
    );
  }
}