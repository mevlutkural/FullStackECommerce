import 'package:flutter/material.dart';
import 'package:mobile_app/common/exceptions/exceptions.dart';

class ErrorHandler {
  static void handle(dynamic e, BuildContext context) {
    print(e);
    String errorMessage = 'An unknown error occurred.';

    if (e is ApiException) {
      errorMessage = e.message;
    } else if (e is NetworkException) {
      errorMessage = e.message;
    } else {
      errorMessage = e.toString();
    }

    // Kullanıcıya bildirimi göster
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
  }
}
