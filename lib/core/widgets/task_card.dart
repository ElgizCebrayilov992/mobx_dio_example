import 'package:flutter/material.dart';
import 'package:mobx_dio_example/feature/task/model/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel taskModel;

  const TaskCard({Key? key, required this.taskModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return Scaffold(appBar: AppBar(),
                  body: Image.network(taskModel.imageUrl!),
                  );
                },));
              },
              leading: CircleAvatar(backgroundImage: 
              NetworkImage(taskModel.imageUrl!,),),
              title: Text(taskModel.description ?? ""),),
          );
  }
}