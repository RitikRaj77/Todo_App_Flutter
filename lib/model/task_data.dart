

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{
 List<Task> _task = [
    
  ];
 
  UnmodifiableListView<Task> get task{
    return UnmodifiableListView(_task);
  }

  int get taskCount{
    return _task.length;
  }
  
  void addTask(String newtaskTitle){
    _task.add(Task(name: newtaskTitle));
    notifyListeners();
  }
 void updateTask(Task tasks){
    tasks.toggleDone();
    notifyListeners();
 }

  void deleteTask(Task tasks){
     print('hi');
    _task.remove(tasks);
    notifyListeners();
  }

}