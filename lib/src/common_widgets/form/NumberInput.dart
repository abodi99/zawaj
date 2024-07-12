import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class NumberInputRow extends StatelessWidget {
  final String label;
  final Rx<num> valueProperty;
  final TextInputType keyboardType;
  final String? Function(String?) validator;
  final List<TextInputFormatter>? inputFormatters; // Add inputFormatters parameter

  const NumberInputRow({
    super.key,
    required this.label,
    required this.valueProperty,
    this.keyboardType = TextInputType.number,
    required this.validator,
    this.inputFormatters, // Make it optional
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label),
            const SizedBox(height: 10),
            SizedBox(
              width: 55,
              child: TextFormField(
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(3),
                FilteringTextInputFormatter.digitsOnly
                    ],
                keyboardType: keyboardType,
                ),
              ),
          ],
        ),
      ],
    );
  }
}