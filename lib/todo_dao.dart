/*
This step is to create the Data Access Object (DAO) layer, 
which is used in the Flutter + Floor framework to manage database access 
and encapsulate SQLite query, insert, and delete operations.

*/


import 'package:floor/floor.dart';
import 'todo_item.dart';

@dao
abstract class TodoDao {
  @Query('SELECT * FROM TodoItem')
  Future<List<TodoItem>> findAllTodoItems();

  @insert
  Future<void> insertItem(TodoItem item);

  @delete
  Future<void> deleteItem(TodoItem item);
}
