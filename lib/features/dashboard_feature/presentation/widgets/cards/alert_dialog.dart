import 'package:flutter/material.dart';

showPickingAlert(BuildContext context, Widget dialogContainer) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            top: 10.0,
          ),
          content: Container(height: 200, child: dialogContainer),
        );
      });
}
