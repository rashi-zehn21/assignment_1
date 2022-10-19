import 'package:assignment_1/notification_icon.dart';
import 'package:assignment_1/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
    bloc.add(VideoScreenPressed());
    _tabController = TabController(
      initialIndex: 1,
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
        physics:
            const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        controller: _tabController!,
        // ignore: sort_child_properties_last
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is HomeDetailLoading) {
                  CircularProgressIndicator();
                }
                if (state is HomeDetailSuccess) {
                  return Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        children: [
                          const Text(" Strength Training",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w900,
                              )),
                          const SizedBox(height: 20),
                          CarouselSlider(
                            items: [
                              //const SizedBox(height: 39),
                              //1st Image of Slider

                              Center(
                                child: Stack(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: (() {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VideoPlayerScreen()),
                                        );
                                      }),
                                      child: Container(
                                        height: 230,
                                        width: 190,
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: Colors.black,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(
                                                Colors.black.withOpacity(0.4),
                                                BlendMode.dstATop),
                                            image: const NetworkImage(
                                                "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Z3ltfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                                            //fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 50),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VideoPlayerScreen()),
                                        );
                                      },
                                      child: const Positioned(
                                          top: 25,
                                          right: 2,
                                          left: 10,
                                          bottom: 10,
                                          child: Text(
                                            'Shoulders+Back',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 24.0),
                                          )),
                                    ),
                                    const Positioned(
                                        top: 60,
                                        right: 10,
                                        left: 25,
                                        child: Text(
                                          '10 min ',
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
                                        onPressed: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                VideoPlayerScreen(),
                                          ));
                                        },
                                        // ignore: sort_child_properties_last
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: const [
                                            Icon(
                                              Icons.star,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            Text(" 4.8"),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: const Color.fromARGB(
                                                255, 10, 169, 169),

                                            //alignment: Alignment.bottomLeft,
                                            shape: const StadiumBorder()),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              //2nd Image of Slider

                              Center(
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      height: 250,
                                      width: 190,
                                      margin: const EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: Colors.black,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(0.4),
                                              BlendMode.dstATop),
                                          image: const NetworkImage(
                                              "https://media.gettyimages.com/photos/view-of-a-row-of-treadmills-in-a-gym-with-people-picture-id1183038884?s=612x612"),

                                          //fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                        top: 25,
                                        right: 50,
                                        left: 25,
                                        bottom: 10,
                                        child: Text(
                                          'Cardio',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25.0),
                                        )),
                                    const Positioned(
                                        top: 60,
                                        right: 10,
                                        left: 25,
                                        child: Text(
                                          '15 min ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 22.0),
                                        )),
                                    Positioned(
                                      //alignment: Alignment.bottomLeft,
                                      top: 160,
                                      left: 15,
                                      //bottom: 10,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        // ignore: sort_child_properties_last
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: const [
                                            Icon(
                                              Icons.star,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            Text(" 3.8"),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: const Color.fromARGB(
                                                255, 10, 169, 169),

                                            //alignment: Alignment.bottomLeft,
                                            shape: const StadiumBorder()),
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              //3rd Image of Slider
                              Center(
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: Colors.black,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(0.6),
                                              BlendMode.dstATop),
                                          image: const NetworkImage(
                                              "https://img.freepik.com/premium-photo/3d-rendering-black-dumbbells-floor-dark-concept-fitness-room-with-training-equipments-back_67155-14961.jpg?w=2000"),
                                          //fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                        top: 25,
                                        right: 10,
                                        left: 25,
                                        bottom: 10,
                                        child: Text(
                                          'Weightlifting',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25.0),
                                        )),
                                    const Positioned(
                                        top: 60,
                                        right: 10,
                                        left: 25,
                                        child: Text(
                                          '15 min ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 22.0),
                                        )),
                                    Positioned(
                                      //alignment: Alignment.bottomLeft,
                                      top: 160,
                                      left: 15,
                                      //bottom: 10,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        // ignore: sort_child_properties_last
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: const [
                                            Icon(
                                              Icons.star,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            Text(" 3.8"),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: const Color.fromARGB(
                                                255, 10, 169, 169),

                                            //alignment: Alignment.bottomLeft,
                                            shape: const StadiumBorder()),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              //4th Image of Slider
                              Center(
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                        margin: const EdgeInsets.all(6.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            color: Colors.black,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(
                                                  Colors.black.withOpacity(0.5),
                                                  BlendMode.dstATop),
                                              image: const NetworkImage(
                                                  "https://img.freepik.com/premium-photo/3d-rendering-black-dumbbells-floor-dark-concept-fitness-room-with-training-equipments-back_67155-14961.jpg?w=2000"),
                                              //fit: BoxFit.cover,
                                            ))),
                                    const Positioned(
                                        top: 25,
                                        right: 5,
                                        left: 25,
                                        bottom: 10,
                                        child: Text(
                                          'Dumbbell Workout',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 24.0),
                                        )),
                                    const Positioned(
                                        top: 80,
                                        right: 10,
                                        left: 39,
                                        child: Text(
                                          '15 min ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 22.0),
                                        )),
                                    Positioned(
                                      //alignment: Alignment.bottomLeft,
                                      top: 160,
                                      left: 15,
                                      //bottom: 10,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        // ignore: sort_child_properties_last
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: const [
                                            Icon(
                                              Icons.star,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            Text(" 4.5"),
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: const Color.fromARGB(
                                                255, 10, 169, 169),

                                            //alignment: Alignment.bottomLeft,
                                            shape: const StadiumBorder()),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              //5th Image of Slider
                              Center(
                                  child: Stack(
                                children: <Widget>[
                                  Container(
                                    height: 250,
                                    margin: const EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.black,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.5),
                                            BlendMode.dstATop),
                                        image: const NetworkImage(
                                            "https://image.shutterstock.com/image-photo/athletic-shirtless-young-sports-man-260nw-695401201.jpg"),
                                        //fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                      top: 25,
                                      right: 10,
                                      left: 25,
                                      bottom: 10,
                                      child: Text(
                                        'Bodybuilding',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 25.0),
                                      )),
                                  const Positioned(
                                      top: 60,
                                      right: 10,
                                      left: 25,
                                      child: Text(
                                        '20 min ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 22.0),
                                      )),
                                  Positioned(
                                    //alignment: Alignment.bottomLeft,
                                    top: 160,
                                    left: 15,
                                    //bottom: 10,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      // ignore: sort_child_properties_last
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: const [
                                          Icon(
                                            Icons.star,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          Text(" 3.8"),
                                        ],
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: const Color.fromARGB(
                                              255, 10, 169, 169),

                                          //alignment: Alignment.bottomLeft,
                                          shape: const StadiumBorder()),
                                    ),
                                  )
                                ],
                              ))
                            ],
                            //Slider Container properties
                            options: CarouselOptions(
                              height: 230.0,
                              enlargeCenterPage: true,
                              //autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              // enableInfiniteScroll: true,
                              // autoPlayAnimationDuration:
                              //     const Duration(milliseconds: 800),
                              viewportFraction: 0.5,
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 26),
                            child: Text(
                              "Endurance Training ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            //padding: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Center(
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                          width: 180,
                                          height: 185,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              color: Colors.black,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                colorFilter: ColorFilter.mode(
                                                    Colors.black
                                                        .withOpacity(0.5),
                                                    BlendMode.dstATop),
                                                image: const NetworkImage(
                                                    "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Z3ltfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                                                //fit: BoxFit.cover,
                                              ))),
                                      const Positioned(
                                          top: 20,
                                          left: 7,
                                          //left: 5,
                                          //bottom: 12,
                                          child: Text(
                                            'Pectoral Training',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 22.0),
                                          )),
                                      const Positioned(
                                          top: 55,
                                          right: 20,
                                          left: 45,
                                          child: Text(
                                            '15 min ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 22.0),
                                          )),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Stack(children: <Widget>[
                                    Container(
                                      width: 180,
                                      height: 185,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: Colors.black,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(0.4),
                                              BlendMode.dstATop),
                                          image: const NetworkImage(
                                              "https://media.gettyimages.com/photos/view-of-a-row-of-treadmills-in-a-gym-with-people-picture-id1183038884?s=612x612"),
                                          //fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                        top: 20,
                                        right: 50,
                                        left: 25,
                                        bottom: 10,
                                        child: Text(
                                          'cardio',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25.0),
                                        )),
                                    const Positioned(
                                        top: 55,
                                        right: 10,
                                        left: 25,
                                        child: Text(
                                          '15 min ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 22.0),
                                        )),
                                  ]),
                                )
                              ],
                            ),
                          ),
                        ]),
                  );
                }
                return Container();
              },
            ),
          ),
          const Center(
            child: Text("Cart"),
          ),
          const Center(
            child: Text("Bag"),
          ),
          const Center(
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
