import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tryapi/models/Products.dart';
import 'package:http/http.dart'as http;

class ViewScreen extends StatefulWidget {


  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {

  List<Products> alldata;



  getdata() async {

    Uri url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    print(response.statusCode);
    if(response.statusCode==200)
      {
        var json = jsonDecode(response.body);
        print(json);
        setState(() {
          alldata = json.map<Products>((obj)=>Products.fromJson(obj)).toList();
        });
      }

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (alldata!=null)?ListView.builder(
          itemCount: alldata.length,
          itemBuilder: (context,index){
            return Container(
             child: Card(
               child: Column(
                 children: [
                   Image.network(alldata[index].image)
                 ],
               ),
             ),
            );
          },
        ):Center(child: CircularProgressIndicator(),),
      ),

    );
  }
}
