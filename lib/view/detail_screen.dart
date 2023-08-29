import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user.dart';

class DetailScreen extends StatelessWidget {
  final User user;

  const DetailScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: user.userColor,
      appBar: AppBar(
        title: Text(
          user.name,
        ),
        automaticallyImplyLeading: false,
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
