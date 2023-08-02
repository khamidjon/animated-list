import 'package:animated_list/item_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _listKey = GlobalKey<AnimatedListState>();
  final _items = <int>[];
  final _animationDuration = const Duration(milliseconds: 500);
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: AnimatedList(
                key: _listKey,
                initialItemCount: _items.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                  Animation<double> animation,
                ) {
                  return ItemWidget(
                    value: _items[index],
                    animation: animation,
                  );
                },
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 12.0),
                Expanded(
                  child: FilledButton.tonal(
                    onPressed: _addItem,
                    child: const Text('Add item'),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: FilledButton.tonal(
                    onPressed: _removeItem,
                    child: const Text('Remove item'),
                  ),
                ),
                const SizedBox(width: 12.0),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _addItem() {
    _listKey.currentState!.insertItem(
      _items.length,
      duration: _animationDuration,
    );
    _items.add(_counter++);
  }

  void _removeItem() {
    if (_items.isEmpty) {
      return;
    }
    final item = _items[0];
    _listKey.currentState!.removeItem(
      0,
      (context, animation) => ItemWidget(
        value: item,
        animation: animation,
      ),
    );
    _items.removeAt(0);
  }
}
