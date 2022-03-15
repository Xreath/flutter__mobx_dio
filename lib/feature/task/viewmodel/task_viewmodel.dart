import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import '../../../core/network/network_manager.dart';
import '../model/task_model.dart';
import '../service/ITask_Service.dart';
import '../service/Task_Service.dart';

part 'task_viewmodel.g.dart';

class TaskViewModel = _TaskViewModelBase with _$TaskViewModel;

abstract class _TaskViewModelBase with Store {
  BuildContext? context;

  late ITaskService taskservice;

  @observable
  List<TaskModel> items = [];

  @observable
  LifeState pageLife = LifeState.IDDLE;

  _TaskViewModelBase({this.context}) {
    taskservice = TaskService(NetworkManager.instance.dio);
  }

  void setContext(context) {
    this.context = context;
    fetchItems();
  }

  @action
  Future<void> fetchItems() async {
    pageLife = LifeState.LOADING;
    items = await taskservice.getFetchAllTask();
    pageLife = LifeState.DONE;
  }
}

enum LifeState { IDDLE, LOADING, DONE }
