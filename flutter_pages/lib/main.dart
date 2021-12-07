import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _selectSecond = false;
  _handleSecond() {
    setState(() {
      _selectSecond = !_selectSecond;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Navigator(
          pages: [
            MaterialPage(child: FirstPage( _handleSecond)),
            if (_selectSecond == true) MaterialPage(child: SecondPage(_handleSecond))
            
          ],
          onPopPage:(route,result)=>route.didPop(result) ,
        ));
  }
}

class FirstPage extends StatelessWidget {

  var onTaped;
  FirstPage(this.onTaped) : super(key:ValueKey(onTaped));
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(title: Text('FirstPage')),
        body: Center(
          child: ElevatedButton(
            child: Text('goToSecond'),
            onPressed: this.onTaped,
          ),
        )));
  }
}

class SecondPage extends StatelessWidget {
  var onTaped;
  SecondPage(this.onTaped) : super(key:ValueKey(onTaped));
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(title: Text('SecondPage')),
        body: Center(
          child: ElevatedButton(
            child: Text('goToFirst'),
            onPressed:this.onTaped,
          ),
        )));
  }
}
