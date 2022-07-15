import 'package:flutter/material.dart';
import 'package:todo_app/model/task_data.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/task_data.dart';

class AddTaskScreen extends StatelessWidget {

  // final Function addTaskCallback;
  // AddTaskScreen(this.addTaskCallback);

  // const AddTaskScreen({ Key? key }) : super(key: key);
  String newTaskTitle='';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFF757575),
      child: Container(
        padding:EdgeInsets.all(35),
        decoration:BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(20),
            topRight: Radius.circular(20)
          )
        ),
        child:Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.stretch,
          children: [
            Text('Add Task',
            textAlign:TextAlign.center,
             style:TextStyle(
             fontSize:30,
             color:Colors.grey[700]
             ),
            ),
              TextField(
              onChanged:(newText){
                   newTaskTitle=newText;
              },
              autofocus:true,
              autocorrect:true,
              textAlign: TextAlign.center,
               decoration:InputDecoration(
                  focusColor:Colors.grey[700]
          
               ),
              ),
              
              Consumer<TaskData>(
                builder:(context,TaskData,child){
                  return MaterialButton(onPressed: (){
                TaskData.addTask(newTaskTitle);
                  Navigator.pop(context);
                  
                },
                 
                color:Colors.grey[700],
                child:Text('Add',
                style: TextStyle(
                  color:Colors.white
                ),
                ),
                
                );
                },
                
              )
          
          ],
        ),
      ),
    );
  }
}