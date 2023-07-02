import 'package:flutter/material.dart';
import 'package:reservation/services/my_constant.dart';
import 'package:reservation/services/size_config.dart';
import 'package:reservation/widget/my_bottom_bar.dart';
import 'package:reservation/widget/my_text.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  ScrollController _scrollController;

  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: MyBottomBar(
        index: 1,
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 250.0,
                  floating: false,
                  pinned: true,
                  elevation: 1.0,
                  backgroundColor: Colors.white,
                  leading: IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                        size: 30,
                        color: isShrink ? Colors.black : Colors.white,
                      ),
                      onPressed: () {
                        // Do something
                      }),
                  centerTitle: true,
                  title: isShrink
                      ? MyText(
                          data: "Reservation",
                          color: primary,
                        )
                      : null,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                        color: isShrink ? Colors.black : Colors.white,
                      ),
                      onPressed: null,
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                    "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/0eea4d96195471.5ea8d6edeb638.jpg",
                    fit: BoxFit.none,
                    scale: 2.2,
                    alignment: Alignment(0.0, 0.3),
                  )),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText(
                                data: "Restaurant Mampino",
                                fontFamily: "roboto",
                                fontSize: 22,
                              ),
                              MyText(
                                data: "Street pondo indah mall no. 15 Medan",
                                fontSize: 14,
                                color: grey,
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              size: 28,
                              color: grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 80,
                        child: Divider(
                          color: grey,
                          thickness: 0.3,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, top: 10.0, bottom: 10.0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText(
                                data: "Opening Hours",
                                fontFamily: "roboto",
                                fontSize: 16,
                              ),
                              SizedBox(
                                width: 239,
                              ),
                              MyText(
                                data: "Mon - Friday : 10am-11pm",
                                fontSize: 12,
                                color: grey,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText(
                                data: "Cuisine",
                                fontFamily: "roboto",
                                fontSize: 16,
                              ),
                              MyText(
                                data: "Chinese, Asian",
                                fontSize: 12,
                                color: grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, top: 10.0, bottom: 10.0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText(
                                data: "Serves",
                                fontFamily: "roboto",
                                fontSize: 16,
                              ),
                              MyText(
                                data: "Lunch, Dinner",
                                fontSize: 12,
                                color: grey,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 160,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText(
                                data: "Price",
                                fontFamily: "roboto",
                                fontSize: 16,
                              ),
                              MyText(
                                data: "\$12.99 - \$18.99",
                                fontSize: 12,
                                color: grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 80,
                        child: Divider(
                          color: grey,
                          thickness: 0.3,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 10.0, bottom: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(0.0),
                            width: 30,
                            height: 30,
                            child: Icon(
                              Icons.star_border,
                              size: 20,
                              color: grey,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, top: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                MyText(
                                  data: "Good For",
                                  fontFamily: "roboto",
                                  fontSize: 16,
                                ),
                                Container(
                                  width: SizeConfig.blockSizeHorizontal * 70,
                                  child: MyText(
                                    data:
                                        "Business Meetings, Casual Dining, Drinks, Kid Friendl,"
                                        " Larg Parties, Private Functions.",
                                    fontSize: 14,
                                    color: grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 10.0, bottom: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(0.0),
                            width: 30,
                            height: 30,
                            child: Icon(
                              Icons.bookmark_border,
                              size: 20,
                              color: grey,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, top: 3.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                MyText(
                                  data: "Reservation",
                                  fontFamily: "roboto",
                                  fontSize: 16,
                                ),
                                Container(
                                  width: SizeConfig.blockSizeHorizontal * 70,
                                  child: MyText(
                                    data:
                                        "Restaurant reservation within 24 hours,"
                                        " Free cancellation for 48 hours.",
                                    fontSize: 14,
                                    color: grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 80,
                        child: Divider(
                          color: grey,
                          thickness: 0.3,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 10.0, bottom: 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyText(
                            data: "About Restaurant",
                            fontFamily: "roboto",
                            fontSize: 18,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 78,
                              child: MyText(
                                data: "Street pondo indah mall no. 15 Medan"
                                    "Street pondo indah mall no. 15 Medan"
                                    "Street pondo indah mall no. 15 Medan"
                                    "Street pondo indah mall no. 15 Medan."
                                    "\n\n"
                                    "Street pondo indah mall no. 15 Medan"
                                    "Street pondo indedan"
                                    "Street pondo indah mall no. 15 Medan.",
                                fontSize: 14,
                                color: grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 10.0, bottom: 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyText(
                            data: "Gallery",
                            fontFamily: "roboto",
                            fontSize: 18,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 20),
                            child: Container(
                                width: SizeConfig.blockSizeHorizontal * 78,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      child: SizedBox(
                                        height: 200,
                                        width: 120,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/e6d6b596195471.5ea8d6edec80b.jpg",
                                                    scale: 5.8),
                                                fit: BoxFit.none,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 130,
                                      child: SizedBox(
                                        height: 90,
                                        width: 90,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/fa891596195471.5ea8d6eded7ad.jpg",
                                                    scale: 3.8),
                                                fit: BoxFit.none,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 230,
                                      child: SizedBox(
                                        height: 90,
                                        width: 90,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/398f2796195471.5ea8d6edece45.jpg",
                                                    scale: 9.8),
                                                fit: BoxFit.none,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 98,
                                      left: 130,
                                      child: SizedBox(
                                        height: 100,
                                        width: 190,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/fd8f6596195471.5ea8d6eded30e.jpg",
                                                    scale: 3.8),
                                                fit: BoxFit.none,
                                                colorFilter: ColorFilter.mode(
                                                    Colors.black
                                                        .withOpacity(0.6),
                                                    BlendMode.darken),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 40.0, left: 60.0),
                                            child: MyText(
                                              data: "+ 6 photos",
                                              fontFamily: "roboto",
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
