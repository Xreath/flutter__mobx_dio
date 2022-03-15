import 'dart:io';

import 'package:dio/src/dio.dart';
import '../model/task_model.dart';
import 'ITask_Service.dart';

import 'Task_Service_Endpoints.dart';

class TaskService extends ITaskService {
  TaskService(Dio dio) : super(dio);

  @override
  Future<List<TaskModel>> getFetchAllTask() async {
    final response = await dio.get(TaskServiceEndpoints.ALBUMS.rawvalue);

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;

      if (data is List) {
        return data.map((e) => TaskModel.fromJson(e)).toList();
      }
    }

    return [];
  }
}
