import 'package:flutter/material.dart';
import 'package:schrout_app/screens/checkouit.dart';
import 'package:schrout_app/utils/constants.dart';

class BikeDetails extends StatelessWidget {
  const BikeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.arrow_back),
                    Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: Colors.grey, // Set the border color to blue
                          width: 2.0, // Set the border width
                        ), // Adjust the radius for the desired curve
                      ),
                      child: Center(
                          child: Text(
                        'Bike Details',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                //main item
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: AppConstants.screenWidth(context) * 0.33,
                      height: AppConstants.screenHeight(context) * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Indian',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          Text(
                            'Scout Bobber',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ReusableContainer(
                              title: 'Category', subtitle: 'Cruiser'),
                          SizedBox(
                            height: 30,
                          ),
                          ReusableContainer(
                              title: 'Displacement', subtitle: '1133cc'),
                          SizedBox(
                            height: 30,
                          ),
                          ReusableContainer(
                              title: 'Max Speed', subtitle: '124 km/h')
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      width: AppConstants.screenWidth(context) * 0.46,
                      height: AppConstants.screenHeight(context) * 0.45,
                      child: Column(
                        children: [
                          Image.asset('assets/images/bobber.png',
                              fit: BoxFit.contain,
                              width: AppConstants.screenWidth(context) * 0.5,
                              height: AppConstants.screenHeight(context) * 0.3),
                          SizedBox(height: 26,),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Checkout()));
                            },
                            child: Container(
                              width: 190,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                              child: Center(
                                  child: Column(
                                children: [
                                  Text(
                                    'Rent',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '1499/day',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  )
                                ],
                              )),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                //add items
                Text(
                  'Add items',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                AddItems(imageUrl: 'assets/images/shirt.png', status: '1', boxColor: Colors.black, rate: '800/per day', title: 'Riding Jacket', textColor: Colors.white),
                AddItems(imageUrl: 'assets/images/gloves.png', status: 'Add', boxColor: Colors.grey, rate: '800/per day', title: 'Riding Gloves', textColor: Colors.black),
                AddItems(imageUrl: 'assets/images/helmet.png', status: '1', boxColor: Colors.black, rate: '800/per day', title: 'Riding Helmet', textColor: Colors.white),
                AddItems(imageUrl: 'assets/images/boot.png', status: '1', boxColor: Colors.black, rate: '800/per day', title: 'Riding Boots', textColor: Colors.white)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReusableContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  const ReusableContainer(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.grey,
          width: 2.0,
        ),
      ),
      child: Center(
          child: Column(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.black54, fontSize: 17),
          ),
          Text(
            subtitle,
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
          )
        ],
      )),
    );
  }
}

class AddItems extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String rate;
  final String status;
  final Color boxColor;
  final Color textColor;
  const AddItems({Key? key,
    required this.imageUrl,
    required this.status,
    required this.boxColor,
    required this.rate,
    required this.title,
    required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

