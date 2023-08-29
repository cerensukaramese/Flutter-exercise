import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String appBarTitle;

  const DetailScreen({
    Key? key,
    required this.appBarTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle,
        ),
      //  automaticallyImplyLeading: false,
      ),
      body: Center(
        child:ElevatedButton (
          child: Text("Back"),
          onPressed: () {
            Navigator.pop(context,true);
          },
          )
        
        )
        
        );
    
  }
}
