import 'package:flutter/cupertino.dart';

class Toddu extends ChangeNotifier{

  List<ToduAdd> _addData = [];

   List<ToduAdd> get addData => _addData;

  void addTodoData(String data,BuildContext context){
    final object = ToduAdd(check: false, title: data);
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

class ToduAdd{
  final String title;
   bool check;
  ToduAdd({required this.check,required this.title});
}