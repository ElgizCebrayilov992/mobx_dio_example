
// ignore: avoid_web_libraries_in_flutter


import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobx_dio_example/feature/task/model/task_model.dart';
import 'package:mobx_dio_example/feature/task/service/ITaskService.dart';
part 'task_service_enum.dart';

class TaskService extends ITaskService {
  TaskService(Dio dio) : super(dio);

  @override
  Future<List<TaskModel>> fetchAllTask() async {

    final response=await dio.get(_TaskServiceEndPoint.DOGS.rawValue);
     if(response.statusCode==HttpStatus.ok){
       final data=response.data;

      if(data is List) return data.map((e) => TaskModel.fromJson(e)).toList();
}
    return [];
  }
  
}