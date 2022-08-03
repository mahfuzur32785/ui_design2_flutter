import 'package:flutter/material.dart';
import 'package:ui_design_2/custom_things/custom_text.dart';
import 'package:ui_design_2/data/data.dart';
import 'package:ui_design_2/models/food.dart';
import 'package:ui_design_2/models/restaurant.dart';

class RestaurentNearme extends StatefulWidget {
  //const RestaurentNearme({Key? key}) : super(key: key);

  Restaurant? restaurant;
  RestaurentNearme({this.restaurant});

  @override
  State<RestaurentNearme> createState() => _RestaurentNearmeState();
}

class _RestaurentNearmeState extends State<RestaurentNearme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            //TOP IMAGE WITH BACK BUTTON AND LOVE ICON
            Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('${widget.restaurant!.imageUrl}'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Icon(
                      Icons.favorite,
                      color: Color(0xFFFF6E40),
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),

            //IMAGE DOWN TEXT IN ROW AND COLUMN
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(data: widget.restaurant!.name),
                      CustomText(
                        data: '${widget.restaurant!.distance} Miles',
                      ),
                    ],
                  ),
                  CustomText(data: widget.restaurant!.address),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            //TWO BUTTON THAt'S ARE REVIEW BUTTON AND CONTACT BUTTON
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Review',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Contact',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            //MENU TEXT AND FROM HERE
            CustomText(
              data: 'Menu',
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children:
                    List.generate(widget.restaurant!.menu!.length, (index) {
                  Food food = widget.restaurant!.menu![index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 25,vertical: 25),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage('${food.imageUrl}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child:
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        color: Colors.black.withOpacity(0.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('${food.name}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('${food.price}\$',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

