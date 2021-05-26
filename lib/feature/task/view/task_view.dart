import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../viewmodel/task_view_model.dart';

class TaskView extends StatelessWidget {
  final _viewModel = TaskViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _viewModel.onIncrementCount();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Observer(
          builder: (_) => Text(
            _viewModel.count.toString(),
          ),
        ),
      ),
    );
  }
}
