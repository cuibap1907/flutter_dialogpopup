import 'package:flutter/material.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PopupMenuButtonPage(),
    );
  }
}

class PopupMenuButtonPage extends StatefulWidget {
  @override
  _PopupMenuButtonPageState createState() => _PopupMenuButtonPageState();
}

class _PopupMenuButtonPageState extends State<PopupMenuButtonPage> {
  TextEditingController customController = new TextEditingController();

  Future<String> createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Your name ?"),
            content: TextField(
              controller: customController,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5,
                child: Text("Submit"),
                onPressed: () {
                  Navigator.of(context).pop(customController.text.toString());
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Menu Popup"),
        ),
        body: Builder(
          builder: (context) {
            return Container(
              child: Center(
                child: FlatButton(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  color: Colors.deepOrange,
                  textColor: Colors.white,
                  onPressed: () {
                    createAlertDialog(context).then((onValue) {
                      SnackBar mySnackbar = SnackBar(content: Text("Hello $onValue"));
                      Scaffold.of(context).showSnackBar(mySnackbar);
                    });
                  },
                  child: Text(
                    "Alert",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
