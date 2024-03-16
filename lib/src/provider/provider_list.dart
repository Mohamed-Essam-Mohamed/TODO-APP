import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/src/firebase/firebase_utels.dart';
import 'package:todo_app/src/model/task_model.dart';

class ListProvider extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();
  List<TaskModel> taskModelList = [];
  void getAllTasks() async {
    QuerySnapshot<TaskModel> querySnapshot =
        await FirebaseUtils.getTaskCollection().get();
    taskModelList = querySnapshot.docs.map((doc) => doc.data()).toList();
    taskModelList = taskModelList.where(
      (taskModel) {
        if (taskModel.dateTime?.day == selectedDate.day &&
            taskModel.dateTime?.month == selectedDate.month &&
            taskModel.dateTime?.year == selectedDate.year) {
          return true;
        }
        return false;
      },
    ).toList();
    taskModelList.sort(
      (task1, task2) {
        return task1.dateTime!.compareTo(task2.dateTime!);
      },
    );

    notifyListeners();
  }

  void changDate(DateTime newDateTime) {
    selectedDate = newDateTime;
    getAllTasks();
  }
}
