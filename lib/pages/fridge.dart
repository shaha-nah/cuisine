import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Fridge extends StatefulWidget {
  const Fridge({Key? key}) : super(key: key);

  @override
  _FridgeState createState() => _FridgeState();
}

class _FridgeState extends State<Fridge> {
  List<Map<String, dynamic>> _items = [];

  @override
  void initState() {
    super.initState();
    _loadItemsFromJson();
  }

  Future<void> _loadItemsFromJson() async {
    try {
      final String itemsJson = await rootBundle.loadString('assets/fridge.json');
      final Map<String, dynamic>jsonData = jsonDecode(itemsJson);
      final List<dynamic> itemList = jsonData['items'];
      setState(() {
        _items = List<Map<String, dynamic>>.from(itemList);
      });
    } catch (e) {
      print('Error loading items: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fridge'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = _items[index];
          return Card(
            child: ListTile(
              title: Text(item['name']),
              subtitle: item['expiration_date'].isEmpty
                ? Text('-')
                : Text('Expires: ${item['expiration_date']}'),
            ),
          );
        },
      ),
    );
  }
}