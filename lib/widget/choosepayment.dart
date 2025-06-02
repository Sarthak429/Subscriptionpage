import 'package:flutter/material.dart';
import 'sucessfull.dart';

class ChoosePayment extends StatefulWidget {
  final Map<String, dynamic> selectedPlan;
  final String accountName;
  final String accountEmail;

  const ChoosePayment({
    Key? key,
    required this.selectedPlan,
    required this.accountName,
    required this.accountEmail,
  }) : super(key: key);

  @override
  _ChoosePaymentState createState() => _ChoosePaymentState();
}

class _ChoosePaymentState extends State<ChoosePayment> {
  int? selectedPaymentIndex;

  final paymentMethods = [
    {
      'bank': 'ICICI Bank',
      'details': '**** 1234',
      'iconPath': 'assets/icon/visa.png',
    },
    {
      'bank': 'HDFC Bank',
      'details': '**** 5678',
      'iconPath': 'assets/icon/mastercard.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final addNewIndex = paymentMethods.length;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0C2B),
      body: SafeArea(
        child: Column(
          children: [
            // Custom AppBar
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      "Back",
                      style: TextStyle(color: Colors.white, fontSize: 14),
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

            // Main content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selected account",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1B3B),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xFFC652B3),
                            child: Text(
                              widget.accountName.isNotEmpty
                                  ? widget.accountName[0].toUpperCase()
                                  : 'MM',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.accountName,
                                style: TextStyle(color: Color(0xFFF4BF5F)),
                              ),
                              Text(
                                widget.accountEmail,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "Selected Plan",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1B3B),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.selectedPlan['type'] ?? '',
                                style: TextStyle(
                                  color: Color(0xFFB6B8C9),
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                widget.selectedPlan['price'] ?? '',
                                style: TextStyle(
                                  color: Color(0xFFF4BF5F),
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
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
                              widget.selectedPlan['trial'] ?? '',
                              style: const TextStyle(
                                color: Color(0xFF1ED760),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "Select Payment Method",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    ...paymentMethods.asMap().entries.map((entry) {
                      final index = entry.key;
                      final method = entry.value;
                      final isSelected = selectedPaymentIndex == index;

                      return GestureDetector(
                        onTap:
                            () => setState(() => selectedPaymentIndex = index),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1C1B3B),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color:
                                  isSelected
                                      ? Color(0xFFF4BF5F)
                                      : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    method['iconPath']!,
                                    width: 40,
                                    height: 40,
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        method['bank']!,
                                        style: TextStyle(
                                          color:
                                              isSelected
                                                  ? const Color(0xFFF4BF5F)
                                                  : const Color(0xFFF0F0F8),
                                        ),
                                      ),
                                      Text(
                                        method['details']!,
                                        style: TextStyle(
                                          color:
                                              isSelected
                                                  ? const Color(0xFFF4BF5F)
                                                  : const Color(0xFFB6B8C9),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: 48,
                                height: 24,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2E2E4E),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: TextField(
                                    obscureText: true,
                                    keyboardType: TextInputType.number,
                                    maxLength: 3,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                    decoration: InputDecoration(
                                      counterText: "",
                                      hintText: "CVV",
                                      hintStyle: TextStyle(
                                        color: Color(0xFFB6B8C9),
                                        fontSize: 12,
                                      ),
                                      border: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),

                    // Selectable "Add new payment method"
                    GestureDetector(
                      onTap:
                          () => setState(
                            () => selectedPaymentIndex = addNewIndex,
                          ),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C1B3B),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color:
                                selectedPaymentIndex == addNewIndex
                                    ? Color(0xFFF4BF5F)
                                    : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.add_card,
                              color: Color(0xFFF4BF5F),
                              size: 40,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              "Add new payment method",
                              style: TextStyle(
                                color: Color(0xFFF4BF5F),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed:
                            selectedPaymentIndex != null
                                ? () {
                                  final selectedMethod =
                                      selectedPaymentIndex! <
                                              paymentMethods.length
                                          ? paymentMethods[selectedPaymentIndex!]
                                          : {
                                            'bank': 'New Bank',
                                            'details': '**** XXXX',
                                            'iconPath': 'assets/icon/visa.png',
                                          };

                                  final selectedPayment = {
                                    'bank': selectedMethod['bank'],
                                    'cardNumber': selectedMethod['details'],
                                    'iconPath': selectedMethod['iconPath'],
                                  };

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => SubscriptionSuccess(
                                            accountName: widget.accountName,
                                            accountEmail: widget.accountEmail,
                                            selectedPlan: widget.selectedPlan,
                                            selectedPayment: selectedPayment,
                                          ),
                                    ),
                                  );
                                }
                                : null,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF4BF5F),
                          disabledBackgroundColor: const Color(0xFF1B1C41),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "CONFIRM PAYMENT",
                          style: TextStyle(
                            color:
                                selectedPaymentIndex != null
                                    ? const Color(0xFF1B1C41)
                                    : const Color(0xFFB6B8C9),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
