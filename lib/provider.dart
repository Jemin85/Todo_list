import 'package:flutter/cupertino.dart';

class TodoProvider extends ChangeNotifier{

  List<TodoAdd> _addData = [];

   List<TodoAdd> get addData => _addData;

  void addTodoData(String data,BuildContext context){
    final object = TodoAdd(check: false, title: data);
    _addData.add(object);
    Navigator.pop(context);
    notifyListeners();
  }

  void removeTodoData(int data){
    _addData.removeAt(data);
    notifyListeners();
  }

  void checkData(int index,bool value){
    _addData[index].check = value;
    notifyListeners();
  }
}

class TodoAdd{
  final String title;
   bool check;
  TodoAdd({required this.check,required this.title});
}