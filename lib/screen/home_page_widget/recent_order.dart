import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_design_2/data/data.dart';
import 'package:ui_design_2/models/order.dart';

class RecentOrder extends StatelessWidget {
  const RecentOrder({Key? key}) : super(key: key);

  recentOrder(BuildContext context, Order order) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          color: Color(0xFF9E9E9E),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            ClipRRect(
              child: Image.asset(
                '${order.food!.imageUrl}',
                height: double.infinity,
                width: 150,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${order.food!.name}'),
                Text('${order.restaurant!.name}'),
                Text('${order.date}'),
              ],
            ),
            SizedBox(width: 30,),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFFFF9800),
              ),
              child: Icon(Icons.add,size: 40,color: Colors.white,),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Recent Order',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 26,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 0),
          height: MediaQuery.of(context).size.height*0.14,
          //color: Colors.red,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders!.length,
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 20,
              );
            },
            itemBuilder: (context, index) {
              Order order = currentUser.orders![index];
              return recentOrder(context, order);
            },
          ),
        )
      ],
    );
  }
}
