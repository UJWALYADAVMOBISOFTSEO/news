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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
                SearchBar(),
                SizedBox(
                  height: 70,
                  child: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    bottom: TabBar(
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Colors.red),
                      padding: EdgeInsets.only(bottom: 10),
                      tabs: [
                        Tab(
                            child: Container(
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/politics.png").h4(context),
                                    "Politics".text.color(Colors.black).make().h2(context)
                                  ],
                                )
                            )
                        ),
                        Tab(
                            child: Column(
                              children: [
                                Image.asset("assets/images/sports.png").h4(context),
                                "Sports".text.color(Colors.black).make().h2(context)
                              ],
                            )
                        ),
                        Tab(
                            child: Column(
                              children: [
                                Image.asset("assets/images/movies.png").h4(context),
                                "Movies".text.color(Colors.black).make().h2(context)
                              ],
                            )
                        ),
                        Tab(
                            child: Column(
                              children: [
                                Image.asset("assets/images/crime.png").h4(context),
                                "Crime".text.color(Colors.black).make().h2(context)
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                ),

                // create widgets for each tab bar here
                Expanded(
                  child: TabBarView(
                    children: [
                      // first tab bar view widget
                      Container(
                        child: Expanded(child: ListData()),
                      ),

                      // second tab bar viiew widget
                      Container(
                        child: Expanded(child: ListDataSports()),
                      ),
                      Container(
                        child: Expanded(child: ListDataMovies()),
                      ),
                      Container(
                        child: Expanded(child: ListDataCrime()),
                      ),
                    ],
                  ),
                ),
                // Horizontal_list(),
                // Expanded(child: ListData()),
          ],
        ),
        endDrawer: Drawer(),
      ),
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

class ListDataSports extends StatefulWidget {
  const ListDataSports({Key? key}) : super(key: key);

  @override
  State<ListDataSports> createState() => _ListDataSportsState();
}

class _ListDataSportsState extends State<ListDataSports> {
  ApiServiceSports clientSports = ApiServiceSports();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: clientSports.getArticle(),
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

class ListDataMovies extends StatefulWidget {
  const ListDataMovies({Key? key}) : super(key: key);

  @override
  State<ListDataMovies> createState() => _ListDataMoviesState();
}

class _ListDataMoviesState extends State<ListDataMovies> {
  ApiServiceMovies clientMovies = ApiServiceMovies();
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: clientMovies.getArticle(),
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

class ListDataCrime extends StatefulWidget {
  const ListDataCrime({Key? key}) : super(key: key);

  @override
  State<ListDataCrime> createState() => _ListDataCrimeState();
}

class _ListDataCrimeState extends State<ListDataCrime> {
  ApiServiceCrime clientCrime = ApiServiceCrime();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: clientCrime.getArticle(),
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




class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: TextField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            // fontSize: 18
                        ),
                        prefixIcon: Container(
                          padding: EdgeInsets.all(15),
                          child: Icon(Icons.search),
                          width: 18,
                        )
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      // borderRadius: BorderRadius.circular(15)
                    ),
                    child: Icon(Icons.search).onTap(() {
                      // method to show the search bar
                      showSearch(
                          context: context,
                          // delegate to customize the search bar
                          delegate: CustomSearchDelegate()
                      );
                    }),
                    width: 35
                ),
              ],
            )
          ],
        ),
      );
  }
}

class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
  List<String> searchTerms = [
    "Politics",
    "Sports",
    "Movies",
    "Crime",
  ];

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
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



