import 'package:equatable/equatable.dart';
import 'package:klontong/core/errors/APIException.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message, required this.statusCode});
  final String message;
  final String statusCode;

  String get errorMessage => '$statusCode error: $message';

  @override
  List<Object> get props {
    return [message, statusCode];
  }
}

class APIFailure extends Failure {
  const APIFailure({required super.message, required super.statusCode});

  APIFailure.fromAPIException(APIException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}
