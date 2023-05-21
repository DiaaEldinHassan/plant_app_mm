import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/plants.dart';
import 'package:flutter_onboarding/ui/screens/cart_page.dart';
import 'package:flutter_onboarding/ui/screens/favorite_page.dart';
import 'package:flutter_onboarding/ui/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Plant> favorites = [];
  List<Plant> myCart = [];
  int _bottomNavIndex = 0;

  void modalBottom(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                Constants.primaryColor,
              Color.fromARGB(255, 216, 216, 216), 
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Container( padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                 Container(decoration:const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white))),
                  child: Column(children: [Text('About App',style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white,)),
                  Text('By using our plant app you will be able to buy plants but before you buy it you can see the condition of the plant and read the details and the history of the plant and you can also listen to it .',style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),)])),
                  Text(
                    'How to use text to speech feature ?',
                    style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Container(decoration:const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white))),
                  child:Column(children:[
                  RichText(text: 
                  TextSpan(children:[
                    TextSpan(text:'to use text to speech feature you need to long press on the text to play audio and to stop you can short press or exit the page .',style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                    TextSpan(text: 'Works only on plant describtion',style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 18,backgroundColor: Colors.amber,color:Colors.black))]))
                  ]
                  )
                  )
                ],
              ),
            ),
          );
        });
  }

  //List of the pages
  List<Widget> _widgetOptions() {
    return [
      const HomePage(),
      FavoritePage(
        favoritedPlants: favorites,
      ),
      CartPage(
        addedToCartPlants: myCart,
      ),
    ];
  }

  //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
  ];

  //List of the pages titles
  List<String> titleList = [
    'Home',
    'Favorite',
    'Cart',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomNavIndex],
              style: TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            IconButton(
              onPressed: () {
                modalBottom(context);
              },
              icon: const Icon(
                Icons.question_mark_rounded,
                size: 30.0,
                color: Color.fromARGB(255, 112, 112, 112),
              ),
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor: Constants.primaryColor,
          activeColor: Constants.primaryColor,
          inactiveColor: Colors.black.withOpacity(.5),
          icons: iconList,
          activeIndex: _bottomNavIndex,
          iconSize: 20,
          // gapLocation: GapLocation.end,
          // notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
              final List<Plant> favoritedPlants = Plant.getFavoritedPlants();
              final List<Plant> addedToCartPlants = Plant.addedToCartPlants();

              favorites = favoritedPlants;
              myCart = addedToCartPlants.toSet().toList();
            });
          }),
    );
  }
}
