import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: "Search",
        prefixIcon: Icon(Icons.search, color: Colors.grey.shade500,),
      ),
    );
  }
}
