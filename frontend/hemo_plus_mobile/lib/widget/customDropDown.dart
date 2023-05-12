import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
    
class CustomDropDown<T> extends StatelessWidget {
  final String hint;
  final T? dropValue;
  final List<T> values;
  final String validate;
  final ValueChanged onChanged;

  const CustomDropDown({ Key? key, required this.hint, this.dropValue, required this.values, required this.onChanged, required this.validate }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return DropdownButtonFormField<T>(
      isExpanded: true,
        hint: Text(hint),
        value: dropValue,
        validator: (dropValue) => dropValue == null ? validate : null, 
        onChanged:onChanged,
        items: values.map((value) => DropdownMenuItem<T>(
              value: value,
              child: Text(value.toString().split('.').last),
            )).toList(),
      );
  }
}