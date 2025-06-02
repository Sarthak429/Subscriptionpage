import 'package:flutter/material.dart';

class SubscriptionsPage extends StatelessWidget {
  final Map<String, String>? newActiveSubscription;

  const SubscriptionsPage({super.key, this.newActiveSubscription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF141530),
        toolbarHeight: 84,
        titleSpacing: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 20, top: 40),
          child: Text(
            'Subscriptions',
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
            child: Image.asset(
              'assets/icon/notification.png',
              width: 28,
              height: 28,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF141530),
      body: ListView(
        padding: const EdgeInsets.only(left: 20, top: 20),
        children: [
          const Text(
            "Active",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          ..._buildActiveCards(),
          const SizedBox(height: 20),
          const Text(
            "Inactive",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          ..._buildInactiveCards(),
        ],
      ),
    );
  }

  List<Widget> _buildActiveCards() {
    List<Map<String, String>> subscriptions = [
      {
        'icon': 'assets/icon/netflix.png',
        'name': 'Netflix',
        'type': 'MONTHLY',
        'price': '₹699',
      },
      {
        'icon': 'assets/icon/spotify.png',
        'name': 'Spotify',
        'type': 'ANNUAL',
        'price': '₹1189',
      },
      {
        'icon': 'assets/icon/sony.png',
        'name': 'Sony LIV',
        'type': 'ANNUAL',
        'price': '₹999',
      },
      {
        'icon': 'assets/icon/xbox.png',
        'name': 'Xbox Game Pass',
        'type': 'MONTHLY',
        'price': '₹699',
      },
    ];

    if (newActiveSubscription != null) {
      subscriptions.insert(0, newActiveSubscription!);
    }

    return subscriptions.map((sub) {
      return _activeCard(
        sub['icon'] ?? '',
        sub['name'] ?? '',
        sub['type'] ?? '',
        sub['price'] ?? '',
        showOnlyPrice: false, // Always show full info
      );
    }).toList();
  }

  List<Widget> _buildInactiveCards() {
    return [
      _inactiveCard(
        "assets/icon/adobecc.png",
        "Adobe CC",
        "EXPIRED 12/12/2021",
      ),
      _inactiveCard("assets/icon/icloud.png", "iCloud+", "EXPIRED 02/01/2022"),
    ];
  }

  Widget _activeCard(
    String icon,
    String name,
    String type,
    String price, {
    bool showOnlyPrice = false,
  }) {
    return Card(
      color: const Color(0xFF1B1C41),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(bottom: 10, right: 20),
      child: ListTile(
        leading: Image.asset(icon, width: 36, height: 36),
        title:
            showOnlyPrice
                ? null
                : Text(name, style: const TextStyle(color: Color(0xFFF4BF5F))),
        subtitle:
            showOnlyPrice
                ? null
                : Text(type, style: const TextStyle(color: Colors.grey)),
        trailing: Text(
          price,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _inactiveCard(String icon, String name, String date) {
    return Card(
      color: const Color(0xFF1B1C41),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 10, right: 20),
      child: ListTile(
        leading: Image.asset(icon, width: 36, height: 36),
        title: Text(name, style: const TextStyle(color: Color(0xFFF4BF5F))),
        subtitle: Text(date, style: const TextStyle(color: Colors.grey)),
        trailing: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            foregroundColor: Colors.white,
            backgroundColor: const Color(0x54F0F0F8),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          ),
          child: const Text("RENEW"),
        ),
      ),
    );
  }
}
