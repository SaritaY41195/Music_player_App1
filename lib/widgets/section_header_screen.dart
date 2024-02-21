import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SectorHeaderScreen extends StatelessWidget {
   SectorHeaderScreen({
    super.key,
    required this.title,
    this.action = "View more",
  });

  final String title;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text( title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold,color: Colors.white,),
        ),
        TextButton(
          onPressed: (){},
          child: Text(
            action,
            style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontWeight: FontWeight.bold,color: Colors.white,),),),
      ],
    );
  }
}