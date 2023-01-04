import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Model/ArticleModel.dart';
import '../NewsDetail.dart';

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                    article: article,
                  )));
    },
    child: Container(
      height: 150,
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 130,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    //let's add the height

                    image: DecorationImage(
                        image: NetworkImage(article.urlToImage),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              Container(
                width: 220,
                height: 130,
                child: Container(
                  child: ListTile(
                    title: Container(
                      height: 120,
                      child: Container(
                        child: article.title.text.xl2.bold.make(),
                      ),
                    ),
                    subtitle: Container(
                        height: 30,
                        child: Container(
                          child: article.publishedAt.text.make(),
                        )),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
