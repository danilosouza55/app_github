import 'package:app_github/src/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class InputText extends StatelessWidget {
  final bool isNull;
  final bool autofocus;
  final String titulo;
  final TextEditingController controller;
  final IconData icon;
  final EdgeInsets padding;
  final FocusNode? myFocusNode;

  const InputText({
    Key? key,
    required this.titulo,
    required this.isNull,
    required this.controller,
    required this.icon,
    this.myFocusNode,
    this.autofocus = false,
    this.padding = const EdgeInsets.only(bottom: 20),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titulo,
          style: TextStyle(
            color: ColorsConstants.textLight,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            fillColor: ColorsConstants.background,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          keyboardType: TextInputType.text,
          autofocus: autofocus,
          focusNode: myFocusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (!isNull && value!.isEmpty) {
              return 'O campo não pode ser vazio!';
            }

            return null;
          },
        ),
      ],
    );
  }
}
