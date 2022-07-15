import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_tile.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/model/task_data.dart';

class Task_list extends StatelessWidget {
 
 
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder:(context,TaskData,child){
       return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
              taskTitle: TaskData.task[index].name, isChecked: TaskData.task[index].isDone,
              checkCallBack:(value){
             TaskData.updateTask(TaskData.task[index]);
          },
          longPressCallback:(){
            // print('Kya be');
            TaskData.deleteTask(TaskData.task[index]);
          },
              );
        },
        itemCount:TaskData.taskCount,
      );
       
      },

     
    );
  }
}
