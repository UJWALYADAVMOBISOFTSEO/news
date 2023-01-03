import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/Services/api_services.dart';
import 'package:news/widgets/ProductWidget.dart';
import 'package:news/widgets/customListTile.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Model/ArticleModel.dart';
import 'Model/category.dart';

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "CNBC".text.color(Colors.black).make(),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              Data(),
              Content(),
              Horizontal_list(),
              Expanded(child: ListData()),
        ],
      ),
      endDrawer: Drawer(),
    );
  }
}

class Data extends StatelessWidget {
  const Data({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(left: 12.0),
        alignment: Alignment.topLeft,
        child: "Hey Ujwal!".text.xl.make(),
    );
  }
}


class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 12.0),
        padding: EdgeInsets.all(8.0),
        alignment: Alignment.topLeft,
        child: "Discover Latest News".text.bold.xl5.make(),
    );
  }
}

class Horizontal_list extends StatefulWidget {
  const Horizontal_list({Key? key}) : super(key: key);

  @override
  State<Horizontal_list> createState() => _Horizontal_listState();
}

class _Horizontal_listState extends State<Horizontal_list> {

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var JSON = await rootBundle.loadString("assets/files/data.json");
    print(JSON);
    var decodedData = jsonDecode(JSON);
    print(decodedData);
    var productData = decodedData["prosucts"];
    print(productData);
    Category.categories =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Expanded(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (context, index) {
            return ProductWidget(item: Category.categories[index]);
          },
          itemCount: Category.categories.length,
        ),
      ),
    );
  }
}



class ListData extends StatefulWidget {
  const ListData({Key? key}) : super(key: key);

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: client.getArticle(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;
          return ListView.builder(
            itemCount: articles!.length,
            itemBuilder: (context, index) => customListTile(articles[index], context),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

