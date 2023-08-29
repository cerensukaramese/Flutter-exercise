

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/view/detail_screen.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List <User> userList = List.generate(50, (index) => 
  User(
    name: "name $index", 
    surname: 'surname', 
    userColor: Color.fromRGBO(151, 63, 233, 0.945), 
    isRead: false)
    
    );
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
        itemCount: userList.length,
        itemBuilder: (context , index) => _buildUserCard(context,index) ,
       ),

  );
  }

Widget _buildUserCard(context, int index){
  return Card(child: ListTile(
        leading:const Icon(
          Icons.person,
          color:  Color.fromARGB(255, 179, 151, 231),
          size: 40,
        ),
        title:  Text(
          userList[index].name,
          style: const TextStyle(fontSize: 22)      ),
          subtitle:  Text(
            userList[index].surname,
          ),
          trailing: IconButton( icon: const Icon(
            Icons.arrow_right,
            size: 40
          ),
          onPressed: () {
            navigateToDetail(context, index);
            setState(() {
              userList[index].isRead = true ;
            });
          },
          ),
          tileColor : userList[index].isRead ? Color.fromRGBO(100, 60, 173, 1) : Color.fromRGBO(151, 63, 233, 0.945)
          ) 
      );
    
}

Future<void> navigateToDetail(BuildContext context,int index) async{
  bool isTrue = await Navigator.of(context).push(MaterialPageRoute(
              builder:(context){
                return DetailScreen(
                  user:userList[index]);
              },
              ),
            );
}
}