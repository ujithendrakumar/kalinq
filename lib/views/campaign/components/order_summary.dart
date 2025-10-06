import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalinq/components/custom_back.dart';
import 'package:kalinq/utils/theme.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../components/custom_button.dart';
import '../order_success_page.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({super.key});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  late Razorpay _razorpay;
  String paymentStatus = '';
  bool isLoading = false;
  double totalAmount = 100;
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (!isLoading) {
    //     openCheckout();
    //   }
    // });
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void openCheckout() async {
    isLoading = true;
    if (mounted) setState(() {});
    var options = {
      'key': 'rzp_test_rtSwWoSEeMKEF4', // Razorpay test key
      'amount': (totalAmount * 100).toInt(), // in paise
      'name': 'Kalinq',
      'description': 'Campaign Payment',
      'prefill': {
        'contact': "Jithendra Kumar",
        'email': "jkthedeveloper@gmail.com",
        'mobile': "9666544180",
      },
      'external': {
        'wallets': ['paytm', 'simple'],
      },
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      setState(() {
        paymentStatus = 'Error: $e';
      });
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    setState(() {
      paymentStatus = 'Payment Successful! Creating order...';
      isLoading = true;
    });
    // Call API to create order
    try {
      // final data = {
      //   ...widget.orderDetails,
      //   'cartList': widget.cartList,
      //   'payment_id': response.paymentId,
      //   'amount': widget.totalAmount,
      //   'status': 'paid',
      // };
      // await postServiceRequest(
      //   url: ApiUrlsList.bookingCreateURL,
      //   data: data,
      //   authRequired: true,
      // );
      setState(() {
        paymentStatus = 'Order created successfully!';
        isLoading = false;
      });
      // Navigate to order success page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => OrderSuccessPage(customerName: 'Preetham'),
        ),
      );
    } catch (e) {
      setState(() {
        print(e);
        paymentStatus = 'Order creation failed: $e';
        isLoading = false;
      });
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    isLoading = false;
    setState(() {
      paymentStatus = 'Payment Failed: ${response.message}';
    });
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    setState(() {
      isLoading = false;

      paymentStatus = 'External Wallet Selected: ${response.walletName}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Summary",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: CustomBackButton(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return CartItem(currentIndex: index);
              },
              // 40 list items
              childCount: 2,
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(color: jwhiteColor),
        padding: EdgeInsets.all(16),
        height: 120,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "No of reels :  ",
                      style: GoogleFonts.poppins(
                        color: Colors.grey.shade700,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: '10',
                          style: GoogleFonts.poppins(
                            color: themeColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                          // recognizer: TapGestureRecognizer()
                          //   ..onTap = () {
                          //     // Get.toNamed('/signup');
                          //   },
                        ),
                      ],
                    ),
                  ),
                  if (false == true)
                    Text.rich(
                      TextSpan(
                        text: "Remain reels :  ",
                        style: GoogleFonts.poppins(
                          color: Colors.grey.shade700,
                          fontSize: 12,
                        ),
                        children: [
                          TextSpan(
                            text: '7',
                            style: GoogleFonts.poppins(
                              color: themeColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                            // recognizer: TapGestureRecognizer()
                            //   ..onTap = () {
                            //     // Get.toNamed('/signup');
                            //   },
                          ),
                        ],
                      ),
                    ),
                  Text.rich(
                    TextSpan(
                      text: "Amount :  ",
                      style: GoogleFonts.poppins(
                        color: Colors.grey.shade700,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: '₹35000',
                          style: GoogleFonts.poppins(
                            color: themeColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                          // recognizer: TapGestureRecognizer()
                          //   ..onTap = () {
                          //     // Get.toNamed('/signup');
                          //   },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              isLoading
                  ? SizedBox(
                      height: 50,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : CustomButton(
                      text: "Processed To Pay",
                      width: double.infinity,
                      fontSize: 16,
                      height: 50,
                      textColor: jwhiteColor,
                      backgroundColor: themeColor,
                      onPressed: () {
                        openCheckout();
                        // print("SUmmary Screen Going");
                        // Get.toNamed('/create-campaign/select-creator/order-summary');
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(color: jyellowLightColor),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(19),
              image: DecorationImage(
                image: AssetImage('assets/images/profile.png'),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.transparent,
                  BlendMode.color,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Sanjana Melgudi",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(right: 15, top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: (currentIndex == 0 || currentIndex == 1)
                            ? themeColor
                            : jGreyLightColor,
                        width: 1,
                      ),
                    ),
                    width: 80,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // cartController.decreaseQuantity(cartItem);
                            },
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                // color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                color: (currentIndex == 0 || currentIndex == 1)
                                    ? themeColor
                                    : jGreyLightColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          (currentIndex == 0)
                              ? "6"
                              : currentIndex == 1
                              ? "4"
                              : "0",
                          // "${cartItem.qty}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: (currentIndex == 0 || currentIndex == 1)
                                ? themeColor
                                : jGreyLightColor,
                            fontFamily: "Metropolis",
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // cartController.increaseQuantity(cartItem);
                            },
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                // color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Icon(
                                Icons.arrow_drop_up,
                                size: 20,
                                color: (currentIndex == 0 || currentIndex == 1)
                                    ? themeColor
                                    : jGreyLightColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
