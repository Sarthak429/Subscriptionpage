import 'package:flutter/material.dart';
import 'package:sub_app/widget/topbottom.dart';
import 'subs.dart';

class SubscriptionSuccess extends StatelessWidget {
  String _calculateAccessEndDate() {
    final now = DateTime.now();
    final endDate = now.add(Duration(days: 30)); // Assuming 30-day subscription
    return "${endDate.day.toString().padLeft(2, '0')}/${endDate.month.toString().padLeft(2, '0')}/${endDate.year}";
  }

  // Added method to extract price with ₹ sign and digits only
  String _extractPrice(String priceString) {
    final match = RegExp(r'₹(\d+)').firstMatch(priceString);
    return match != null ? '₹${match.group(1)}' : '₹0';
  }

  final String accountName;
  final String accountEmail;
  final Map<String, dynamic> selectedPlan;
  final Map<String, dynamic> selectedPayment;

  const SubscriptionSuccess({
    Key? key,
    required this.accountName,
    required this.accountEmail,
    required this.selectedPlan,
    required this.selectedPayment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0C2B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 39),
              const Text(
                "Congratulations!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Your subscription is successful.",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icon2/premium.png',
                      height: 210,
                      width: 350,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _buildInfoCard(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFFC652B3),
                  child: Text(
                    accountName[0].toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: accountName,
                subtitle: accountEmail,
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B1C41),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            selectedPlan['type'] ?? '',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        if ((selectedPlan['trial'] ?? '').toString().isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1B3846),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              selectedPlan['trial'],
                              style: const TextStyle(
                                color: Color(0xFF1ED760),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      selectedPlan['price'] ?? '₹0',
                      style: const TextStyle(
                        fontSize: 24,
                        color: Color(0xFFF4BF5F),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Access ends: ${_calculateAccessEndDate()}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),
              _buildInfoCard(
                leading: Image.asset(selectedPayment['iconPath'], width: 32),
                title: selectedPayment['bank'],
                subtitle: selectedPayment['cardNumber'],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => BottomTop(
                              initialIndex: 0,
                              newActiveSubscription: {
                                'icon': 'assets/icon3/youtube.png',
                                'name': 'YouTube Premium',
                                'type': 'MONTHLY',
                                'price': _extractPrice(selectedPlan['price']),
                              },
                            ),
                      ),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF4BF5F),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "HOME",
                    style: TextStyle(color: Color(0xFF1B1C41)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required Widget leading,
    required String title,
    required String subtitle,
    Widget? trailing,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1B3B),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          leading,
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Color(0xFFF4BF5F))),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}
