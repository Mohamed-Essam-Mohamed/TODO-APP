import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/src/model/task_model.dart';

class FirebaseUtils {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection('Task')
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, options) =>
              TaskModel.fromFirebase(snapshot.data()!),
          toFirestore: (taskModel, options) => taskModel.toFirebase(),
        );
  }

  static Future<void> addTaskFireStore(TaskModel taskModel) {
    taskModel.id = getTaskCollection().doc().id;
    return getTaskCollection().doc().set(taskModel);
  }

  static Future<void> deleteTaskFromFirestore(TaskModel taskModel) {
    return getTaskCollection().doc(taskModel.id).delete();
  }
}
