import 'package:flutter/material.dart';
import 'chooseaccount.dart'; // Make sure you create/import this file

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141530),
      appBar: AppBar(
        backgroundColor: const Color(0xFF141530),
        toolbarHeight: 84,
        titleSpacing: 0,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 20, top: 40),
          child: Text(
            "Explore",
            style: TextStyle(
              fontFamily: 'CircularStd',
              fontWeight: FontWeight.w400,
              fontSize: 32,
              height: 1.0,
              letterSpacing: 0,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 40),
            child: Image.asset('assets/icon/filter.png', height: 28, width: 28),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF1C1F3E),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.white),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.mic, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 24),
            Text("Media", style: sectionTitleStyle()),
            const SizedBox(height: 12),
            buildRow([
              buildCard(
                "Apple Music",
                "from 49/month",
                "assets/icon2/apple_music.png",
              ),
              buildCard(
                "YouTube",
                "from 79/month",
                "assets/icon2/youtube.png",
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => YouTubeSelectacc(),
                  );
                },
              ),
              buildCard("Prime", "from 179/month", "assets/icon2/prime.png"),
            ]),

            const SizedBox(height: 24),
            Text("Wellness", style: sectionTitleStyle()),
            const SizedBox(height: 12),
            buildRow([
              buildCard(
                "Headspace",
                "from 79/month",
                "assets/icon2/headspace.png",
              ),
              buildCard("Calm", "from 99/month", "assets/icon2/calm.png"),
              buildCard(
                "Insight",
                "from 149/month",
                "assets/icon2/insight.png",
              ),
            ]),

            const SizedBox(height: 24),
            Text("Health", style: sectionTitleStyle()),
            const SizedBox(height: 12),
            buildRow([
              buildCard("Netmeds", "from 40/month", "assets/icon2/netmeds.png"),
              buildCard(
                "Tata 1mg",
                "from 46/month",
                "assets/icon2/tata1mg.png",
              ),
              buildCard(
                "Pharmeasy",
                "from 50/month",
                "assets/icon2/pharmeasy.png",
              ),
            ]),
          ],
        ),
      ),
    );
  }

  static Widget buildRow(List<Widget> cards) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: cards,
    );
  }

  static Widget buildCard(
    String title,
    String price,
    String imagePath, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 110,
        height: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: const Color(0xFF1C1F3E),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(33),
                child: Image.asset(
                  imagePath,
                  height: 44,
                  width: 44,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Color(0xFFF4BF5F)),
            ),
            const SizedBox(height: 4),
            Text(
              price,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  static TextStyle sectionTitleStyle() {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }
}
