import 'package:flutter/material.dart';
import './aboutHNG.dart';

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
  final _fieldController = TextEditingController();
  final list = [];

  void _addToList(String item) {
    setState(() {
      list.add(item);
    });
  }

  void _clearList() {
    setState(() {
      list.clear();
    });
  }

  void _goToAboutPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AboutHNG()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('App Demo'),
        actions: [
          IconButton(
            icon: Icon(Icons.forward),
            onPressed: _goToAboutPage,
          )
        ],
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image(
            height: 100,
            width: 100,
            image: AssetImage('assets/images/i4g.png'),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Enter a text here"),
                controller: _fieldController,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    if (_fieldController.text.isNotEmpty) {
                      _addToList(_fieldController.text.toString());
                    }
                    _fieldController.clear();
                  },
                  child: Text('Add to list')),
              SizedBox(
                width: 40,
              ),
              TextButton(
                  onPressed: () {
                    _clearList();
                    FocusScope.of(context).unfocus();
                  },
                  child: Text('Clear'))
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) => Column(
                children: [Text(list[i]), Divider()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
