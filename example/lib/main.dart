import 'package:async_storage_local/async_storage_local.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Async Storage demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Async Storage demo/example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // keyFile =file name
  AsyncStorageLocal fileSetting =AsyncStorageLocal(keyFile: 'settings');
  // dataStringRetrieved = string got from the file 'ketFile'
  String dataStringRetrived='';
  // A message string showing what file is deleted, shows keyFile (in this example 'settings') 
  // In most applications, this is an optional or does not need
  String fileDeleted='';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            
            const SizedBox(height:50),

            InkWell(
              onTap: (){
                fileSetting.saveString('Lang: English');
              },
              child: const Text(
                'Save settings on keyFile',
              ),
            ),

            const SizedBox(height:40),

            InkWell(
              onTap:(){
                fileSetting.readString().then((value) {
                  setState((){
                    dataStringRetrived=value;
                  });
                });
              },
              child: Column(
                children: [
                  const Text('Retrieve from the local:'
                  ),
                  Text(dataStringRetrived,style:const TextStyle(fontSize:20,fontWeight: FontWeight.w700)),
                ],
              ),
            ),

            const SizedBox(height:40),

            InkWell(
              onTap:(){
                // in most applications, "fileSetting.delete();" is good option for //c-100 block.
                // c-100
                fileSetting.delete().then((value) {
                  setState((){
                    fileDeleted=value;
                  });
                });
                // c-100
              },
              child: Column(
                children: [
                  Text('Click to detete the file:'),

                  Text(fileDeleted,style:const TextStyle(fontSize:20,fontWeight: FontWeight.w700)),
                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}
