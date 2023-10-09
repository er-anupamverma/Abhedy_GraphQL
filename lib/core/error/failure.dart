import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class NetworkFailure extends Failure {}

class SPFailure extends Failure {}

class APIFailure extends Failure {
  final String errorMessage;

  APIFailure(this.errorMessage);
}