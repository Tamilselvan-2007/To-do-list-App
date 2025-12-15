import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String displayText = "No text data";
  List<String> tasks = [];
  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('TO-DO LIST APP✅',style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Column(
          children: [
            Row(
              children: [
               Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                controller: taskController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label:Text('Enter your task'),
              ),
            ),
            ),
          ),
            MaterialButton (
              color: Colors.grey,
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed:  () {
                setState(() {
                  Text("Click to add task");
                  tasks.add(taskController.text);
                  taskController.clear();
                });
              },
              child: Text("Click"),  
            ),
              
              ],
            ),
          


            Flexible(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Row(
                  children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(tasks[index]),
                    ),
                  ),
                  
                  MaterialButton(
                    child: Icon(
                    Icons.delete, 
                    color: Colors.red,),
                    onPressed:  (){
                      setState(() {
                        tasks.removeAt(index);
                      });
                    } ,
                  
                  )
                ],
              );
              },
              
              ),
            )
          ],
        )
      ),
    );
  }
}
