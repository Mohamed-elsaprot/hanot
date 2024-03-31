import 'package:flutter/material.dart';

class ColoredCircle extends StatelessWidget {
  const ColoredCircle({Key? key, required this.choose, required this.color}) : super(key: key);
  final bool choose;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black38)
          ),
          padding: const EdgeInsets.all(3),
          margin: const EdgeInsets.all(3),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: color,
          ),
        ),
        if(choose)const Positioned(
          right: 0,bottom: 0,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 8,
            child: Icon(Icons.check,size: 12,color: Colors.white,),
          ),
        )
      ],
    );
  }
}
