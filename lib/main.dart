import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
//import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Just One Demo',
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
        //primarySwatch: Colors.amber,
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.amber, //Colors.lightBlue[800],
        accentColor: Colors.amberAccent,//Colors.cyan[600],

        // Define the default font family.
        //fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          //headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          //headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          //bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Just One'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  math.Random random = new math.Random();
  String _pickWord = "";
  bool initFile = false;
  var arr = new List();// creates an empty array of length 5
  //int _counter = 0;

  /*void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }*/

  Future<void> readFileAsync() async {
    String fileText = await rootBundle.loadString('assets/french.txt');
    //print(fileText);
    arr = fileText.split('\n');
  }

  /*void readFileAsync() async {
    new File('french.txt').readAsString().then((c) => print(c));
  }*/

  void _newRandom() {
    if (initFile == false) {
      setState(() {
        readFileAsync();
        _pickWord = "Loaded!";
        initFile = true;
      });
    } else {
      setState(() {
        // This call to setState tells the Flutter framework that something has
        // changed in this State, which causes it to rerun the build method below
        // so that the display can reflect the updated values. If we changed
        // _counter without calling setState(), then the build method would not be
        // called again, and so nothing would appear to happen.
        _pickWord = arr[random.nextInt(550)]; //random.nextInt(100);
        //_counter++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container( //Center(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/8RRYJg26Wr4.jpg"),
            fit: BoxFit.cover,
            ),
          ),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Center(
          child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Random word:',
              ),
              Text(
                '$_pickWord',
                style: Theme.of(context).textTheme.headline2,
                //style: TextStyle(color: Colors.amber),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _newRandom,
        tooltip: 'New word',
        child: Icon(Icons.casino), //Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
