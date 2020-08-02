import 'package:course_book/config/application.dart';
import 'package:course_book/core/enums.dart';
import 'package:course_book/model/course/course.dart';
import 'package:course_book/utils/log.dart';
import 'package:flutter/cupertino.dart';

class GameContrller with ChangeNotifier {
  Course _course;
  Point _currentPoint;
  List<Point> _questionPoints;
  GameState state;

  List<Answer> _answers = [];

  GameContrller();

  Future<Point> reply(Future<List<Answer>> answer) async {
    if (currentPoint?.type == PointType.speech) {
    } else if (currentPoint?.type == PointType.answer) {}
    return Future.value(nextPoint());
  }

  bool checkAnswer(dynamic value) {
    if (value is Map) {
      value = Answer.fromJson(value);
    }
    bool result = _answers.contains(value);
    if (value is Answer) {
      result ? _answers.remove(value) : _answers.add(value);
    }
    return result;
  }

  Point nextPoint([dynamic contextId]) {
    if (currentPoint == null) {
      currentPoint = questionPoints?.first;
      return currentPoint;
    }
    contextId = contextId ?? currentPoint?.id;
    int nextIndex =
        questionPoints.indexWhere((element) => element.id == contextId) + 1;
    if (nextIndex >= questionPoints.length) {
      return null;
    }

    currentPoint = questionPoints[nextIndex];
    return currentPoint;
  }

  Point get currentPoint {
    return _currentPoint;
  }

  set currentPoint(Point val) {
    _currentPoint = val;
    notifyListeners();
  }

  List<Point> get questionPoints {
    if (course == null) {
      return [];
    }
    if (_questionPoints == null) {
      _questionPoints = course?.points?.where((e) => e.isQuestion)?.toList();
    }
    return _questionPoints;
  }

  Course get course {
    return _course;
  }

  set course(Course val) {
    bool isDirty = true;
    if (val == null) {
      throw ArgumentError.notNull('course');
    }
    isDirty = _course == val;
    _course = val;
    _currentPoint = questionPoints?.first;
    if (isDirty) notifyListeners();
  }
}
