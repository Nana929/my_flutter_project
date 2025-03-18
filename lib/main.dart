import 'package:flutter/material.dart';
import 'database.dart';
import 'todo_item.dart';
import 'new.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabase.databaseBuilder('shopping_list.db').build();
  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  final AppDatabase database;
  const MyApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      home: MyHomePage(database: database),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final AppDatabase database;
  const MyHomePage({super.key, required this.database});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TodoItem> items = [];
  TodoItem? selectedItem;
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    final loadedItems = await widget.database.todoDao.findAllTodoItems();
    setState(() {
      items = loadedItems;
    });
  }

  @override
  void dispose() {
    _itemController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _deleteItem(TodoItem item) async {
    await widget.database.todoDao.deleteItem(item);
    setState(() {
      items.remove(item);
      selectedItem = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping List')),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: _itemController,
                          decoration: const InputDecoration(
                            hintText: 'Type the item here',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: _quantityController,
                          decoration: const InputDecoration(
                            hintText: 'Type the quantity here',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () async {
                          if (_itemController.text.isNotEmpty &&
                              _quantityController.text.isNotEmpty) {
                            final newItem = TodoItem(
                              items.isNotEmpty ? items.last.id + 1 : 1,
                              _itemController.text,
                              int.tryParse(_quantityController.text) ?? 1,
                            );
                            await widget.database.todoDao.insertItem(newItem);
                            _loadItems();
                            _itemController.clear();
                            _quantityController.clear();
                          }
                        },
                        child: const Text('Add'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: items.isEmpty
                      ? const Center(child: Text('No items in the list'))
                      : ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(items[index].todoItem),
                              subtitle:
                                  Text('Quantity: ${items[index].quantity}'),
                              onTap: () async {
                                if (isLargeScreen) {
                                  setState(() {
                                    selectedItem = items[index];
                                  });
                                } else {
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NewPage(
                                        item: items[index],
                                        database: widget.database,
                                      ),
                                    ),
                                  );
                                  if (result == true) {
                                    _loadItems(); // Refresh the list after deletion
                                  }
                                }
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
          if (isLargeScreen && selectedItem != null)
            Expanded(
              child: DetailsPage(
                item: selectedItem!,
                onDelete: () => _deleteItem(selectedItem!),
                onClose: () => setState(() => selectedItem = null),
              ),
            ),
        ],
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final TodoItem item;
  final VoidCallback onDelete;
  final VoidCallback onClose;

  const DetailsPage({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Item: ${item.todoItem}', style: const TextStyle(fontSize: 20)),
          Text('Quantity: ${item.quantity}',
              style: const TextStyle(fontSize: 18)),
          Text('Database ID: ${item.id}', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 20),
          Row(
            children: [
              ElevatedButton(
                onPressed: onDelete,
                child: const Text('Delete'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: onClose,
                child: const Text('Close'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
