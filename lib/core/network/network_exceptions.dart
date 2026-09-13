import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../utils/app_snackbar.dart';

part 'network_exceptions.freezed.dart';

@freezed
sealed class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;
  const factory NetworkExceptions.unauthorizedRequest(String reason) = UnauthorizedRequest;
  const factory NetworkExceptions.badRequest() = BadRequest;
  const factory NetworkExceptions.notFound(String reason) = NotFound;
  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;
  const factory NetworkExceptions.notAcceptable() = NotAcceptable;
  const factory NetworkExceptions.requestTimeout() = RequestTimeout;
  const factory NetworkExceptions.sendTimeout() = SendTimeout;
  const factory NetworkExceptions.conflict() = Conflict;
  const factory NetworkExceptions.internalServerError() = InternalServerError;
  const factory NetworkExceptions.notImplemented() = NotImplemented;
  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;
  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;
  const factory NetworkExceptions.formatException() = FormatException;
  const factory NetworkExceptions.unableToProcess() = UnableToProcess;
  const factory NetworkExceptions.defaultError(String error) = DefaultError;
  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions getDioException(dynamic error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions = const NetworkExceptions.requestTimeout();
              break;
            case DioExceptionType.unknown:
              if (error.error is SocketException) {
                networkExceptions = const NetworkExceptions.noInternetConnection();
              } else {
                networkExceptions = const NetworkExceptions.unexpectedError();
              }
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioExceptionType.badResponse:
              final statusCode = error.response?.statusCode;
              final responseDataStr = error.response?.data?.toString() ?? '';
              
              if (responseDataStr.contains('ERR_NGROK_') || responseDataStr.contains('ngrok.com')) {
                networkExceptions = const NetworkExceptions.defaultError('Unable to connect to backend. Server is down.');
                break;
              }

              // Extract custom server message if available
              String? serverMessage;
              try {
                if (error.response?.data != null) {
                  final data = error.response?.data;
                  if (data is Map) {
                    serverMessage = (data['message'] ?? data['error'])?.toString();
                  }
                }
              } catch (_) {}

              if (serverMessage != null && serverMessage.isNotEmpty) {
                networkExceptions = NetworkExceptions.defaultError(serverMessage);
                break;
              }

              switch (statusCode) {
                case 400:
                  networkExceptions = const NetworkExceptions.badRequest();
                  break;
                case 401:
                case 403:
                  networkExceptions = NetworkExceptions.unauthorizedRequest(
                      error.response?.data['message'] ?? 'Unauthorized request');
                  break;
                case 404:
                  networkExceptions = NetworkExceptions.notFound('Not found');
                  break;
                case 409:
                  networkExceptions = const NetworkExceptions.conflict();
                  break;
                case 408:
                  networkExceptions = const NetworkExceptions.requestTimeout();
                  break;
                case 500:
                  networkExceptions = const NetworkExceptions.internalServerError();
                  break;
                case 503:
                  networkExceptions = const NetworkExceptions.serviceUnavailable();
                  break;
                default:
                  var responseCode = statusCode;
                  networkExceptions = NetworkExceptions.defaultError(
                    "Received invalid status code: $responseCode",
                  );
              }
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioExceptionType.badCertificate:
              networkExceptions = const NetworkExceptions.unexpectedError();
              break;
            case DioExceptionType.connectionError:
              networkExceptions = const NetworkExceptions.noInternetConnection();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    return switch (networkExceptions) {
      NotImplemented() => "Not Implemented",
      RequestCancelled() => "Request Cancelled",
      InternalServerError() => "Internal Server Error",
      NotFound(reason: final reason) => reason,
      ServiceUnavailable() => "Service unavailable",
      MethodNotAllowed() => "Method Allowed",
      BadRequest() => "Bad request",
      UnauthorizedRequest(reason: final reason) => reason,
      UnexpectedError() => "Unexpected error occurred",
      RequestTimeout() => "Connection request timeout",
      NoInternetConnection() => "No internet connection",
      Conflict() => "Error due to a conflict",
      SendTimeout() => "Send timeout in connection with API server",
      UnableToProcess() => "Unable to process the data",
      DefaultError(error: final error) => error,
      FormatException() => "Unexpected error occurred",
      NotAcceptable() => "Not acceptable",
    };
  }

  /// Helper method to show error directly in UI using AppSnackbar
  static void showSnackBarError({required BuildContext context, required NetworkExceptions networkException}) {
    final message = getErrorMessage(networkException);
    AppSnackbar.showError(context: context, message: message);
  }
}
