import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kolisamaj/color_style.dart';
import 'package:kolisamaj/data/app_notifier.dart';
import 'package:kolisamaj/routes.dart';
import 'package:kolisamaj/utils/flash_helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(new LoginApp());

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final textTheme = Theme.of(context).textTheme;
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => AppNotifier(context)),
          ],
          child: new MaterialApp(
            title: 'KOLI SAMAJ',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.green,
              accentColor: Colors.white,
              primaryColor: Colors.white,
              textTheme: GoogleFonts.poppinsTextTheme(textTheme),
            ),
            routes: routes,
          ),
        );
      });
    });
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

// final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  BuildContext _ctx;
  bool loadfirstscreen = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final introKey = GlobalKey<IntroductionScreenState>();
  bool checkterms = false;
  bool isloggin;

  String version = "2.0";

  SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_loadPref();
    // startTime();
    checkFirstSeen();
    // initPlatformState();
    // _firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     print("onMessage: $message");
    //     //onFirebaseMessage(message);
    //     print("Page : " + message['data']['order_id']);
    //     Navigator.of(context).popAndPushNamed("/notificationorderpending",arguments: {
    //       "order_id": message['data']['order_id']
    //     });
    //    showDialog(
    //      context: context,
    //      builder: (context) => AlertDialog(
    //        content: ListTile(
    //          title: Text(message['notification']['title']),
    //          subtitle: Text(message['notification']['body']),
    //        ),
    //        actions: <Widget>[
    //          FlatButton(
    //            child: Text('Ok'),
    //            onPressed: () => Navigator.of(context).pop(),
    //          ),
    //        ],
    //      ),
    //    );
    //     FlashHelper.errorBar(context, message: "sds");
    //    // Alert(
    //    //   context: _ctx,
    //    //   type: AlertType.info,
    //    //   title: message["notification"]["title"],
    //    //   desc: message["notification"]["body"],
    //    //   buttons: [
    //    //     DialogButton(
    //    //       child: Text(
    //    //         "Close",
    //    //         style: GoogleFonts.lato(
    //    //             color: Colors.white,
    //    //             fontSize: 20),
    //    //       ),
    //    //       onPressed: () => Navigator.of(_ctx).pop(),
    //    //       color: Color.fromRGBO(
    //    //           0, 179, 134, 1.0),
    //    //     ),
    //    //   ],
    //    // ).show();
    //    //  _showItemDialog(message);
    //   },
    //   onLaunch: (Map<String, dynamic> message) async {
    //     print("onLaunch: $message");
    //     Navigator.of(context).popAndPushNamed("/notificationorderpending",arguments: {
    //       "order_id": message['data']['order_id']
    //     });
    //     //_navigateToItemDetail(message);
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     print("onResume: $message");
    //     Navigator.of(context).popAndPushNamed("/notificationorderpending",arguments: {
    //     "order_id": message['data']['order_id']
    //     });
    //     // _navigateToItemDetail(message);
    //   },
    // );
    // _firebaseMessaging.requestNotificationPermissions(
    //     const IosNotificationSettings(
    //         sound: true, badge: true, alert: true, provisional: true));
    // _firebaseMessaging.onIosSettingsRegistered
    //     .listen((IosNotificationSettings settings) {
    //   print("Settings registered: $settings");
    // });
    // _firebaseMessaging.getToken().then((String token) {
    //   assert(token != null);
    //   setState(() {
    //     print("Push Messaging token: $token");
    //   });
    // });
    checkFirstSeen();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future checkFirstSeen() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      loadfirstscreen = (prefs.getBool('firstscreen') ?? false);
      if (loadfirstscreen) {
        startTime();
      }
    });
  }

  void _onIntroEnd(context) {
    if (checkterms) {
      setState(() {
        loadfirstscreen = true;
        prefs.setBool('firstscreen', true);
        startTime();
      });
    } else {
      FlashHelper.errorBar(context, message: "Accept Terms & Conditions..");
    }
  }

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  // _loadPref() async {
  //   setState(() {
  //     _netUtil.post(RestDatasource.VERSION, body: json.encode({"settingid":"1"})).then(
  //         (dynamic res) async {
  //       print(res);
  //       setState(() {
  //         version = res[0]["settingvalue"].toString();
  //         startTime();
  //       });
  //     });
  //   });
  // }

  void navigationPage() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // isloggin=(prefs.getBool("isloggin")==null)?false:prefs.getBool("isloggin");
    // if(isloggin)
    //   {
    //     Navigator.of(context).pushNamedAndRemoveUntil(
    //         '/home', (Route<dynamic> route) => false);
    //   }
    // else{
    Navigator.pushNamedAndRemoveUntil(context, '/HomeScreen', (route) => false);
    // }
    // var db = new DatabaseHelper();
    // var isLoggedIn = await db.isLoggedIn();
    // if (isLoggedIn) {
    //   (version!=null)?
    //   (version == "2.0")
    //       ? Navigator.of(context).pushNamedAndRemoveUntil(
    //           '/bottomhome', (Route<dynamic> route) => false)
    //       : Navigator.of(context).pushNamed("/updateapp"):Center(
    //         child: CircularProgressIndicator(
    //                                   backgroundColor: Colors.green,
    //                                 ),
    //   );
    //   //Navigator.of(context).pushNamedAndRemoveUntil('/bottomhome', (Route<dynamic> route) => false);
    // } else {
    //   (version!=null)?
    //   (version == "2.0")
    //       ? Navigator.of(context).pushNamedAndRemoveUntil(
    //           '/loginfirst', (Route<dynamic> route) => false)
    //       : Navigator.of(context).pushNamed("/updateapp"):Center(
    //           child: CircularProgressIndicator(
    //                                   backgroundColor: Colors.green,
    //                                 ),
    //   );
    //   //Navigator.of(context).pushNamedAndRemoveUntil('/loginfirst', (Route<dynamic> route) => false);
    // }
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('images/logo.png', height: 250, width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  void _displayDialog(BuildContext context) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          // this was required, rest is same
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return WillPopScope(
              onWillPop: () async => false,
              child: Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  elevation: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    height: 500,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            child: Image.asset('images/update.png')),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                'images/tspd logo and name.png',
                                height: 150,
                                width: 150,
                              )),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 100),
                                child: Text(
                                  "Hi! THERE",
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: Appconstants.secondprimaryColor),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.60,
                                    child: Text(
                                      "We improve speeds and performance etc We improve speeds",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              Appconstants.secondprimaryColor),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Expanded(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 0),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //       color: Color(0xffcccccc),
                                        //       blurRadius: 8.0
                                        //   )
                                        // ],
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20)),
                                        border: Border.all(
                                          color: Color(0xff009DE1),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        "Exit",
                                        style: GoogleFonts.lato(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 0),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //       color: Color(0xffcccccc),
                                        //       blurRadius: 8.0
                                        //   )
                                        // ],
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20)),
                                        border: Border.all(
                                          color: Color(0xff009DE1),
                                        ),

                                        color: Color(0xff009DE1),
                                      ),
                                      child: Text(
                                        "Update",
                                        style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var pageDecoration = PageDecoration(
      titleTextStyle:
          GoogleFonts.lato(fontSize: 35.0, fontWeight: FontWeight.w700),
      bodyTextStyle: GoogleFonts.lato(
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
          color: Colors.black.withOpacity(0.5)),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    if (loadfirstscreen == false) {
      return IntroductionScreen(
        key: introKey,
        pages: [
          PageViewModel(
            title: "Search",
            body:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consequat sapien eget orci lacinia, et interdum orci elementum.",
            image: Padding(
              padding: const EdgeInsets.only(top: 200),
              child:
                  Image.asset('images/search.png', height: 250, width: 350.0),
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Help",
            body:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consequat sapien eget orci lacinia, et interdum orci elementum.",
            image: Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Image.asset('images/help.png', height: 250, width: 350.0),
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Together",
            body:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consequat sapien eget orci lacinia, et interdum orci elementum.",
            image: Padding(
              padding: const EdgeInsets.only(top: 200),
              child:
                  Image.asset('images/together.png', height: 250, width: 350.0),
            ),
            decoration: pageDecoration,
            footer: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  activeColor: Colors.blue,
                  value: checkterms,
                  onChanged: (bool value) {
                    setState(() {
                      checkterms = value;
                    });
                  },
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(_ctx).pushNamed("/termsandcondition");
                  },
                  child: Text(
                    "I accept terms & conditions",
                    style: GoogleFonts.lato(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
        onDone: () => _onIntroEnd(context),
        // onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        skip: const Text('Skip'),
        next: const Icon(
          Icons.arrow_forward,
          color: Colors.blue,
        ),
        done: Text('DONE',
            style: GoogleFonts.lato(
                fontWeight: FontWeight.bold, color: Colors.green)),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeColor: Colors.blue,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      );
    } else {
      _ctx = context;
      return new Scaffold(
        //backgroundColor: Color(0xff000e2b),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: new Image.asset(
                    'images/lets_connect_v1.9.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Center(
            //       child: Container(
            //         padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            //         child: CircularProgressIndicator(
            //           backgroundColor: Color(0xff00e1ff),
            //         ),
            //       ),
            //     ),
            //     SizedBox(height: 20,),
            //     Text("Version $_projectVersion",style: TextStyle(color: Appconstants.appBarColor,fontSize: 18),),
            //     SizedBox(height: 40,),
            //   ],
            // ),
          ],
        ),
      );
    }
  }
}
