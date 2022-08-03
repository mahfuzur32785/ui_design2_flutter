import 'package:flutter/material.dart';
import 'package:ui_design_2/data/data.dart';
import 'package:ui_design_2/models/order.dart';
import 'package:ui_design_2/screen/home_page_widget/recent_order.dart';
import 'package:ui_design_2/screen/home_page_widget/resturent_nearme.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  TextEditingController _controller = TextEditingController();

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
          ResturentNearme(),

        ],
      ),
    );
  }
}
