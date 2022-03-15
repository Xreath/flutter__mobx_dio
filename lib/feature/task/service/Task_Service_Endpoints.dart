enum TaskServiceEndpoints { ALBUMS }

extension TaskServiceEndpointsExtension on TaskServiceEndpoints {
  String get rawvalue {
    switch (this) {
      case TaskServiceEndpoints.ALBUMS:
        return "/albums";
    }
  }
}
