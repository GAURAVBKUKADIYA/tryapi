import 'package:flutter/material.dart';

import 'ViewScreen.dart';

class SplashScreen extends StatefulWidget {


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  gotopage()async{

    await Future.delayed(Duration(seconds: 3));

    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=>ViewScreen())
    );

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gotopage();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          children: [

            Image.asset("img/welcome.gif"),
            CircularProgressIndicator()
          ],
        ),
      ),

    );
  }
}
