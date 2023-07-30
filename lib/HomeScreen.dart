import 'dart:io' as io;

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:pdfviewer/viewPdf.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  List<io.FileSystemEntity> pdfFiles = [];

  @override
  void initState() {
    super.initState();
    _loadfiles();
  }

  void _loadfiles() async {
    List<String> appDir = await ExternalPath.getExternalStorageDirectories();
    String intPath = appDir[0];
    io.Directory intDir = io.Directory("$intPath/");
    getFiles(intDir);

    setState(() {
      pdfFiles = pdfFiles;
    });
  }

  Future<void> getFiles(io.Directory dir) async {
    List<io.FileSystemEntity> entities = dir.listSync();
    for(io.FileSystemEntity entity in entities) {
      if(entity is io.File && entity.path.endsWith('pdf')) {
        pdfFiles.add(entity);
      } else if(entity is io.Directory && (entity.path == "/storage/emulated/0/Android" || entity.path == "/storage/emulated/0/MIUI")) {
        continue;
      } else if(entity is io.Directory ){
        await getFiles(entity);
      }
    }
    //print(pdfFiles);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff9288F8),
        title: const Text('PDF List'),
      ),
      body: ListView.builder(
        itemCount: pdfFiles.length,
        itemBuilder: (context,index) {
          return ListTile(
            leading: const Icon(Icons.picture_as_pdf,color: Colors.red,),
            title: Text(pdfFiles[index].path.split("/").last,), 
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => viewPdf(pdfPath: pdfFiles[index].path,), 
                ));
            },
          );
        },
      ),
    );
  }
}