import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../viewmodel/task_viewmodel.dart';

final TaskViewModel _viewModel = TaskViewModel();

class TaskView extends StatelessWidget {
  const TaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_viewModel.context == null) {
      _viewModel.setContext(context);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Observer(builder: (_) {
          return Visibility(
            visible: _viewModel.pageLife == LifeState.LOADING,
            child: CircularProgressIndicator(),
          );
        }),
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          itemCount: _viewModel.items.length,
          itemBuilder: (BuildContext context, int index) => Card(
            child: Text(_viewModel.items[index].title ?? ""),
          ),
        );
      }),
    );
  }
}
