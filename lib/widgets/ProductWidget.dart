
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Model/category.dart';

class ProductWidget extends StatelessWidget {
  final Item item;

  const ProductWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shape: StadiumBorder(),
        child: Container(
          child: Column(
            children: [
              5.heightBox,
              Image.asset(item.icon).h4(context),
              10.heightBox,
              item.name.text.bold
                  .color(Colors.black)
                  .make()
                  .centered().h2(context)
            ],
          ),
        ),
        // child: ListTile(
        //   onTap: (){
        //     if(item.name.contains("Policy")){
        //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Nonotification()));
        //     }else{
        //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Support()));
        //     }
        //   },
        //   // leading: Image.network(item.imgurl),
        //   title: Image.asset(item.icon).h10(context),
        //   subtitle: item.name.text.bold.color(Colors.white).make().centered(),
        //   // trailing: Text(
        //   //   item.price,
        //   //   textScaleFactor: 1.5,
        //   //   style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        //   // ),
        // ),
      ).onTap(() {
        if (item.name.contains("Policy")) {
        } else {
        }
      }),
    );
  }
}
