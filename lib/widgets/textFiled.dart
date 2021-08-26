import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String label;

  Icon icon;
  late Icon suffixIcon;
  String? initValue;
  TextInputType keyboardType;
  Function? saveFun;
  Function validateFun;

  MyTextField({
    required this.label,
    required this.icon,
    required this.keyboardType,
    this.saveFun,
    required this.validateFun,
    this.initValue,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width *.8,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          initialValue: initValue,
          onSaved: (value) {
            this.saveFun!(value);
          },
          validator: (value) {
            return this.validateFun(value);
          },
          keyboardType: keyboardType,
          style: TextStyle(color: Colors.grey, fontSize: 16),
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: label, prefixIcon: icon),
        ),
      ),
    );
  }
}
