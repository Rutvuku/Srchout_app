import 'package:flutter/material.dart';
import 'package:schrout_app/screens/home_page.dart';
import 'package:schrout_app/utils/constants.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  DateTime? selectedDate;
  DateTime? finalSelectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _finalSelectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: finalSelectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != finalSelectedDate) {
      setState(() {
        finalSelectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
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
                        'Checkout',
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
                //datepicker
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    color: Colors.black54,
                    height: AppConstants.screenHeight(context) * 0.3,
                    width: AppConstants.screenWidth(context) * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                    children: [
                                      Text(
                                        'Start Date',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        selectedDate != null
                                            ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                                            : "Select a date",
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 8.0),
                                  Icon(Icons.calendar_today),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _finalSelectedDate(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                    children: [
                                      Text(
                                        'Start Date',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        finalSelectedDate != null
                                            ? "${finalSelectedDate!.day}/${finalSelectedDate!.month}/${finalSelectedDate!.year}"
                                            : "Select a date",
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 8.0),
                                  Icon(Icons.calendar_today),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                //search field
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0), // Border radius
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.all(10.0), // Adjust padding as needed
                      hintText: 'Apply Coupon',
                      border: InputBorder.none, // Remove the default underline
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                //details
                Text(
                  'Details',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: double.infinity, // Full width
                  height: 1.0, // Line thickness
                  color: Colors.black54, // Line color
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Date',style: TextStyle(fontSize: 18),),
                    Text('4',style: TextStyle(fontSize: 18),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Rent',style: TextStyle(fontSize: 18),),
                    Text('5996',style: TextStyle(fontSize: 18),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Additional Items',style: TextStyle(fontSize: 18),),
                    Text('6400',style: TextStyle(fontSize: 18),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Coupon Discount',style: TextStyle(fontSize: 18),),
                    Text('396',style: TextStyle(fontSize: 18),),
                  ],
                ),
                Container(
                  width: double.infinity, // Full width
                  height: 1.0, // Line thickness
                  color: Colors.black54, // Line color
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Text('12000',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
                //pay button
                SizedBox(height: 36,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  },
                  child: Container(
                    width: 300,
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
                        child: Text(
                          'Pay',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
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