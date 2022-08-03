import 'package:flutter/material.dart';
import 'package:ui_design_2/data/data.dart';

class ResturentNearme extends StatelessWidget {
  const ResturentNearme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Near Me Resturant',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            color: Colors.red,
            //height: MediaQuery.of(context).size.height*0.53,
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: restaurants.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 20,);
              },
              itemBuilder: (context, index){
                return Text('data');
              },
            ),
          )
        ],
      ),
    );
  }
}
