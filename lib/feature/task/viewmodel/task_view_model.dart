import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_dio_example/core/network/network_manager.dart';
import 'package:mobx_dio_example/feature/task/model/task_model.dart';
import 'package:mobx_dio_example/feature/task/service/ITaskService.dart';
import 'package:mobx_dio_example/feature/task/service/task_service.dart';
part 'task_view_model.g.dart';

class TaskViewModel = _TaskViewModelBase with _$TaskViewModel;

abstract class _TaskViewModelBase with Store 
{
BuildContext? context;
late ITaskService taskService;

@observable
List<TaskModel> items=[];

@observable
LifeState pageLifes=LifeState.IDDLE;

 void setContex(BuildContext? context){
   this.context=context;
   fetchItems();
 }

_TaskViewModelBase({this.context}){
  taskService=TaskService(NetWorkManager.inistance.dio);
}

@action
Future<void> fetchItems() async {
  pageLifes=LifeState.LOADING;
items=await taskService.fetchAllTask();
pageLifes=LifeState.DONE;
  
}



}
enum LifeState{
  IDDLE,
  LOADING,
  DONE,

}
