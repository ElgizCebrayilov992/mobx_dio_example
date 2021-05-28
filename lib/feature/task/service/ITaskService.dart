import 'package:dio/dio.dart';
import 'package:mobx_dio_example/feature/task/model/task_model.dart';

abstract class ITaskService {
  final Dio dio;

  ITaskService(this.dio);

  Future<List<TaskModel>> fetchAllTask();
}
