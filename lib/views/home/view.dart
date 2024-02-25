import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



import 'pages_navigation_bar/favoritee.dart';
import 'pages_navigation_bar/main_home.dart';
import 'pages_navigation_bar/my_account.dart';
import 'pages_navigation_bar/my_orders.dart';
import 'pages_navigation_bar/notification/view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<Widget> pages = [
    const MainPage(),
    const TalabatyPage(),
    const NotificationPage(),
    const FavoritePage(),
    const MyAccPage(),
  ];
  List<String> titles=[
    "الرئيسية",
    "طلباتي",
    "الإشعارات",
    "المفضلة",
    "حسابي",

  ];
  List<String> icons= [
    "home",
    "Talabaty",
    "Notification",
    "Favorite",
    "User"

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: const Color(0xffAED489),
        selectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: List.generate(pages.length,
              (index) => BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icon/svg/${icons[index]}.svg",
                color: currentIndex == index ? Colors.white : const Color(0xffAED489)),
            label: titles[index]),),
      ),
    );
  }
}
