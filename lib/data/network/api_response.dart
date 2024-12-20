import 'package:flutter/material.dart';

import '../enums/api_status.dart';

class ApiResponse<T> {
  ApiResponse();

  Status status = Status.undertermined;

  ConnectionState connectionStatus = ConnectionState.none;

  T? data;

  String message = '';

  List errors = [];

  ApiResponse.undertermined() : status = Status.undertermined;

  ApiResponse.loading(this.message) : status = Status.loading;

  ApiResponse.completed(this.data) : status = Status.completed;

  ApiResponse.error(this.message) : status = Status.error;

  ApiResponse.loadingMore(this.message) : status = Status.loadingMore;

  ApiResponse.errors(this.errors) : status = Status.error;
  ApiResponse.loadingProccess() : status = Status.loadingProcess;
}
