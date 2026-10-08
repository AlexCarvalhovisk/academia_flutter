import 'package:flutter/material.dart';

InputDecoration getAuthenticationInputDecoration(String label) {
  return InputDecoration(
    hintText: label,
    fillColor: Colors.white,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(64)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(64),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(64),
        borderSide: const BorderSide(color: Colors.lightBlueAccent, width: 4)
    ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(64),
        borderSide: const BorderSide(color: Colors.redAccent, width: 2)
    ),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(64),
        borderSide: const BorderSide(color: Colors.red, width: 4)
    ),
  );
}
