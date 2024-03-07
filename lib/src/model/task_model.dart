// ignore_for_file: public_member_api_docs, sort_constructors_first

class TaskModel {
  String? id;
  String? title;
  String? note;
  DateTime? dateTime;
  bool? isDone;
  TaskModel({
    this.id = '',
    required this.title,
    required this.note,
    required this.dateTime,
    this.isDone = false,
  });
  TaskModel.fromFirebase(Map<String, dynamic> data)
      : this(
          id: data['id'],
          title: data['title'],
          note: data['note'],
          dateTime: DateTime.fromMicrosecondsSinceEpoch(data['dateTime']),
          isDone: data['isDone'],
        );
  Map<String, dynamic> toFirebase() {
    return {
      'id': id,
      'title': title,
      'note': note,
      'dateTime': dateTime!.microsecondsSinceEpoch,
      'isDone': isDone,
    };
  }
}
