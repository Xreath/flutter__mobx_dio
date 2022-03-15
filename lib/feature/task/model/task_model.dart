import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  int? userId;
  int? id;
  String? title;

  TaskModel({this.userId, this.id, this.title});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return _$TaskModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TaskModelToJson(this);
  }
}
