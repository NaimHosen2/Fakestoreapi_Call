import 'dart:convert';

import 'package:fakestoreapi/Api.dart';
import 'package:fakestoreapi/product_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Store'),),
      body: FutureBuilder(
        future:ProductService().getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(id:snapshot.data[index]["id"])));
                      },
                      leading:ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                            child: Image.network(snapshot.data[index]["image"],
                            fit: BoxFit.fitHeight,
                              height:100,
                              width: 100,
                            )),
                      title: Text(snapshot.data[index]['title']),
                    ),
                  );
                }
                );
          }
          return Center(child: CircularProgressIndicator());
        }
      ),
    );
  }

}
