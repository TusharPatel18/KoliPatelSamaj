import 'package:flutter/material.dart';
import 'package:kolisamaj/color_style.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Flexible(
                child: Card(
                  elevation: 3.0,
                  margin: new EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/UserGridViewScreen");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),
                      child: Center(
                        child:
                            Text('Business', style: Appconstants.HomeTextStyle),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Card(
                  elevation: 3.0,
                  margin: new EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      // Navigator.of(_ctx).pushNamed("/achievement");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),
                      child: Center(
                        child: Text('Govt. Officer',
                            style: Appconstants.HomeTextStyle),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: Card(
                  elevation: 3.0,
                  margin: new EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      // Navigator.of(_ctx).pushNamed("/achievement");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),
                      child: Center(
                        child:
                            Text('Politics', style: Appconstants.HomeTextStyle),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Card(
                  elevation: 3.0,
                  margin: new EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      // Navigator.of(_ctx).pushNamed("/achievement");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),
                      child: Center(
                        child:
                            Text('Private', style: Appconstants.HomeTextStyle),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: Card(
                  elevation: 3.0,
                  margin: new EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      // Navigator.of(_ctx).pushNamed("/achievement");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),
                      child: Center(
                        child: Text('NGO', style: Appconstants.HomeTextStyle),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Card(
                  elevation: 3.0,
                  margin: new EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      // Navigator.of(_ctx).pushNamed("/achievement");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),
                      child: Center(
                        child: Text('Other', style: Appconstants.HomeTextStyle),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
