/*
Create an Entity - ToDoItem 
a model of database
*/ 


import 'package:floor/floor.dart';

@entity //must note by @entity and must has a @primaryKey inside 
class TodoItem {
  static int ID =1;

  @primaryKey
  final int id;// primary key
  final String todoItem;
  final int quantity; // to-do content

  TodoItem(this.id, this.todoItem, this.quantity){
    if(id>ID){
      ID=id+1;//maintain ID
    }
  }
}