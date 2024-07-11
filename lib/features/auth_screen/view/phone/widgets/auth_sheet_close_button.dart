import 'package:flutter/material.dart';

class SheetCloseButton extends StatelessWidget {
  const SheetCloseButton({Key? key, this.size,}) : super(key: key);
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: CircleAvatar(
        radius: size,
        backgroundColor: Colors.black12,
        child: const CloseButton(color: Colors.black,),
      ),
    );
  }
}
