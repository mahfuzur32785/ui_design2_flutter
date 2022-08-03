import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_design_2/data/data.dart';
import 'package:ui_design_2/models/restaurant.dart';
import 'package:ui_design_2/screen/home_page_widget/recent_order.dart';
import 'package:ui_design_2/screen/restaurent_nearme.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _controller = TextEditingController();

  buildResturent() {

    List<Widget> resturentList = [];

    restaurants.forEach((Restaurant restaurant) {
      resturentList.add(
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RestaurentNearme(
              restaurant: restaurant,
            )));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            height: 170,
            width: double.infinity ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFEEEEEE),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    height: 170,
                    width: 170,
                    fit: BoxFit.cover,
                    image: AssetImage('${restaurant.imageUrl}'),
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${restaurant.name}'),
                    Text('${restaurant.address}'),
                    Text('${restaurant.distance} miles')
                  ],
                ),
              ],
            ),
          ),
        ),

      );
    });

    return Column(
      children: resturentList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Color(0xFFFF6E40),
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Icon(Icons.account_circle,size: 35,),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('Food Delivery'),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text('(Cart ${currentUser.cart!.length})',
                style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
      body: ListView(
        //physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            height: 60,
            margin: EdgeInsets.all(20),
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: Icon(
                  Icons.search,size: 30,color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear,size: 30,color: Colors.grey,),
                  onPressed: (){
                    _controller.clear();
                  },
                ),
                hintText: 'Search',
              ),
              cursorColor: Colors.grey,
              cursorHeight: 25,
            ),
          ),
          RecentOrder(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Text('Near Me Resturant',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //Restaurant near me listview builder
              buildResturent(),
            ],
          ),

        ],
      ),
    );
  }

}
