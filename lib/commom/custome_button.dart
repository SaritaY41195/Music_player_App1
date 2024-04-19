import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final Widget widget;
  const CustomButton(
      {super.key, required this.onPressed, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.07,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          onPressed;
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black54,
          textStyle: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        // style: ButtonStyle(
        //   textStyle: MaterialStateProperty.all<TextStyle>(
        //       const TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
        //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //     const RoundedRectangleBorder(
        //         borderRadius: BorderRadius.zero,
        //         side: BorderSide(color: Colors.red)),
        //   ),
        // ),
        child: widget,
      ),
    );
  }
}
