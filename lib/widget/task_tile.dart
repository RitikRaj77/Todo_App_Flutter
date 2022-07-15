import 'package:flutter/material.dart';


class TaskTile extends StatelessWidget {

  final String taskTitle;
  final bool isChecked;
  final Function checkCallBack;
  final Function longPressCallback;
  TaskTile({ required this.taskTitle,required this.isChecked, required this.checkCallBack,required this.longPressCallback});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress:(){
        
        longPressCallback();
      
        },
      
      title:Text(taskTitle,
      style:TextStyle(decoration:isChecked==true?TextDecoration.lineThrough:null),
      ),
      trailing:Checkbox(
        onChanged: (value){
          checkCallBack(value);
        },
        value:isChecked,
      ),

    );
  }
}
