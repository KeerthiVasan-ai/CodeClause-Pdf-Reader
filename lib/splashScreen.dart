import 'package:flutter/material.dart';
import 'package:pdfviewer/HomeScreen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState(){
    super.initState();
    _loadScreen();
  }
  
  void _loadScreen() async{
    await Future.delayed(const Duration(seconds: 3),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Container(
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.picture_as_pdf,color: Colors.red, size: 50,),
              Text("Pdf Viewer",style: TextStyle(fontSize: 20,color: Color(0xff000000),fontWeight: FontWeight.bold),)
              ,SizedBox(height:10)
              ,Text("Developed by Keerthi",style: TextStyle(color: Color.fromARGB(255, 129, 129, 129)),)
            ],
          ),
        ),
      ),
    );
  }
}