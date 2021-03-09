import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  BuildContext _ctx;
  String mobile;

  @override
  void initState() {
    super.initState();
    _listOPT();
  }

  _listOPT() async {
    await SmsAutoFill().listenForCode;
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    final Map arguments = ModalRoute.of(_ctx).settings.arguments as Map;
    if (arguments != null) {
      setState(() {
        // code = arguments['code'];
        mobile = arguments['mobile'];
      });
      // FlashHelper.successBar(context, message: code);
    }
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Center(
              child: Container(
                child: Text(
                  "Enter the code that was sent to",
                  style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                child: Text(
                  "+" + mobile,
                  style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            PinFieldAutoFill(
              decoration: UnderlineDecoration(
                gapSpace: 40,
                textStyle: TextStyle(fontSize: 20, color: Colors.black),
                colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
              ),
              codeLength: 4,
              onCodeSubmitted: (code) {},
              onCodeChanged: (code) {
                if (code.length == 6) {
                  FocusScope.of(context).requestFocus(FocusNode());
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: FlatButton(
                color: Colors.blue,
                child: Text(
                  'CONTINUE',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                // ignore: unrelated_type_equality_checks
                onPressed: () {
                  Navigator.of(context).pushNamed("/HomeScreen");
                  // final form = formKey.currentState;
                  // if (form.validate()) {
                  //   form.save();
                  //   sendnum = phonecode.toString() + _phonenumber.toString();
                  //   Navigator.of(context).pushNamed(
                  //       "/otp", arguments: {
                  //     // "code": res["otp"],
                  //     "mobile":sendnum,
                  //   });
                  // }
                  // final form = formKey.currentState;
                  // if (form.validate()) {
                  //   form.save();
                  //
                  //
                  //   // _netUtil.post(RestDatasource.LOGIN_URL,
                  //   //     body: {
                  //   //       "mobile": _phonenumber,
                  //   //       "inputNotificationTocken": Token,
                  //   //     }).then((dynamic res) async {
                  //   //   if (res["status"] == "notfound") {
                  //   //     FlashHelper.errorBar(context, message: "Mobile Number Not Found");
                  //   //     // setState(() => _isLoading = false);
                  //   //   }
                  //   //   else if (res["status"] == "block") {
                  //   //     FlashHelper.errorBar(context, message: "Opps! You are blocked by admin.");
                  //   //     // setState(() => _isLoading = false);
                  //   //   }
                  //   //   else {
                  //   //     formKey.currentState.reset();
                  //   //     FlashHelper.successBar(context, message: "OTP sent to your mobile number : "
                  //   //       // +res["otp"]
                  //   //     );
                  //   //     // setState(() => _isLoading = false);
                  //   //     Navigator.of(context).pushNamed(
                  //   //         "/otp", arguments: {
                  //   //       "code": res["otp"],
                  //   //       "mobile":_phonenumber,
                  //   //     });
                  //   //   }
                  //   //   Navigator.of(context).pushNamed(
                  //   //       "/otp", arguments: {
                  //   //     // "code": res["otp"],
                  //   //     "mobile":_phonenumber,
                  //   //   });
                  // }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: InkWell(
                  onTap: () {},
                  child: Text(
                    "I didn't get a code",
                    style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "Tap CONTINUE to accept Privacy Policy and Terms of Service of Koli Patel Samaj",
                style: TextStyle(fontSize: 12, color: Colors.grey[800]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
