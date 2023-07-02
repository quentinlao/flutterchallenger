import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

void main() => runApp(_HomeScreen());

class _HomeScreen extends StatefulWidget {
  @override
  __HomeScreenState createState() => __HomeScreenState();
}

class __HomeScreenState extends State<_HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final String _name = "Happiness";
  final List<Widget> myTabs = [
    Tab(text: 'Menu'),
    Tab(text: 'Entrée'),
    Tab(text: 'Plat'),
    Tab(text: 'Dessert'),
  ];

  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: 4);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      iconTheme: new IconThemeData(color: Colors.green),
      backgroundColor: Colors.white,
      title: Text(
        _name,
        style: TextStyle(color: Colors.lightGreen),
      ),
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.shopping_basket,
            color: Colors.lightGreen,
          ),
        )
      ],
    );
  }

  List<Tab> _buildTab() {
    List<Tab> listTab = new List<Tab>();
    for (var i = 0; i < 4; i++) {
      listTab.add(Tab(
        child: Container(
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.lightGreen, width: 1)),
          child: Align(
            alignment: Alignment.center,
            child: myTabs[i],
          ),
        ),
      ));
    }
    return listTab;
  }

  Widget _buildSearchBar() {
    return Container(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SearchBar(
          searchBarStyle: SearchBarStyle(
            backgroundColor: Colors.white,
            padding: EdgeInsets.all(0),
            borderRadius: BorderRadius.circular(15),
          ),
          icon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget getTabBar() {
    return Container(
      height: 35,
      child: TabBar(
        unselectedLabelColor: Colors.lightGreen,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.lightGreen,
        ),
        tabs: _buildTab(),
        controller: _tabController,
      ),
    );
  }

  Widget _buildBody(String page) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(
            20.0,
          ),
          child: Text(
            "Notre sélection",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.lightGreen,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 250,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70.0),
                        color: Colors.lightGreen),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      height: 125,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(70.0),
                          topRight: const Radius.circular(70.0),
                          bottomLeft: const Radius.circular(0.0),
                          bottomRight: const Radius.circular(0.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn.apartmenttherapy.info/image/upload/f_jpg,q_auto:eco,c_fill,g_auto,w_1500,ar_1:1/k%2Farchive%2F2ba8aab83d28bb172962e3064b9da28047d8f49b"),
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, -0.5),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 80,
                    child: IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.green,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    top: 130,
                    left: 20,
                    child: Text(
                      "Menu vegan",
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 10,
                    child: Text(
                      "• Tofu \n• Dessert\n• Boisson",
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: 50,
                    child: Text(
                      "Plus d'infos",
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ),
                  Positioned(
                    top: 215,
                    left: 35,
                    child: Text(
                      "12.30 €",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    height: 250,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70.0),
                        color: Colors.brown[100]),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      height: 125,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(70.0),
                          topRight: const Radius.circular(70.0),
                          bottomLeft: const Radius.circular(0.0),
                          bottomRight: const Radius.circular(0.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://www.vival.fr/images/recette/recette-99.jpg"),
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, -0.5),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 80,
                    child: IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.green,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    top: 130,
                    left: 20,
                    child: Text(
                      "Menu burger",
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 10,
                    child: Text(
                      "• Burger \n• Dessert\n• Boisson",
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: 50,
                    child: Text(
                      "Plus d'infos",
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ),
                  Positioned(
                    top: 215,
                    left: 35,
                    child: Text(
                      "12.30 €",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    height: 250,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70.0),
                        color: Colors.lightGreen),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      height: 125,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(70.0),
                          topRight: const Radius.circular(70.0),
                          bottomLeft: const Radius.circular(0.0),
                          bottomRight: const Radius.circular(0.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://img.cuisineaz.com/400x320/2016-04-28/i103522-poulet-au-curry-au-lait-de-coco.jpg"),
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, -0.5),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 80,
                    child: IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.green,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    top: 130,
                    left: 20,
                    child: Text(
                      "Menu épicé",
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 10,
                    child: Text(
                      "• Curry \n• Dessert\n• Boisson",
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: 50,
                    child: Text(
                      "Plus d'infos",
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ),
                  Positioned(
                    top: 215,
                    left: 35,
                    child: Text(
                      "12.30 €",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(
            20.0,
          ),
          child: Text(
            "$page",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.lightGreen,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.brown[100],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      height: 125,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(30.0),
                          topRight: const Radius.circular(0.0),
                          bottomLeft: const Radius.circular(30.0),
                          bottomRight: const Radius.circular(0.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://storenotrefamilleprod.blob.core.windows.net/images/cms/recette/18244/18244_large.jpg"),
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, 0.0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 135,
                    child: Text(
                      "Menu salade",
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 320,
                    child: IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 135,
                    child: Text(
                      "• Salade \n• Dessert\n• Boisson",
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 260,
                    child: Text(
                      "Plus d'infos",
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ),
                  Positioned(
                    top: 90,
                    left: 135,
                    child: Text(
                      "10.30 €",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Stack(
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.brown[100],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      height: 125,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(30.0),
                          topRight: const Radius.circular(0.0),
                          bottomLeft: const Radius.circular(30.0),
                          bottomRight: const Radius.circular(0.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://www.atelierdeschefs.com/media/recette-e23743-burger-de-saumon-au-fromage-frais-pommes-de-terre-rattes-confites.jpg"),
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, 0.0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 135,
                    child: Text(
                      "Menu burger",
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 320,
                    child: IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 135,
                    child: Text(
                      "• Burger \n• Dessert\n• Boisson",
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 260,
                    child: Text(
                      "Plus d'infos",
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ),
                  Positioned(
                    top: 90,
                    left: 135,
                    child: Text(
                      "12.50 €",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Stack(
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.brown[100],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      height: 125,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(30.0),
                          topRight: const Radius.circular(0.0),
                          bottomLeft: const Radius.circular(30.0),
                          bottomRight: const Radius.circular(0.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://www.avosassiettes.fr/wp-content/uploads/2018/09/spaghettonis-au-caprons-parmesan-et-basilic-sauce-sicilienne.jpg"),
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, 0.0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 135,
                    child: Text(
                      "Menu pâtes",
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 320,
                    child: IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 135,
                    child: Text(
                      "• Pâtes \n• Dessert\n• Boisson",
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 260,
                    child: Text(
                      "Plus d'infos",
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ),
                  Positioned(
                    top: 90,
                    left: 135,
                    child: Text(
                      "10.40 €",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: SafeArea(
            child: Text(_name),
          ),
        ),
        appBar: _buildAppBar(),
        body: ListView(
          children: <Widget>[
            _buildSearchBar(),
            getTabBar(),
            Center(
              child: [
                _buildBody("Menus"),
                _buildBody("Entrées"),
                _buildBody("Plats"),
                _buildBody("Desserts"),
              ][_tabController.index],
            ),
          ],
        ),
      ),
    );
  }
}
