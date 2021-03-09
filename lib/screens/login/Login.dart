import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kolisamaj/Widgets/form_error.dart';
import 'package:kolisamaj/utils/network_util.dart';
import 'package:sms_autofill/sms_autofill.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  String _phonenumber, Token, number, phonecode, sendnum;
  final formKey = new GlobalKey<FormState>();
  TextEditingController phoneNumEditingController = TextEditingController();
  SmsAutoFill smsAutoFill = SmsAutoFill();
  NetworkUtil _netUtil = new NetworkUtil();
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  void initState() {
    super.initState();
    PhoneFieldHint();
    getCurrentNumber();
  }

  getCurrentNumber() async {
    number = await smsAutoFill.hint;
    phoneNumEditingController.text = number.replaceFirst("+91", '');
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: <Widget>[
            // SizedBox(height: 50,),
            Center(
              child: Container(
                child: Text(
                  "Enter your mobile number",
                  style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                ),
              ),
            ),
            Center(
              child: Container(
                child: Text(
                  "to continue ",
                  style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CountryPickerDropdown(
                  itemBuilder: _buildDropdownItem,
                  onValuePicked: (Country country) {
                    setState(() => phonecode = country.phoneCode);
                    print("${country.phoneCode}");
                  },
                ),
                Flexible(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[500],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                      child: Form(
                        key: formKey,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 200,
                          child: TextFormField(
                            controller: phoneNumEditingController,
                            keyboardType: TextInputType.number,
                            onSaved: (val) => _phonenumber = val,
                            onChanged: (value) {
                              if (value.isNotEmpty && value.length != 10) {
                                removeError(
                                    error:
                                        "Please Enter your 10 Digit Mobile Number");
                              }
                              return "";
                            },
                            validator: validateMobile,
                            decoration: InputDecoration(
                              hintText: "1234567890",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            FormError(errors: errors),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                "Tap Next to verify your account. An SMS may be sent to verify your number.",
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
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
                  'NEXT',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                // ignore: unrelated_type_equality_checks
                onPressed: () {
                  final form = formKey.currentState;
                  if (form.validate()) {
                    form.save();
                    sendnum = phonecode.toString() + _phonenumber.toString();
                    Navigator.of(context).pushNamed("/otp", arguments: {
                      // "code": res["otp"],
                      "mobile": sendnum,
                    });
                  }
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
          ],
        ),
      ),
    );
  }

  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.isEmpty || (value.length != 10 && value.isNotEmpty)) {
      addError(error: "Please Enter your 10 Digit Mobile Number");
      return "";
    }
  }

  Widget _buildDropdownItem(Country country) {
    return Container(
      child: Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(
            width: 10.0,
          ),
          Text("+${country.phoneCode} (${country.isoCode})"),
        ],
      ),
    );
  }
}
