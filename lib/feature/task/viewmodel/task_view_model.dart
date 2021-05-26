import 'package:mobx/mobx.dart';
part 'task_view_model.g.dart';

class TaskViewModel = _TaskViewModelBase with _$TaskViewModel;

abstract class _TaskViewModelBase with Store 
{

@computed  //observable-e gore bir is edeceyemse bunu yaziriq
bool get isOdd=>count.isOdd;

@observable //deyisdirmek istediyimiz deyerin basina bunu yaziriq
int count=0;

@action //metodun basina bunu yaziriq
void onIncrementCount() 
 {
  count+=1;
 }
}
