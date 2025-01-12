import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'
    as http; // Add 'as http' to properly scope the package.
import 'package:mrt_project/constants/utils.dart';

void httpErrorHandle({
  required http.Response response, // Prefix 'Response' with 'http.'
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      final decodedBody = jsonDecode(response.body);
      final errorMessage = decodedBody['msg'] ?? 'An error occurred';
      showSnackBar(context, errorMessage);
      break;
    case 500:
      final decodedBody = jsonDecode(response.body);
      final errorMessage = decodedBody['error'] ?? 'Server error occurred';
      showSnackBar(context, errorMessage);
      break;
    default:
      showSnackBar(context, 'Unexpected error: ${response.statusCode}');
  }
}
