
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toddo_list/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController add = TextEditingController();
  List checkList = [];
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Toddu>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("TODU List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            add.text = "";
          });
          showModalBottomSheet(context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                )
              ),
              builder: (context) => _addDataBottomSheet());
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: data.addData.length,
          itemBuilder: (context,index) => GestureDetector(
            onLongPress: (){
              print("--------------");
              Provider.of<Toddu>(context,listen: false).removeTodoData(index);
            },
            child: ListTile(
        leading: Text("${index + 1}"),
        title: Text("${data.addData[index].title}",style: TextStyle(
          decoration:data.addData[index].check! ? TextDecoration.lineThrough : TextDecoration.none
        ),),
        trailing: Checkbox(
            value: data.addData[index].check,
            onChanged: (value){

                Provider.of<Toddu>(context,listen: false).checkData(index, value!);

            },
        ),
      ),
          )),
    );
  }
  
  
  _addDataBottomSheet(){
    return Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
      height: 400,
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Text("Add Todu List Data",style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),),
          const SizedBox(height: 30),
          TextFormField(
            controller: add,
            decoration: const InputDecoration(
              hintText: "Enter Data"
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(onPressed: (){
            Provider.of<Toddu>(context,listen: false).addTodoData(add.text,context);
          }, child: const Text("Add"))
        ],
      ),
    ),);
  }
}
