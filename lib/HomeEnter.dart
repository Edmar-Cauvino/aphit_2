import 'dart:convert';


import 'package:aphit_2/test.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


const request= "https://parseapi.back4app.com/classes/Livros";
var objectId;
var Titulo;
var Autor;
var Descricao;
var createdAt;
var updatedAt;




class HomeEnter extends StatefulWidget {

  @override
  _HomeEnterState createState() => _HomeEnterState();

}

class User {
  final String  objectId;
  final String Titulo;
  final String Autor;
  final String Descricao;
  final String createdAt;
  final String updatedAt;



  User(this.objectId, this.Titulo, this.Autor, this.Descricao,this.createdAt,
      this.updatedAt);
}

class _HomeEnterState extends State<HomeEnter> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Test(),
                )
            );},
        ),
        backgroundColor: Colors.deepPurple,
        title: Text("Aphit"),
        centerTitle: true,

      ),
      drawer: Drawer(),

      backgroundColor: Colors.white,
      body:
      // SingleChildScrollView(
      Container(
        child:
        FutureBuilder<List<User>>(
          future: _getListApi(),
          builder: (BuildContext context, AsyncSnapshot snapshot){

            if(snapshot.data == null){
              return Container(
                child: Center(
                  child:Text("Carregando..." , style: TextStyle(
                      fontSize: 30
                  ),),
                ),
              );
            }else{

              return ListView.builder(
                  itemCount:snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    objectId = snapshot.data[index].objectId;
                    Titulo = snapshot.data[index].Titulo;
                    Autor = snapshot.data[index].Autor;
                    Descricao= snapshot.data[index].Descricao;
                    createdAt= snapshot.data[index].createdAt;
                    updatedAt= snapshot.data[index].updatedAt;


                    //var a = users[index];
                    return topTail(Titulo: Titulo, Autor: Autor,  );
                  }
              );

            }

          },

        ),
      ),
      //)

    );
  }

  Future <List<User>> _getListApi() async {
    var response = await http.get(Uri.parse(request));
    var dadosJson = json.decode(response.body);




    List <User> users = [];

    for(var u in dadosJson["results"]){
      User user = User(u["objectId"], u["Titulo"], u["Autor"], u["Descricao"],
          u["createdAt"], u["updatedA"]);

      users.add(user);
    }

    return users;
  }


  ListTile topTail({ String  objectId, String Titulo, String Autor, String Descriccao, String createdAt, String updatedAt, String Foto }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage("https://angomatriz.com/storage/app/public/perfil/"+Foto),
      ),

      title: Text(
        Titulo,
        style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 15,
        ),

      ),
      subtitle: Text(
        Autor,
        style: TextStyle(
            fontWeight: FontWeight.bold
        ),

      ),
      trailing: Container(
        child: Text(Descriccao.toString(), style: TextStyle(fontSize: 13),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Test(),
            )
        );

      },
    );

  }
}

