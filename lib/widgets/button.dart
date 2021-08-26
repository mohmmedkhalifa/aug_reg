import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  String label;

  CustomButton({
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        height: 60 / size.height * size.height,
        width: 200 / size.width * size.width,
        child: Center(
          child: FittedBox(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      onTap: onTap,
    );
  }
}
