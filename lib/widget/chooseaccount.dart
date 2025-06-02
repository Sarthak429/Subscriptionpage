import 'package:flutter/material.dart';
import 'availableplan.dart';

class YouTubeSelectacc extends StatefulWidget {
  const YouTubeSelectacc({super.key});

  @override
  State<YouTubeSelectacc> createState() => _YouTubeSelectaccState();
}

class _YouTubeSelectaccState extends State<YouTubeSelectacc> {
  Map<String, String>? selectedAccount;
  bool _isButtonClicked = true;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.93,
      maxChildSize: 0.93,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFF141530),
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 48),
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: double.infinity,
                        child: Image.asset(
                          "assets/icon2/premium.png",
                          width: 350,
                          height: 210,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const Text(
                              "YouTube Premium",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 64),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Select your account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  buildAccountOption(
                    "Malti Maurya",
                    subtitle: "malti.maurya@gmail.com",
                  ),
                  const SizedBox(height: 10),
                  buildAccountOption(
                    "Malti Maurya",
                    subtitle: "malti.maurya@icloud.com",
                  ),
                  const SizedBox(height: 10),
                  buildAccountOption("Add new account", isAddOption: true),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: selectedAccount == null
                          ? null
                          : () {
                        setState(() {
                          _isButtonClicked = true;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AvailablePlanPage(
                              accountName: selectedAccount!['name']!,
                              accountEmail: selectedAccount!['email']!,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isButtonClicked
                            ? const Color(0xFFF4BF5F)
                            : const Color(0xFF1C1F3E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          color: Color(0xFF1B1C41),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildAccountOption(
      String name, {
        bool isAddOption = false,
        String? subtitle,
      }) {
    final isSelected = selectedAccount?['name'] == name &&
        selectedAccount?['email'] == (subtitle ?? '');

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAccount = {'name': name, 'email': subtitle ?? ''};
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1F3E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFFF4BF5F) : const Color(0xFF1C1F3E),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(radius: 20,
              backgroundColor:
               const Color(0xFFC652B3),
              child: isAddOption
                  ? const Icon(Icons.add_reaction,
                  color: Colors.white)
                  : const Text(
                "MM",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color:
                      isSelected ? const Color(0xFFF4BF5F) : Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: TextStyle(
                        color:
                        isSelected ? const Color(0xFFF4BF5F) : Colors.white,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
