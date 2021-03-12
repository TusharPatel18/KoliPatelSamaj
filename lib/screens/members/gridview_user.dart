import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kolisamaj/color_style.dart';
import 'package:transparent_image/transparent_image.dart';

class UserGrideViewScreen extends StatefulWidget {
  @override
  _UserGrideViewScreenState createState() => _UserGrideViewScreenState();
}

class _UserGrideViewScreenState extends State<UserGrideViewScreen> {
  final GlobalKey<PopupMenuButtonState<int>> _key = GlobalKey();
  List<String> imageList = [
    'https://cdn.pixabay.com/photo/2021/02/26/19/31/snowdrop-6052942_960_720.jpg',
    'https://cdn.pixabay.com/photo/2021/02/09/20/45/architecture-5999913_960_720.jpg',
    'https://cdn.pixabay.com/photo/2021/02/24/09/51/magical-6046020_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/06/03/20/20/flowers-5256297_960_720.jpg',
    'https://cdn.pixabay.com/photo/2021/01/10/04/37/salad-5904093_960_720.jpg',
    'https://cdn.pixabay.com/photo/2021/02/01/20/16/yachts-5971866_960_720.jpg',
    'https://cdn.pixabay.com/photo/2021/02/15/11/53/emotional-6017581_960_720.jpg'
  ];

  List<Widget> _buildActions() {
    // if (_isSearchingUser) {
    //   return <Widget>[
    //     new IconButton(
    //       icon: const Icon(Icons.clear),
    //       onPressed: () {
    //         if (_searchQueryUser == null || _searchQueryUser.text.isEmpty) {
    //           Navigator.pop(context);
    //           return;
    //         }
    //         _clearSearchQuery();
    //       },
    //     ),
    //   ];
    // }
    return <Widget>[
      new IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {}
        // _startSearch
        ,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Business",
          style: Appconstants.NavBarStyle,
        ),
        actions: [
          ..._buildActions(),
          PopupMenuButton(
            icon: Icon(Icons.menu_outlined),
            tooltip: 'Filter',
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  'FAQ',
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  'Website',
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(12),
        child: new StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("/MemberdetailsScreen");
                },
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.deepPurple[50],
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 130,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: imageList[index],
                              fit: BoxFit.cover,
                              // height: 100,
                              // width: MediaQuery.of(context).size.width,
                            ),
                            // child: Image.network(imageList[index],fit: BoxFit.cover,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "Satish Patel",
                                style: Appconstants.CommanTextStyle,
                              ),
                              Text(
                                "CEO At Karon Infotech",
                                style: Appconstants.CommanTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            staggeredTileBuilder: (index) {
              return new StaggeredTile.count(1, index.isEven ? 1.2 : 1.2);
            }),
      ),
    );
  }
}
