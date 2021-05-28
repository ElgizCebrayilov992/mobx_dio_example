part of 'task_service.dart';
enum _TaskServiceEndPoint{
  DOGS
}

extension TaskServiceEndPointExtension on _TaskServiceEndPoint{

  String get rawValue{
    switch (this) {
      case _TaskServiceEndPoint.DOGS:
        return '/dogs';

    }
  }
}