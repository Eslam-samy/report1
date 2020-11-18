
import 'package:flutter/material.dart';

Container buildInputContainer({
  @required TextInputType tib,
  @required TextEditingController controller,
  @required String label,
  @required BuildContext context,
}) {
  return Container(
    height: 56,
    padding: EdgeInsets.only(top: 8, bottom: 7),
    margin: EdgeInsets.only(
      left: 10,
      right: 10,
      top: 10,
    ),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x20779AF1),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ]),
    child: TextField(
      keyboardType: tib,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          gapPadding: 4,
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}
