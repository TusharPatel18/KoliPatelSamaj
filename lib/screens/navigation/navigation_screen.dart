import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kolisamaj/color_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  BuildContext _ctx;
  String loggedinname = "";
  String loggedincontact = "";
  String loggedinemail = "";

  _loadPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loggedinname = prefs.getString("name") ?? '';
      loggedincontact = prefs.getString("contact") ?? '';
      loggedinemail = prefs.getString("email") ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPref();
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/blue.jpg"),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(_ctx).pop();
                    showBottomSheet();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            FontAwesomeIcons.userAlt,
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: IconButton(
              icon: Image.asset(
                "images/profile.png",
                color: Colors.black,
                height: 24,
                width: 24,
              ),
            ),
            title: Text(
              'My Profile',
              style: Appconstants.NavBarStyle,
            ),
            onTap: () {
              Navigator.of(_ctx).popAndPushNamed("/ProfileScreen");
            },
          ),
          ListTile(
            leading: IconButton(
              icon: Image.asset(
                "images/business.png",
                color: Colors.black,
                height: 24,
                width: 24,
              ),
            ),
            title: Text(
              'Business',
              style: Appconstants.NavBarStyle,
            ),
            onTap: () {
              Navigator.of(context).pushNamed("/UserGridViewScreen");
            },
          ),
          ListTile(
            leading: IconButton(
              icon: Image.asset(
                "images/govt.png",
                color: Colors.black,
                height: 30,
                width: 30,
              ),
            ),
            title: Text(
              'Govt. Officer',
              style: Appconstants.NavBarStyle,
            ),
            onTap: () {
              // Navigator.of(_ctx).popAndPushNamed("/achievement");
            },
          ),
          ListTile(
            leading: IconButton(
              icon: Image.asset(
                "images/politics.png",
                color: Colors.black,
                height: 30,
                width: 30,
              ),
            ),
            title: Text(
              'politics',
              style: Appconstants.NavBarStyle,
            ),
            onTap: () {
              // Navigator.of(_ctx).popAndPushNamed("/members");
            },
          ),
          ListTile(
            leading: IconButton(
              icon: Image.asset(
                "images/private.png",
                color: Colors.black,
                height: 30,
                width: 30,
              ),
            ),
            title: Text(
              'Private',
              style: Appconstants.NavBarStyle,
            ),
            onTap: () {
              // Navigator.of(_ctx).popAndPushNamed("/samajratna");
            },
          ),
          ListTile(
            leading: IconButton(
              icon: Image.asset(
                "images/ngo.png",
                color: Colors.black,
                height: 30,
                width: 30,
              ),
            ),
            title: Text(
              'NGO',
              style: Appconstants.NavBarStyle,
            ),
            onTap: () {
              // Navigator.of(_ctx).popAndPushNamed("/news");
            },
          ),
          ListTile(
            leading: IconButton(
              icon: Image.asset(
                "images/other.png",
                color: Colors.black,
                height: 30,
                width: 30,
              ),
            ),
            title: Text(
              'Other',
              style: Appconstants.NavBarStyle,
            ),
            onTap: () {
              // Navigator.popAndPushNamed(context, '/jobs');
            },
          ),
          ListTile(
            leading: IconButton(
              icon: Image.asset(
                "images/about.png",
                color: Colors.black,
                height: 28,
                width: 28,
              ),
            ),
            title: Text(
              'About',
              style: Appconstants.NavBarStyle,
            ),
            onTap: () {
              // Navigator.of(_ctx).popAndPushNamed("/about");
            },
          ),
          ListTile(
            leading: IconButton(
              icon: Image.asset(
                "images/logout.png",
                color: Colors.black,
                height: 24,
                width: 24,
              ),
            ),
            title: Text(
              'Log out',
              style: Appconstants.NavBarStyle,
            ),
            onTap: () {
              // Navigator.of(_ctx).popAndPushNamed("/loginScreen");
            }
            // => logout()
            ,
          ),
          _divider(),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Center(
                child: new Text(
                  "Version 1.0",
                  style: Appconstants.NavBarBottomStyle,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              new Center(
                child: new Text(
                  "Developed by Karon Infotech",
                  style: Appconstants.NavBarBottomStyle,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

// void logout() async {
//   var authStateProvider = new AuthStateProvider();
//   authStateProvider.dispose(this);
//   var db = new DatabaseHelper();
//   await db.deleteUsers();
//   authStateProvider.notify(AuthState.LOGGED_OUT);
//   Navigator.of(_ctx).pushReplacementNamed("/login");
// }

//   @override
//   void onAuthStateChanged(AuthState state) {
//     // TODO: implement onAuthStateChanged
//   }

  void showBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text('Login \nKoli Samaj', style: Appconstants.LoginStyle),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).popAndPushNamed("/loginScreen");
              },
              child: Container(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "PHONE NUMBER",
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.deepPurpleAccent,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 150,
            )
          ],
        );
      },
    );
  }
}
