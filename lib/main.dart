import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> listtwitt = new List<String>();
  TextEditingController text  = new TextEditingController();

  Alert(){
     showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text("Ajouter un Twitte"),
          content: TextField(
            controller: text,
            decoration: InputDecoration(
              labelText: "What's new !"
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Add'),
              onPressed: () {
            setState(() {
              listtwitt.add(text.text);
              text.clear();
            });
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter",),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                   icon: Icon(FontAwesomeIcons.twitter), 
                   onPressed: (){
                     Alert();
                   },
            ),
          )
        ],
      ),
      body: Container(
        child: ListView.separated(itemBuilder:  (context, index) {

          return Card(
                 child: ListTile(
                   onLongPress: (){
                     showDialog(
                         context: context,
                         builder: (_) => new AlertDialog(
                           title: new Text("Delete this Tweet"),

                           actions: <Widget>[
                             FlatButton(
                               child: Text('Yes'),
                               onPressed: () {
                                 setState(() {
                                   listtwitt.removeAt(index);
                                 });
                                 Navigator.of(context).pop();
                               },
                             ),
                             FlatButton(
                               child: Text('No'),
                               onPressed: () {

                                 Navigator.of(context).pop();
                               },
                             ),
                           ],
                         ));
                   },
                   title: Text("Khalil",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.green),),
                   subtitle: Text(listtwitt[index]),
                 ),
          );
        }, separatorBuilder: (context , index){
           return Divider();
        }, itemCount: listtwitt.length),
      ),
    );
  }
}


