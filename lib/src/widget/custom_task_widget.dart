// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/firebase/firebase_utels.dart';
import 'package:todo_app/src/model/task_model.dart';
import 'package:todo_app/src/provider/provider_list.dart';
import 'package:todo_app/src/utils/app_text_style.dart';

class CustomTaskWidget extends StatelessWidget {
  Size siz;
  TaskModel taskModel;
  CustomTaskWidget({required this.siz, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ListProvider>(context);
    return Container(
      height: siz.height * 0.11,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        // color: Colors.pink,
      ),
      // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              onPressed: (context) {
                FirebaseUtils.deleteTaskFromFirestore(taskModel)
                    .then((value) => null)
                    .onError((error, stackTrace) => null);
                provider.getAllTasks();
                print('dffffffffffffffffffffffffffffffffffffffff');
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              topLeft: Radius.circular(5),
            ),
            color: Colors.amber,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskModel.title ?? '',
                      style: AppTextStyle.textStyle24,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      taskModel.note ?? '',
                      style: AppTextStyle.textStyle24.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: siz.height * 0.13,
                width: 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffC4C4C4),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "T\nO\nD\nO",
                  style: AppTextStyle.textStyle16,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
