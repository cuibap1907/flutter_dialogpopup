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

  Widget popupMenuButton()
  {
    return PopupMenuButton<String>(
      icon: Icon(Icons.add, size: 30),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>> [
        PopupMenuItem<String>(
          value: "one_val",
          child: Text("One"),
        ),
        PopupMenuItem<String>(
          value: "two_val",
          child: Text("Two"),
        ),
        PopupMenuItem<String>(
          value: "three_val",
          child: Text("Three"),
        ),
      ],
      onSelected: (retVal) {
        if(retVal == "one_val")
          print("Press: $retVal");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {

            },
          ),
          titleSpacing: 2.0,
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(
            //     Icons.search,
            //     color: Colors.red,
            //   ),
            //   onPressed: () {

            //   },
            // ),
            // IconButton(
            //   icon: Icon(
            //     Icons.settings,
            //     color: Colors.brown,
            //   ),
            //   onPressed: () {},
            // ),
            // IconButton(
            //   icon: Icon(Icons.shop),
            //   color: Colors.redAccent,
            //   onPressed: () {},
            // ),
            popupMenuButton()
          ],
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
