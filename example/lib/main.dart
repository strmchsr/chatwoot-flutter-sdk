import 'package:chatwoot_client_sdk/chatwoot_client_sdk.dart';
import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _showChatwootDialog,
                child: Text("Start Chat"),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _clearAllData,
                child: Text("Clear Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showChatwootDialog() {
    ChatwootChatDialog.show(
      context,
      baseUrl: "https://app.chatwoot.com",
      inboxIdentifier: "____________________",
      title: "Testing Chat",
      user: ChatwootUser(
        identifier: "test1@test.com",
        name: "Tester test1",
        email: "test1@test.com",
      ),
    );
  }

  Future _clearAllData() async {
    await ChatwootClient.create(
      baseUrl: "https://app.chatwoot.com",
      inboxIdentifier: "____________________",
    );
    ChatwootClient.clearAllData().then((_) {
      print("data cleared successfully!!!");
    }).catchError((error) {
      print(error);
    });
  }
}
