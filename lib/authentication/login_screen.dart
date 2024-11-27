import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home.dart';
import '../widgets/colors.dart';
import '../widgets/round_button.dart';
import '../widgets/round_textfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController txtUser = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    txtUser.dispose();
    txtPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/bg1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),

                      // Login Form
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: TColor.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: TColor.primary.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Image.asset(
                              'assets/img/newLogo.png',
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 20),
                            // Let's Travel Text
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "HR ",
                                    style: TextStyle(
                                      color: TColor.primaryText,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Attendance ",
                                    style: TextStyle(
                                      color: TColor.primaryText,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "System ",
                                    style: TextStyle(
                                      color: TColor.primaryText,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "AMG Group",
                                    style: TextStyle(
                                      color: TColor.secondary,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Welcome To AMG Group HR System",
                              style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 40),

                            RoundTextfield(
                              hintText: "User name",
                              controller: txtUser,
                            ),
                            const SizedBox(height: 25),
                            RoundTextfield(
                              hintText: "Password",
                              controller: txtPassword,
                              obscureText: _obscurePassword,
                              right: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: TColor.secondaryText,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  // Get.offAll(() => const Home());
                                },
                                child: const Text(
                                  "Forgot password?",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),

                            SizedBox(
                              width: double.maxFinite,
                              height: 50,
                              child: isLoading
                                  ? Center(
                                      child: CircularProgressIndicator(
                                        color: TColor.primary,
                                      ),
                                    )
                                  : RoundButton(
                                      title: "Login",
                                      onPressed: () {
                                        Get.to(() => HomeDashboard(
                                              name: 'Ahmad',
                                              joiningDate: '11th Nov',
                                              allowedLeaves: 15,
                                              approvedLeaves: 0,
                                              unapprovedAbsents: 7, totalUsedLeaves: 0, remainingLeaves: 15, overLeaves: 0, missingCheckout: 0, doubleAbsents: 0,
                                            ));
                                      },
                                    ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
