import 'package:flutter/material.dart';

import '../../../../core/design/app_styles.dart';

class RadioOption extends StatelessWidget {
  const RadioOption({Key? key, required this.image, required this.title,required this.val,required this.groupVal,required this.fun}) : super(key: key);
  final String image,title;
  final String val, groupVal;
  final void Function(dynamic)? fun;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Image.network(image)),
        Expanded(
          flex: 12,
          child: RadioListTile(
              title: Text(title),
              activeColor: Styles.primary,
              value: val, groupValue: groupVal, onChanged: fun
          ),
        ),
      ],
    );
  }
}
