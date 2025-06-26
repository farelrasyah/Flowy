import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

class SelectionLoginRegister extends StatelessWidget {
  const SelectionLoginRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              backgroundColor1,
              backgroundColor1.withOpacity(0.8),
              primaryColor.withOpacity(0.1),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                
                // Top Image Section
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/LoginRegisterSelection.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // Title Section
                Text(
                  'Sign In for Flowy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: textColor1,
                    letterSpacing: -0.5,
                  ),
                ),
                
                const SizedBox(height: 48),
                
                // Login Buttons Section
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      // Continue with Email Button
                      _buildLoginButton(
                        context: context,
                        icon: Icons.email_outlined,
                        text: 'Continue with Email',
                        onPressed: () {
                          // Handle email login
                        },
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Continue with Number Button
                      _buildLoginButton(
                        context: context,
                        icon: Icons.phone_outlined,
                        text: 'Continue with Number',
                        onPressed: () {
                          // Handle phone login
                        },
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Continue with Facebook Button
                      _buildLoginButton(
                        context: context,
                        icon: Icons.facebook_outlined,
                        text: 'Continue with Facebook',
                        onPressed: () {
                          // Handle Facebook login
                        },
                        isSpecial: true,
                      ),
                      
                      const Spacer(),
                      
                      // Sign Up Text
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: Text.rich(
                          TextSpan(
                            text: 'I am a new user? ',
                            style: TextStyle(
                              fontSize: 16,
                              color: textColor2,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              WidgetSpan(
                                child: GestureDetector(
                                  onTap: () {
                                    // Handle sign up navigation
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                      decorationColor: primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton({
    required BuildContext context,
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
    bool isSpecial = false,
  }) {
    return Container(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSpecial ? buttonColor : Colors.white,
          foregroundColor: isSpecial ? Colors.white : textColor1,
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: isSpecial ? buttonColor : backgroundColor3,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSpecial ? Colors.white.withOpacity(0.2) : backgroundColor3,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                icon,
                size: 16,
                color: isSpecial ? Colors.white : textColor1,
              ),
            ),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(width: 40), // Balance the left spacing
          ],
        ),
      ),
    );
  }
}