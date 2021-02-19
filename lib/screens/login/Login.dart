import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kolisamaj/utils/flash_helper.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final formKey = new GlobalKey<FormState>();
  TextEditingController _Name = TextEditingController();
  TextEditingController _Password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/Background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 80),
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 3.0,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: new Image.asset(
                              'images/koli patel samaj logo3.png',
                              height: 150, width: 150,
                              // fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            "Koli Patel Samaj",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                new Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: TextFormField(
                            obscureText: false,
                            controller: _Name,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: "Your Name",
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: TextFormField(
                            obscureText: true,
                            controller: _Password,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Card(
                                elevation: 3.0,
                                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    if (_Name.text == "ABC" &&
                                        _Password.text == "ABC123") {
                                      Navigator.pushNamed(
                                          context, "/HomeScreen");
                                    } else {
                                      FlashHelper.errorBar(context,
                                          message:
                                              "Please Enter Proper Name And Password...");
                                    }
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding:
                                        EdgeInsets.fromLTRB(15, 15, 10, 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Login',
                                            style: TextStyle(
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't Have An Account?",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed("/registrationScreen");
                          },
                          child: Text(
                            "Register!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ))
                    ],
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
