import 'package:flutter/material.dart';

class BillAmount extends StatelessWidget {
  const BillAmount({super.key, required this.billAmount, this.onChanged});

  final String billAmount;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Bill Amount',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(Icons.attach_money),
      ),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        onChanged?.call(value);
      },
    );
  }
}
