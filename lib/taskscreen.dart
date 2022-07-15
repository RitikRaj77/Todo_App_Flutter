import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/task_data.dart';
import 'widget/task_list.dart';
import 'add_taskScreen.dart';
import 'package:todo_app/model/task.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Consumer<TaskData>(builder: (context,TaskData,child){
                   return AddTaskScreen();
                })
              ),
            ),
          );
        },
        backgroundColor: Colors.grey[700],
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    color: Colors.grey[700],
                    size: 40,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'To-Do List',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w600),
                ),
                Consumer<TaskData>(builder: (context, TaskData, child) {
                  return Text(
                    '${TaskData.taskCount} Tasks ',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  );
                })
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20),
                    )),
                child: Consumer<TaskData>(
                  builder: (context, TaskData, child) {
                    return Task_list();
                  },
                ),
              ))
        ],
      ),
    );
  }
}
