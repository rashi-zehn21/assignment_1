import 'dart:convert';

import 'package:assignment_1/notification_icon.dart';
import 'package:assignment_1/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int counter = 0;
  TabController? _tabController;

  HomeDetailBloc bloc = HomeDetailBloc();
  @override
  void initState() {
    super.initState();
    // readJson();
    bloc.add(VideoScreenPressed());
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }
  // callvideoBlocEvent() {
  //   bloc.add(VideoScreenPressed(Url: Url));
  // }

  @override
  void dispose() {
    super.dispose();
  }

  // List items = [];

  // Future<void> readJson() async {
  //   final String response = await rootBundle.loadString('assets/home.json');
  //   final data = await json.decode(response);
  //   setState(() {
  //     items = data["data"];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          NotificationIcon(
            text: 'Inbox',
            iconData: Icons.notifications,
            notificationCount: counter,
            onPressed: () {
              //print("Increment Counter");
              setState(() {
                counter++;
              });
            },
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: TabBarView(
        physics: BouncingScrollPhysics(),
        controller: _tabController!,
        children: <Widget>[
          Center(
            child: BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is HomeDetailLoading) {
                  CircularProgressIndicator();
                }
                if (state is HomeDetailSuccess) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(" Strength Training",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w900,
                              )),
                          SizedBox(height: 20),
                          CarouselSlider.builder(
                            itemCount: state.item.length,
                            itemBuilder: (BuildContext context, int itemIndex,
                                    int pageViewIndex) =>
                                InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VideoPlayerScreen(
                                              url: state.item[itemIndex]["url"]
                                                  .toString(),
                                              Duration: state.item[itemIndex]
                                                  ["Duration"],
                                              Description: state.item[itemIndex]
                                                  ["Description"],
                                              Ratings: state.item[itemIndex]
                                                  ["Ratings"],
                                              Trainig_Name:
                                                  state.item[itemIndex]
                                                      ["Trainig_Name"],
                                            )));
                              },
                              child: Stack(
                                children: <Widget>[
                                  // GestureDetector(
                                  //   onTap: (() {
                                  //     Navigator.push(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               VideoPlayerScreen(
                                  //             items: 'dee',
                                  //             // items: state.item[itemIndex]["img"]
                                  //             //     .toString(),
                                  //           ),
                                  // settings: RouteSettings(
                                  //   arguments: state.item[itemIndex]
                                  //           ["img"]
                                  //       .toString(),
                                  // )),
                                  // ));
                                  // }),
                                  Container(
                                    height: 230,
                                    width: 190,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.all(2.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.black,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.5),
                                            BlendMode.dstATop),
                                        image: NetworkImage(state
                                            .item[itemIndex]["img"]
                                            .toString()),
                                      ),
                                    ),
                                  ),
                                  // ),
                                  SizedBox(height: 50),
                                  Positioned(
                                      top: 15,
                                      right: 2,
                                      left: 15,
                                      bottom: 10,
                                      child: Text(
                                        state.item[itemIndex]["Training_Name"],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 24.0),
                                      )),
                                  Positioned(
                                      top: 50,
                                      right: 5,
                                      left: 15,
                                      child: Text(
                                        state.item[itemIndex]["Duration"],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 22.0),
                                      )),
                                  const SizedBox(height: 60),
                                  Positioned(
                                    top: 160,
                                    left: 15,
                                    child: ElevatedButton(
                                      onPressed: () {},

                                      // ignore: sort_child_properties_last
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            state.item[itemIndex]["Ratings"],
                                          ),
                                        ],
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromARGB(255, 10, 169, 169),
                                          shape: StadiumBorder()),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            options: CarouselOptions(
                              height: 230.0,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              viewportFraction: 0.5,
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Endurance Training ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7),
                            child: Container(
                              height: 180,
                              child: ListView.builder(
                                  itemCount: state.item.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                              width: 180,
                                              height: 185,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  color: Colors.black,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                            Colors
                                                                .black
                                                                .withOpacity(
                                                                    0.5),
                                                            BlendMode.dstATop),
                                                    image: NetworkImage(state
                                                        .item[index]["img"]
                                                        .toString()),
                                                  ))),
                                          Positioned(
                                              top: 20,
                                              left: 10,
                                              child: Text(
                                                state.item[index]
                                                        ["Training_Name"]
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 22.0),
                                              )),
                                          Positioned(
                                              top: 55,
                                              left: 10,
                                              child: Text(
                                                state.item[index]["Duration"]
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 22.0),
                                              )),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ]),
                  );
                }
                if (state is HomeDetailError) {
                  return CircularProgressIndicator();
                }
                return Container();
              },
            ),
          ),
          Center(
            child: Text("Cart"),
          ),
          Center(
            child: Text("Bag"),
          ),
          Center(
            child: Text("Profile"),
          ),
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        labels: const [
          "Home",
          "Cart",
          "Bag",
          "Profile",
        ],

        icons: const [
          Icons.home,
          Icons.shopping_cart,
          Icons.work,
          Icons.person,
        ],
        tabSize: 60,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Color.fromARGB(255, 190, 195, 191),
        tabIconSize: 30.0,
        tabIconSelectedSize: 32.0,
        tabSelectedColor: Color.fromARGB(255, 245, 242, 242),
        tabIconSelectedColor: const Color.fromARGB(255, 10, 169, 169),
        // ignore: prefer_const_constructors
        tabBarColor: Color.fromARGB(
          255,
          253,
          252,
          252,
        ),
        onTabItemSelected: (int value) {
          setState(() {
            _tabController!.index = value;
          });
        },
      ),
    );
  }
}
