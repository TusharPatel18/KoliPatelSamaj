import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kolisamaj/data/rest_ds.dart';
import 'package:kolisamaj/models/member.dart';
import 'package:kolisamaj/utils/connectionStatusSingleton.dart';
import 'package:kolisamaj/utils/internetconnection.dart';
import 'package:kolisamaj/utils/network_util.dart';

import 'package:url_launcher/url_launcher.dart';

class MemberListScreen extends StatefulWidget {
  @override
  _MemberListScreenState createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  NetworkUtil _netUtil = new NetworkUtil();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey1 =
      new GlobalKey<RefreshIndicatorState>();
  Future<List<Members>> userdata;
  Future<List<Members>> userfilterData;

  // Future<List<FilterMembers>> filterdata;
  // Future<List<FilterMembers>> _getFilterrData() async {
  //   return _netUtil.post(RestDatasource.GET_MEMBER_FILTER,
  //       body: {
  //         "txtgautra": (_Gautra == "") ? "0" : _Gautra,
  //         "txtnative":(_NativePlace == "") ? "0" : _NativePlace,
  //         "txtgender": (_Gender == "" || _Gender == "ALL") ? "0" : _Gender,
  //         "txttype": (_MemberType == "" || _MemberType == "ALL") ? "0" : _MemberType,
  //         "txtprofession": (_Profession == null || _Profession == "") ? "0" : _Profession,
  //         "txtbloodgroup": (_BloodGroup == "" || _BloodGroup == "ALL") ? "0" : _BloodGroup,
  //         "txtmar": (_Married == "" || _Married == "ALL") ? "0" : _Married,
  //         "txtocity": (_Officecity == "") ? "0" : _Officecity,
  //         "txtncity": (_Nativecity == "") ? "0" : _Nativecity,
  //         "txtrlandmark": "",
  //         "txtolandmark": "",
  //         "txtnlandmark": "",
  //         "txtspecialinfo": "",
  //         "txtpovlevel": "",
  //       }).then((dynamic res) {
  //         print(res);
  //     final items = res.cast<Map<String, dynamic>>();
  //     List<FilterMembers> listofusers = items.map<FilterMembers>((json) {
  //       return FilterMembers.fromJson(json);
  //     }).toList();
  //     List<FilterMembers> revdata = listofusers.reversed.toList();
  //     return revdata;
  //   });
  // }

  // _FilterData(){
  //   setState(() {
  //     filterdata =  _getFilterrData();
  //     _isLoad = true;
  //   });
  // }

  TextEditingController _searchQueryUser;
  bool _isSearchingUser = false;
  String searchQueryUser = "Search query";

  _loadPref() async {
    setState(() {
      // userdata = _getUserData("user");
      // userfilterData = userdata;
      // gautraListdata = _getGautraListData();
      // nativePlaceListdata = _getnativePlaceListData();
      // professionListdata = _getprofessionListData();
      // ResidencecityListdata = _getCityListData();
      // OfficecityListdata = _getCityListData();
      // NativecityListdata = _getCityListData();
    });
  }

  // Future<List<Members>> _refresh1() async {
  //   setState(() {
  //     userdata = _getUserData("user");
  //     userfilterData = userdata;
  //   });
  // }

  // Future<List<Members>> _getUserData(String usertype) async {
  //   return _netUtil.post(RestDatasource.URL_MEMBER_LIST,
  //       body: {"usertype": usertype}).then((dynamic res) {
  //     final items = res.cast<Map<String, dynamic>>();
  //     List<Members> listofusers = items.map<Members>((json) {
  //       return Members.fromJson(json);
  //     }).toList();
  //     List<Members> revdata = listofusers.reversed.toList();
  //     return revdata;
  //   });
  // }

  bool isOffline = false;
  InternetConnection connection = new InternetConnection();
  StreamSubscription _connectionChangeStream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ConnectionStatusSingleton connectionStatus =
        ConnectionStatusSingleton.getInstance();
    connectionStatus.initialize();
    _connectionChangeStream =
        connectionStatus.connectionChange.listen(connectionChanged);
    _loadPref();
    _searchQueryUser = new TextEditingController();
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
      //print(isOffline);
    });
  }

  Widget _buildSearchField() {
    return new TextField(
      controller: _searchQueryUser,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.white),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: updateSearchQuery,
    );
  }

  List<Widget> _buildActions() {
    if (_isSearchingUser) {
      return <Widget>[
        new IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryUser == null || _searchQueryUser.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }
    return <Widget>[
      new IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  void _clearSearchQuery() {
    //print("close search box");
    setState(() {
      _searchQueryUser.clear();
      userfilterData = userdata;
      updateSearchQuery("");
    });
  }

  void _startSearch() {
    //print("open search box");
    ModalRoute.of(context)
        .addLocalHistoryEntry(new LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearchingUser = true;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();
    setState(() {
      _isSearchingUser = false;
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQueryUser = newQuery;
      if (_searchQueryUser.toString().length > 0) {
        Future<List<Members>> items = userdata;
        List<Members> filter = new List<Members>();
        items.then((result) {
          for (var record in result) {
            if (record.FirstName.toLowerCase()
                    .toString()
                    .contains(searchQueryUser.toLowerCase()) ||
                record.MiddleName.toLowerCase()
                    .toString()
                    .contains(searchQueryUser.toLowerCase()) ||
                record.LastGautra.toLowerCase()
                    .toString()
                    .contains(searchQueryUser.toLowerCase()) ||
                record.Mobile1.toLowerCase()
                    .toString()
                    .contains(searchQueryUser.toLowerCase())) {
              filter.add(record);
            }
          }
          userfilterData = Future.value(filter);
        });
      } else {
        userfilterData = userdata;
      }
    });
  }

  bool _isLoad = false;
  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (isOffline) {
      return connection.nointernetconnection();
    } else {
      return Scaffold(
        appBar: AppBar(
            title: _isSearchingUser
                ? _buildSearchField()
                : RichText(
                    text: TextSpan(
                        text: "Members",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        children: [
                          TextSpan(
                              text: "",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15))
                        ]),
                  ),
            actions: [
              ..._buildActions(),
              IconButton(
                icon: Icon(
                  Icons.bar_chart,
                  color: Colors.white,
                ),
                onPressed: () {
                  // showBottomSheet();
                  // Navigator.of(context).pushNamed("/advancesearchmembers");
                },
              ),
            ]),
        body: FutureBuilder<List<Members>>(
          future: userfilterData,
          builder: (context, snapshot) {
            //print(snapshot.data);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: Text("No Data Available!"),
              );
            }
            return ListView(
              padding: EdgeInsets.only(bottom: 70.0, top: 10),
              children: snapshot.data
                  .map(
                    (data) => InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed("/memberdetails", arguments: {
                          "id": data.MembershipId,
                          "FirstName": data.FirstName,
                          "Contact": data.Mobile1,
                          "Photo": data.Photo,
                          "MiddleName": data.MiddleName,
                          "LastGautra": data.LastGautra,
                          "Education": data.Education,
                          "OtherEducationName": data.OtherEducationName,
                          "EmailId": data.EmailId,
                          "BloodGroup": data.BloodGroup,
                          "MainMemberId": data.MainMemberId,
                          "DOB": data.DOB,
                          "Relation": data.Relation,
                          "Mobile2": data.Mobile2,
                          "Mobile3": data.Mobile3,
                          "MemberType": data.MemberType,
                          "ProfessionId": data.ProfessionId,
                          "ProfessionName": data.ProfessionName,
                          "NativeId": data.NativeId,
                          "NanihalGautra": data.NanihalGautra,
                          "NanihalNative": data.NativeName,
                          "NanihalBusiness": data.NanihalBusiness,
                          "SasuralGautra": data.SasuralGautra,
                          "SasuralNative": data.SasuralNative,
                          "SasuralBusiness": data.SasuralBusiness,
                          "Gender": data.Gender,
                          "Married": data.Married,
                          "AniversaryDate": data.AniversaryDate,
                          "ResidanceLandmark": data.ResidanceLandmark,
                          "ResidenaceCityId": data.ResidenaceCityId,
                          "ResidanceMobile": data.ResidanceMobile,
                          "ResidanceTelephone": data.ResidanceTelephone,
                          "ResidancePincode": data.ResidancePincode,
                          "ResidanceAddress": data.ResidanceAddress,
                          "OfficeFirmName": data.OfficeFirmName,
                          "OfficeWebsite": data.OfficeWebsite,
                          "OfficeEmailId": data.OfficeEmailId,
                          "OfficeAddress": data.OfficeAddress,
                          "OfficeLandmark": data.OfficeLandmark,
                          "OfficeCityId": data.OfficeCityId,
                          "OfficeMobile": data.OfficeMobile,
                          "OfficeTelephone": data.OfficeTelephone,
                          "OfficePincode": data.OfficePincode,
                          "NativeOffice": data.NativeOffice,
                          "NativeLandmark": data.NativeLandmark,
                          "NativeCityId": data.NativeCityId,
                          "NativeMobile": data.NativeMobile,
                          "NativeTelephone": data.NativeTelephone,
                          "NativePincode": data.NativePincode,
                          "RecName1": data.RecName1,
                          "RecName2": data.RecName2,
                          "TrusteeName": data.TrusteeName,
                          "FormNumber": data.FormNumber,
                          "NativeName": data.NativeName,
                          "rcity": data.rcity,
                          "rstate": data.rstate,
                          "ostate": data.ostate,
                          "ocity": data.ocity,
                          "nstate": data.nstate,
                          "ncity": data.ncity,
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          ListTile(
                              // leading: (data.Photo == null ||
                              //     data.Photo == "")
                              //     ? CircleAvatar(
                              //   radius: 30,
                              //   child: new Text(
                              //     data.FirstName[0].toUpperCase() +
                              //         data.MiddleName[0].toUpperCase(),
                              //     style: new TextStyle(
                              //         fontWeight: FontWeight.bold,
                              //         color: Color(0xFFF44336)),
                              //   ),
                              //   backgroundColor: Colors.red.shade100,
                              // )
                              //     : CircleAvatar(
                              //   radius: 30,
                              //   backgroundImage: NetworkImage(
                              //       RestDatasource.Committee_IMAGE_URL +
                              //           data.Photo),
                              // ),
                              title: new Text(
                                ((data.FirstName == null ||
                                            data.FirstName == "")
                                        ? "-"
                                        : data.FirstName.toUpperCase()) +
                                    " " +
                                    ((data.MiddleName == null ||
                                            data.MiddleName == "")
                                        ? "-"
                                        : data.MiddleName.toUpperCase()) +
                                    " " +
                                    ((data.LastGautra == null ||
                                            data.LastGautra == "")
                                        ? "-"
                                        : data.LastGautra.toUpperCase()),
                                style: new TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              subtitle: new Text(
                                  (data.Mobile1 == null || data.Mobile1 == "")
                                      ? "-"
                                      : data.Mobile1),
                              trailing: IconButton(
                                  icon: Icon(
                                    Icons.call,
                                    color: Colors.black,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    var url = data.Mobile1 ?? "";
                                    if (await canLaunch('tel:$url')) {
                                      await launch('tel:$url');
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  })),
                          Divider(
                            thickness: 2,
                            indent: 20,
                            endIndent: 20,
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      );
    }
  }
}
