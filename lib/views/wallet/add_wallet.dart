import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalinq/components/custom_back.dart';
import 'package:kalinq/components/custom_chip.dart';
import 'package:kalinq/components/custom_formfield.dart';
import 'package:kalinq/utils/theme.dart';

import '../../components/custom_button.dart';

class AddWallet extends StatefulWidget {
  const AddWallet({super.key});

  @override
  State<AddWallet> createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {
  TextEditingController addAmountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: CustomBackButton()),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.13),
                Text(
                  'Add Funds',
                  style: TextStyle(
                    fontSize: 18,
                    color: themeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Enter your amount',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Form(
                    child: Column(
                      children: [
                        CustomFormField(
                          hint: "₹500",
                          keyboardType: TextInputType.number,

                          inputFormaters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) {
                              return 'Number of reels required';
                            }
                            final n = int.tryParse(v.trim());
                            if (n == null || n <= 0) {
                              return 'Enter a valid positive integer';
                            }
                            return null;
                          },
                          controller: addAmountController,
                          suffix: (addAmountController.text.isEmpty)
                              ? null
                              : IconButton(
                                  onPressed: () {
                                    // FocusScope.of(context).unfocus();

                                    addAmountController.text = "";
                                    if (mounted) setState(() {});
                                  },
                                  icon: Icon(Icons.close),
                                ),
                        ),
                        SizedBox(height: 15),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text.rich(
                            TextSpan(
                              text: "Your Balance : ",
                              style: GoogleFonts.poppins(
                                color: Colors.grey.shade700,
                                fontSize: 12,
                              ),
                              children: [
                                TextSpan(
                                  text: '₹500',
                                  style: GoogleFonts.poppins(
                                    color: themeColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Wrap(
                  children: [500, 1000, 2000, 5000, 10000].map((i) {
                    return CustomChip(
                      title: "+ $i",
                      textColor: themeColor,
                      tileColor: jyellowLightColor,
                      onTap: () {
                        int initialAmount =
                            int.tryParse(addAmountController.text.trim()) ?? 0;
                        addAmountController.text = (initialAmount + i)
                            .toString();
                        if (mounted) setState(() {});
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 15),
                CustomButton(
                  text: "Add Money",
                  width: double.infinity,
                  fontSize: 16,
                  height: 50,
                  textColor: jwhiteColor,
                  backgroundColor: themeColor,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    print("Add Wallet Money Screen Going");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
