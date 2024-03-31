import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(MaterialApp(home: ItemsWidget()));
}

class ItemsWidget extends StatefulWidget {
  @override
  ItemsWidgetState createState() => ItemsWidgetState();
}

class ItemsWidgetState extends State<ItemsWidget> {
  final _storage = FlutterSecureStorage();
  final _controller = TextEditingController();
  List<_SecItem> _items = [];

  @override
  void initState() {
    super.initState();
    _readAll();
  }

  Future<void> _readAll() async {
    final all = await _storage.readAll();
    setState(() {
      _items =
          all.entries.map((entry) => _SecItem(entry.key, entry.value)).toList();
    });
  }

  Future<void> _addItem() async {
    await _storage.write(
        key: DateTime.now().toString(), value: _controller.text);
    _controller.clear();
    _readAll();
  }

  Future<void> _deleteItem(String key) async {
    await _storage.delete(key: key);
    _readAll();
  }

  Future<void> _getItemByKey(String key) async {
    final value = await _storage.read(key: key);
    if (value != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Item Value'),
          content: Text(value),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Item not found'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Item CRUD'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(hintText: 'Enter item value'),
                    ),
                  ),
                  IconButton(
                    onPressed: _addItem,
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return ListTile(
                    title: Text(item.value),
                    onTap: () => _getItemByKey(item.key),
                    trailing: IconButton(
                      onPressed: () => _deleteItem(item.key),
                      icon: Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
}

class _SecItem {
  final String key;
  final String value;

  _SecItem(this.key, this.value);
}
