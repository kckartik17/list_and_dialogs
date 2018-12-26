import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.dark
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text(
            'List & Dialogs',
            style: new TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        backgroundColor: Colors.black87,
      ),
      body: new _MyList(),
     
    );
  }
}

 class _MyList extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return new ListView.builder(
        padding: EdgeInsets.all(4.0),
       itemBuilder: (context,i){
         return new ListTile(
           title: new Text('Kartik Chauhan'),
           subtitle: new Text('Online',
           style: new TextStyle(
             fontStyle: FontStyle.italic,
             color: Colors.green
           ),),
           leading: Icon(Icons.face),
           trailing: new RaisedButton(
             child: new Text('Remove'),
             onPressed: (){
               deleteDialog(context).then((value){
                 print('Value is $value');
               });
             },
           ),
         );
       },
      );
    }
  }

  Future<bool> deleteDialog(BuildContext context) {
   return showDialog(
     context: context,
     builder: (BuildContext context){
       return new AlertDialog(
         title: new Text('Are you Sure ?'),
         actions: <Widget>[
           new FlatButton(
             child: new Text('Yes',
             style: new TextStyle(
               color: Colors.green
             ),),
             onPressed: (){
               Navigator.of(context).pop(true);
             },
           ),
           new FlatButton(
             child: new Text('No',
             style: new TextStyle(
               color: Colors.red
             ),),
             onPressed: (){
               Navigator.of(context).pop(false);
             },
           )
         ],
       );
     }
   );
  }

