import 'package:flutter/material.dart';
    
class CustomDropDown<T> extends StatelessWidget {
  final String hint;
  final T? dropValue;
  final List<T> values;
  final ValueChanged onChanged;

  const CustomDropDown({ Key? key, required this.hint, this.dropValue, required this.values, required this.onChanged }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return DropdownButton<T>(
      isExpanded: true,
        hint: Text(hint),
        value: dropValue,
        onChanged:onChanged,
        items: values.map((value) => DropdownMenuItem<T>(
              value: value,
              child: Text(value.toString().split('.').last),
            )).toList(),
      );
  }
}