import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:schrout_app/screens/bike_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //header
                Row(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/profile.png'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          'Abhi Tiwari',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                //search bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(
                        20.0), // Adjust the radius for the desired curve
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                //tags
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TagContainer(
                        title: 'Adventure',
                        boxColor: Colors.white,
                        textColor: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TagContainer(
                        title: 'Cruiser',
                        boxColor: Colors.black,
                        textColor: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TagContainer(
                        title: 'Sportsbike',
                        boxColor: Colors.white,
                        textColor: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TagContainer(
                        title: 'tourer',
                        boxColor: Colors.white,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                //popular items
                Text(
                  'Popular items',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BikeDetails()));
                    },
                    child: Row(
                      children: [
                        ItemCard(
                            title: 'Meteore',
                            imageUrl: 'assets/images/meteor.png',
                            rate: '699/per day',
                            subtitle: 'Royal Enfield'),
                        ItemCard(
                            title: 'Scout Bobber',
                            imageUrl: 'assets/images/scout.png',
                            rate: '1499/per day',
                            subtitle: 'Indian'),
                        ItemCard(
                            title: 'Rebel 1100',
                            imageUrl: 'assets/images/meteor.png',
                            rate: '1199/per day',
                            subtitle: 'Honda')
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                //recently viewed
                Text(
                  'Recent items',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                RecentlyViewed(imageUrl: 'assets/images/haya.png', status: 'Available', boxColor: Colors.black, rate: '200/per day', title: 'Hayabusa', textColor: Colors.white),
                RecentlyViewed(imageUrl: 'assets/images/classic.png', status: 'Booked', boxColor: Colors.grey, rate: '1500/per day', title: 'Classic 350', textColor: Colors.black),
                RecentlyViewed(imageUrl: 'assets/images/zx.png', status: 'Available', boxColor: Colors.black, rate: '1500/per day', title: 'Ninja-zx-7r', textColor: Colors.white),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Image.asset('assets/images/home.png'),
      label: 'home'),
      BottomNavigationBarItem(icon: Image.asset('assets/images/map.png'),label: 'map'),
      BottomNavigationBarItem(icon: Image.asset('assets/images/card.png'),label: 'card'),
      BottomNavigationBarItem(icon: Image.asset('assets/images/Settings.png'),label: 'settings'),
    ]);
  }
}


class TagContainer extends StatefulWidget {
  final String title;
  final Color textColor;
  final Color boxColor;
  const TagContainer(
      {Key? key,
      required this.title,
      required this.textColor,
      required this.boxColor})
      : super(key: key);

  @override
  State<TagContainer> createState() => _TagContainerState();
}

class _TagContainerState extends State<TagContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 60,
      decoration: BoxDecoration(
        color: widget.boxColor,
        borderRadius: BorderRadius.circular(60.0),
        border: Border.all(
          color: Colors.grey, // Set the border color to blue
          width: 3.0, // Set the border width
        ), // Adjust the radius for the desired curve
      ),
      child: Center(
          child: Text(
        widget.title,
        style: TextStyle(color: widget.textColor, fontSize: 20),
      )),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String rate;
  const ItemCard(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.rate,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 150,
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.fill,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            Text(subtitle,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                )),
            Text(rate,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ))
          ],
        ),
      ),
    );
  }
}

class RecentlyViewed extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String rate;
  final String status;
  final Color boxColor;
  final Color textColor;
  const RecentlyViewed(
      {Key? key,
      required this.imageUrl,
      required this.status,
      required this.boxColor,
      required this.rate,
      required this.title,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(imageUrl),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    rate,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 60,),
              Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(10.0),
                   // Adjust the radius for the desired curve
                ),
                child: Center(
                    child: Text(
                  status,
                  style: TextStyle(color: textColor, fontSize: 15),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
