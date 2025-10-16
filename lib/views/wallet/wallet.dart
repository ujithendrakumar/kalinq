// ...existing code...
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalinq/components/custom_button.dart';
import 'package:kalinq/utils/theme.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final List<Map<String, dynamic>> transactions = [
    {
      'name': 'Lorem Ipsum',
      'date': '26 .11 .2021  -  5:15 AM',
      'amount': '-₹5000',
      'status': 'Withdrawn',
      'avatar':
          'https://images.unsplash.com/photo-1502685104226-ee32379fefbe?w=200&q=80',
    },
    {
      'name': 'Lorem Ipsum',
      'date': '21 .11 .2021  -  2:15 PM',
      'amount': '₹8000',
      'status': '',
      'avatar':
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=200&q=80',
    },
    {
      'name': 'Lorem Ipsum',
      'date': '19 .11 .2021  -  4:35 AM',
      'amount': '₹5000',
      'status': 'Pending',
      'avatar':
          'https://images.unsplash.com/photo-1502685104226-ee32379fefbe?w=200&q=80',
    },
    {
      'name': 'Lorem Ipsum',
      'date': '26 .11 .2021  -  5:15 AM',
      'amount': '-₹5000',
      'status': 'Withdrawn',
      'avatar':
          'https://images.unsplash.com/photo-1502685104226-ee32379fefbe?w=200&q=80',
    },
    {
      'name': 'Lorem Ipsum',
      'date': '21 .11 .2021  -  2:15 PM',
      'amount': '₹8000',
      'status': '',
      'avatar':
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=200&q=80',
    },
    {
      'name': 'Lorem Ipsum',
      'date': '19 .11 .2021  -  4:35 AM',
      'amount': '₹5000',
      'status': 'Pending',
      'avatar':
          'https://images.unsplash.com/photo-1502685104226-ee32379fefbe?w=200&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Greeting + Balance
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hello Lorem,',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF111111),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Your available balance',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF9AA0A6),
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                  const Text(
                    '₹15,901',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFEE4B2B),
                      fontFamily: "Inter",
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  //
                  Expanded(
                    child: CustomButton(
                      text: "Add Fund",
                      height: 30,
                      backgroundColor: Colors.green,
                      fontSize: 12,
                      textColor: jwhiteColor,
                      onPressed: () {
                        Get.toNamed('/wallet/add');
                      },
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: CustomButton(
                      text: "Withdraw",
                      height: 30,
                      backgroundColor: Colors.red,
                      fontSize: 12,
                      textColor: jwhiteColor,
                      onPressed: () {
                        Get.toNamed('/wallet/withdraw');
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Summary Card
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFEE4B2B),
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _summaryItem('₹5,820', 'Pending'),
                    _dividerOnCard(),
                    _summaryItem('₹20,890', 'Received'),
                    _dividerOnCard(),
                    _summaryItem('178', 'Credit Coins'),
                  ],
                ),
              ),
              // Transactions heading + filter icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Transactions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FeatherIcons.filter),
                    color: const Color(0xFF6B7280),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Transactions list
              Column(
                children: transactions
                    .map(
                      (t) => Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 26,
                            backgroundImage: NetworkImage(t['avatar']),
                          ),
                          title: Text(
                            t['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          subtitle: Text(
                            t['date'],
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 12,
                            ),
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                t['amount'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  color: t['amount'].toString().startsWith('-')
                                      ? const Color(0xFFEA4335)
                                      : t['status'] == 'Pending'
                                      ? const Color(0xFFF5B942)
                                      : const Color(0xFF12B76A),
                                ),
                              ),
                              if ((t['status'] as String).isNotEmpty)
                                Text(
                                  t['status'],
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 12,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 22),

              // Campaign banner
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.all(10),
        height: 86,
        decoration: BoxDecoration(
          color: const Color(0xFFEE4B2B),
          borderRadius: BorderRadius.circular(14),
          image: const DecorationImage(
            image: AssetImage('assets/images/splash.png'),
            fit: BoxFit.cover,
            opacity: 0.06,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Find More',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'campaigns',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF5D24E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Text(
                  'View',
                  style: TextStyle(
                    color: Color(0xFF332B1A),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryItem(String value, String label, {Color? valueColor}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? const Color(0xFFF7E58A),
              fontWeight: FontWeight.w800,
              fontSize: 18,
              fontFamily: "Inter",
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dividerOnCard() {
    return Container(
      height: 34,
      width: 1,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _navItem(IconData icon, {required bool active}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: active
          ? BoxDecoration(
              color: const Color(0xFFFFF1EE),
              borderRadius: BorderRadius.circular(12),
            )
          : null,
      child: Icon(
        icon,
        color: active ? const Color(0xFFEE4B2B) : const Color(0xFF9AA0A6),
      ),
    );
  }
}
