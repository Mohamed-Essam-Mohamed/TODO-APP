import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/src/firebase/firebase_utels.dart';
import 'package:todo_app/src/model/task_model.dart';

class ListProvider extends ChangeNotifier {
  List<TaskModel> taskModelList = [];
  getAllTasks() async {
    QuerySnapshot<TaskModel> querySnapshot =
        await FirebaseUtils.getTaskCollection().get();
    taskModelList = querySnapshot.docs.map((doc) => doc.data()).toList();
    notifyListeners();
  }
}
