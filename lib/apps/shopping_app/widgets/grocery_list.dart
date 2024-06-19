import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:review_app_2024/apps/shopping_app/data/categories.dart';

import 'package:review_app_2024/apps/shopping_app/data/dummy_items.dart';
import 'package:review_app_2024/apps/shopping_app/models/grocery_item.dart';
import 'package:review_app_2024/apps/shopping_app/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _listOfGroceries = [];
  var url = Uri.https(
      "flutter-backend-74fa1-default-rtdb.firebaseio.com", 'mygrocery_db.json');
  void _addItem() async {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const NewItem()));
    _loadItems();
  }

  void _loadItems() async {
    var responds = await http.get(url);
    Map<String, dynamic> roughItems = json.decode(responds.body);
    List<GroceryItem> tmpList = [];
    for (var item in roughItems.entries) {
      final category = categories.entries
          .firstWhere(
              (cate) => cate.value.title == item.value['grocrey_category'])
          .value;
      tmpList.add(GroceryItem(
          id: item.key,
          name: item.value['grocrey_name'],
          quantity: item.value['grocrey_quantity'],
          category: category));
    }

    setState(() {
      _listOfGroceries = tmpList;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    var emptyContent = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("There is no Item yet to display",
              style: Theme.of(context).textTheme.titleLarge),
          TextButton(
              onPressed: _addItem,
              child: const Text("Click here to add new items")),
        ],
      ),
    );
    var mainContent = ListView.builder(
      itemCount: _listOfGroceries.length,
      itemBuilder: (ctx, index) => Dismissible(
        onDismissed: (dir) {
          _listOfGroceries.remove(_listOfGroceries[index]);
        },
        key: ValueKey(_listOfGroceries[index]),
        child: ListTile(
          title: Text(_listOfGroceries[index].name),
          trailing: Text(_listOfGroceries[index].quantity.toString()),
          leading: Container(
            width: 24,
            height: 24,
            color: _listOfGroceries[index].category.color,
          ),
        ),
      ),
    );
    var myContent = _listOfGroceries.isEmpty ? emptyContent : mainContent;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Groceries"),
          actions: [
            IconButton(
              onPressed: _addItem,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: myContent);
  }
}
