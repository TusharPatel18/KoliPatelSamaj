import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            // color: Color(0xFFF44336),
            child: DrawerHeader(
              padding: EdgeInsets.fromLTRB(0, 5.0, 0, 0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Image.asset(
                  'images/lets_connect_v1.9.png',
                  width: 50.0,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.black),
            title: Text(
              'My Profile',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.of(_ctx).popAndPushNamed("/myprofile");
            },
          ),
          ListTile(
            leading: Icon(Icons.cake, color: Colors.black),
            title: Text(
              'Birthday',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.of(_ctx).popAndPushNamed("/birthday");
            },
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard, color: Colors.black),
            title: Text(
              'Achievements',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.of(_ctx).popAndPushNamed("/achievement");
            },
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.black),
            title: Text(
              'Members',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.of(_ctx).popAndPushNamed("/members");
            },
          ),
          ListTile(
            leading: Icon(Icons.star, color: Colors.black),
            title: Text(
              'Samaj Ratna',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.of(_ctx).popAndPushNamed("/samajratna");
            },
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.black),
            title: Text(
              'News',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.of(_ctx).popAndPushNamed("/news");
            },
          ),
          ListTile(
            leading: Icon(Icons.business_center, color: Colors.black),
            title: Text(
              'Jobs',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, '/jobs');
            },
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.black),
            title: Text(
              'Trustee',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.of(_ctx).popAndPushNamed("/trustee");
            },
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.black),
            title: Text(
              'Committee',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.of(_ctx).popAndPushNamed("/committee");
            },
          ),
          ListTile(
            leading: Icon(Icons.photo, color: Colors.black),
            title: Text(
              'Photo',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.of(_ctx).popAndPushNamed("/photo");
            },
          ),
          ListTile(
            leading: Icon(Icons.video_library, color: Colors.black),
            title: Text(
              'Video',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.of(_ctx).popAndPushNamed("/video");
            },
          ),
          ListTile(
            leading: Icon(Icons.audiotrack, color: Colors.black),
            title: Text(
              'Audio',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.of(_ctx).popAndPushNamed("/audio");
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.black),
            title: Text(
              'About',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.of(_ctx).popAndPushNamed("/about");
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.black),
            title: Text(
              'Logout',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            onTap: () {
              Navigator.of(_ctx).popAndPushNamed("/loginScreen");
            }
            // => logout()
            ,
          ),
          _divider(),
          SizedBox(
            height: 10,
          ),
          Column(
            children: <Widget>[
              new Center(
                child: new Text(
                  "Version 1.0",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              new Center(
                child: new Text(
                  "Developed by Karon Infotech",
                  style: TextStyle(fontSize: 12.0),
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
}
