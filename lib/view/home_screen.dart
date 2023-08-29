

import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/detail_screen.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isRead = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        title: const Text("Users"),
        centerTitle: true,
        backgroundColor:Colors.deepPurple,
      ),
      body:ListView.builder(
        itemCount: 60,
        itemBuilder: (context , index) => _buildUserCard(context,index) ,
       ),

  );
  }

Widget _buildUserCard(context, int number){
  return Card(child: ListTile(
        leading:const Icon(
          Icons.person,
          color:  Color.fromARGB(255, 179, 151, 231),
          size: 40,
        ),
        title:  Text(
          "Name ${(number + 1)}",
          style: const TextStyle(fontSize: 22)      ),
          subtitle: const Text(
            "Surname"
          ),
          trailing: IconButton( icon: const Icon(
            Icons.arrow_right,
            size: 40
          ),
          onPressed: () {
            navigateToDetail(context, number);
            setState(() {
              isRead = true;
            });

          },
          ),
          tileColor : isRead ? Color.fromRGBO(223, 195, 231, 1) : Color.fromRGBO(189, 123, 209, 1)
      ),
    );
}

Future<void> navigateToDetail(BuildContext context,int index) async{
  bool isTrue = await Navigator.of(context).push(MaterialPageRoute(
              builder:(context){
                return DetailScreen(
                  appBarTitle:"Name ${(index + 1)}");
              },
              ),
            );
}
}