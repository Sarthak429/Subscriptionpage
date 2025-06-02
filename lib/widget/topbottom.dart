import 'package:flutter/material.dart';
import 'subs.dart'; // Your SubscriptionsPage widget file
import 'explore.dart'; // Your ExplorePage widget file
import 'availableplan.dart';

class BottomTop extends StatefulWidget {
  final int initialIndex;
  final Map<String, String>? newActiveSubscription;

  const BottomTop({
    super.key,
    this.initialIndex = 0,
    this.newActiveSubscription,
  });

  @override
  State<BottomTop> createState() => _BottomTopState();

}

class _BottomTopState extends State<BottomTop> {
  late int selectedindex;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    selectedindex = widget.initialIndex;
    pageController = PageController(initialPage: selectedindex);
  }

  void onItemTapped(int index) {
    setState(() {
      selectedindex = index;
    });
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          SubscriptionsPage(
            newActiveSubscription: widget.newActiveSubscription,
          ),
          ExplorePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 49,
              width: 75,
              child: ImageIcon(AssetImage("assets/icon/home.png")),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 49,
              width: 75,
              child: ImageIcon(AssetImage("assets/icon/explore.png")),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 49,
              width: 75,
              child: ImageIcon(AssetImage("assets/icon/payments.png")),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 49,
              width: 75,
              child: ImageIcon(AssetImage("assets/icon/settings.png")),
            ),
            label: '',
          ),
        ],
        currentIndex: selectedindex,
        selectedItemColor: Color(0xFFF4BF5F),
        unselectedItemColor: Color(0xFFF4BF5F),
        onTap: onItemTapped,
        backgroundColor: Color(0xFF141530),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
