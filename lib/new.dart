import 'package:flutter/material.dart';
import 'database.dart';
import 'todo_item.dart';

class NewPage extends StatefulWidget {
  final TodoItem item;
  final AppDatabase database;

  const NewPage({super.key, required this.item, required this.database});

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  void _deleteItem() async {
    await widget.database.todoDao.deleteItem(widget.item);
    await _refreshItems(); // Refresh the database state
    if (mounted) {
      Navigator.pop(context, true); // Return true to indicate deletion
    }
  }

  Future<void> _refreshItems() async {
    setState(() {}); // Trigger UI update
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Item Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Item: ${widget.item.todoItem}',
                style: const TextStyle(fontSize: 20)),
            Text('Quantity: ${widget.item.quantity}',
                style: const TextStyle(fontSize: 18)),
            Text('Database ID: ${widget.item.id}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _deleteItem,
                  child: const Text('Delete'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
