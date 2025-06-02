import 'package:flutter/material.dart';
import 'choosepayment.dart';

class AvailablePlanPage extends StatefulWidget {
  final String accountName;
  final String accountEmail;

  const AvailablePlanPage({
    Key? key,
    required this.accountName,
    required this.accountEmail,
  }) : super(key: key);

  @override
  State<AvailablePlanPage> createState() => _AvailablePlanPageState();
}

class _AvailablePlanPageState extends State<AvailablePlanPage> {
  int _currentPage = 0;
  int? _selectedPlanIndex;

  final List<Map<String, dynamic>> plans = [
    {
      'type': 'STUDENT PLAN',
      'trial': '1 MONTH FREE TRIAL',
      'price': '₹79/month',
      'details': 'One month free trial, then ₹79/month',
      'features': [
        'Watch ad-free videos',
        'Download videos to watch offline',
        'Background Play',
        'YouTube Music Premium',
        'YouTube Originals',
      ],
    },
    {
      'type': 'PERSONAL PLAN',
      'trial': '1 MONTH FREE TRIAL',
      'price': '₹129/month',
      'details': 'One month free trial, then ₹129/month',
      'features': [
        'Watch ad-free videos',
        'Download videos to watch offline',
        'Background Play',
        'YouTube Music Premium',
        'YouTube Originals',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141530),
      body: Stack(
        children: [
          Container(color: const Color(0xFF141530)),
          DraggableScrollableSheet(
            initialChildSize: 0.95,
            minChildSize: 0.6,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF141530),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      // Header Row
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: const Text(
                                  "Back",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              const Text(
                                "YouTube Premium",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              const SizedBox(width: 40, height: 50),
                            ],
                          ),
                        ),
                      ),

                      // User Info with passed account details
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 50),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1C1F3E),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Color(0xFFC652B3),
                                radius: 20,
                                child: Text(
                                  "MM",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.accountName,
                                    style: const TextStyle(
                                      color: Color(0xFFF4BF5F),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    widget.accountEmail,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Available Plans Text
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Available Plans",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Plan PageView
                      SizedBox(
                        height: 400,
                        child: PageView.builder(
                          itemCount: plans.length,
                          onPageChanged:
                              (index) => setState(() => _currentPage = index),
                          itemBuilder: (context, index) {
                            final plan = plans[index];
                            final isSelected = _selectedPlanIndex == index;

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedPlanIndex = index;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1C1F3E),
                                    border: Border.all(
                                      color:
                                          isSelected
                                              ? const Color(0xFFF4BF5F)
                                              : Color(0xFF1B1C41),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            plan['type'],
                                            style: const TextStyle(
                                              color: Color(0xFFB6B8C9),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xFF1B3846),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              plan['trial'],
                                              style: const TextStyle(
                                                color: Color(0xFF1ED760),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 30),
                                      Text(
                                        plan['price'],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFF4BF5F)
                                        ),
                                      ),
                                      const SizedBox(height: 7),
                                      Text(
                                        plan['details'],
                                        style: const TextStyle(
                                          color: Color(0xFFB6B8C9),
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(height: 40),
                                      ...List.generate(
                                        plan['features'].length,
                                        (i) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10,
                                            ),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.check_box,
                                                  size: 14,
                                                  color: Color(0xFFF4BF5F)
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  plan['features'][i],
                                                  style: const TextStyle(
                                                    color: Color(0xFFF0F0F8),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Page indicators
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(plans.length, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: _currentPage == index ? 22 : 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color:
                                  _currentPage == index
                                      ? const Color(0xFFF4BF5F)
                                      : Colors.grey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          );
                        }),
                      ),

                      const SizedBox(height: 40),

                      // Subscribe button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed:
                                _selectedPlanIndex == null
                                    ? null
                                    : () {
                                      final selectedPlan =
                                          plans[_selectedPlanIndex!];
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => ChoosePayment(
                                                selectedPlan: selectedPlan,
                                                accountName: widget.accountName,
                                                accountEmail:
                                                    widget.accountEmail,
                                              ),
                                        ),
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
                              "CONTINUE",
                              style: TextStyle(
                                color: Color(0xFF1C1F3E),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
