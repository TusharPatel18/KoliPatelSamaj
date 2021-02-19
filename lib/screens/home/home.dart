import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:kolisamaj/screens/navigation/navigation_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: NavDrawer(),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          duration: Duration(seconds: 1),
          content: Text('Press again to exit app'),
        ),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  elevation: 3.0,
                  margin: new EdgeInsets.fromLTRB(5, 10, 5, 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(15, 15, 10, 15),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 60,
                          child: new Image.asset(
                            'images/lets_connect_v1.9.png',
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Koli Patel Samaj",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
