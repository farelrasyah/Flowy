import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/colors.dart';

class SelectionLoginRegister extends StatefulWidget {
  const SelectionLoginRegister({super.key});

  @override
  State<SelectionLoginRegister> createState() => _SelectionLoginRegisterState();
}

class _SelectionLoginRegisterState extends State<SelectionLoginRegister>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _scaleController;
  late AnimationController _floatingController;
  
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _floatingAnimation;
  
  int _hoveredIndex = -1;

  @override
  void initState() {
    super.initState();
    
    // Initialize animation controllers
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _floatingController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    
    // Initialize animations
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.elasticOut,
    ));
    
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));
    
    _floatingAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _floatingController,
      curve: Curves.easeInOut,
    ));
    
    // Start animations
    _startAnimations();
  }
  
  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _fadeController.forward();
    
    await Future.delayed(const Duration(milliseconds: 300));
    _slideController.forward();
    
    await Future.delayed(const Duration(milliseconds: 400));
    _scaleController.forward();
    
    _floatingController.repeat(reverse: true);
  }
  
  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    _floatingController.dispose();
    super.dispose();
  }

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
              backgroundColor1.withOpacity(0.9),
              primaryColor.withOpacity(0.15),
              backgroundColor4.withOpacity(0.8),
            ],
            stops: const [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: AnimatedBuilder(
            animation: _fadeAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeAnimation.value.clamp(0.0, 1.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 
                                 MediaQuery.of(context).padding.top - 
                                 MediaQuery.of(context).padding.bottom,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 20),
                              
                              // Floating decorative elements
                              _buildFloatingElements(),
                              
                              const SizedBox(height: 20),
                              
                              // Top Image Section with Hero Animation
                              AnimatedBuilder(
                                animation: _scaleAnimation,
                                builder: (context, child) {
                                  return Transform.scale(
                                    scale: _scaleAnimation.value,
                                    child: Hero(
                                      tag: 'login_image',
                                      child: Container(
                                        width: double.infinity,
                                        height: 280,
                                        child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                            // Static background effect
                                            Container(
                                              width: 300, // Increased from 240
                                              height: 300, // Increased from 240
                                              decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: RadialGradient(
                                                colors: [
                                                primaryColor.withOpacity(0.3),
                                                primaryColor.withOpacity(0.1),
                                                Colors.transparent,
                                                ],
                                              ),
                                              ),
                                            ),
                                            // Main image without animation
                                            Image.asset(
                                              'assets/images/LoginRegisterSelection.png',
                                              fit: BoxFit.contain,
                                              width: 360, // Increased from 320
                                              height: 360, // Increased from 320
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              
                              const SizedBox(height: 16),
                              
                              // Title Section with Slide Animation
                              SlideTransition(
                                position: _slideAnimation,
                                child: Column(
                                  children: [
                                    ShaderMask(
                                      shaderCallback: (bounds) => LinearGradient(
                                        colors: [
                                          textColor1,
                                          primaryColor,
                                        ],
                                      ).createShader(bounds),
                                      child: Text(
                                        'Welcome to Flowy',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                          letterSpacing: -0.8,
                                          height: 1.2,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                        'Pilih cara masuk yang Anda inginkan',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: textColor2,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          
                          const SizedBox(height: 32),
                          
                          // Bottom Section - Login Buttons
                          Column(
                            children: [
                              // Email Button
                              _buildAnimatedLoginButton(
                                context: context,
                                icon: Icons.email_outlined,
                                text: 'Lanjutkan dengan Email',
                                delay: 0,
                                index: 0,
                                onPressed: () {
                                  _handleButtonPress(() {
                                    // Handle email login
                                  });
                                },
                              ),
                              
                              const SizedBox(height: 14),
                              
                              // Phone Button
                              _buildAnimatedLoginButton(
                                context: context,
                                icon: Icons.person_outline,
                                text: 'Lanjutkan dengan nama',
                                delay: 100,
                                index: 1,
                                onPressed: () {
                                  _handleButtonPress(() {
                                    // Handle phone login
                                  });
                                },
                              ),
                              
                              const SizedBox(height: 20),
                              
                              // Social Login Section
                              _buildSocialLoginSection(),
                              
                              const SizedBox(height: 24),
                              
                              // Sign Up Text with Fade Animation
                              SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0, 1),
                                  end: Offset.zero,
                                ).animate(CurvedAnimation(
                                  parent: _slideController,
                                  curve: const Interval(0.7, 1.0, curve: Curves.elasticOut),
                                )),
                                child: _buildSignUpSection(),
                              ),
                              
                              const SizedBox(height: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  
  // Floating decorative elements
  Widget _buildFloatingElements() {
    return SizedBox(
      height: 20,
      child: AnimatedBuilder(
        animation: _floatingAnimation,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned(
                top: 5 + _floatingAnimation.value * 5,
                right: 30,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: 10 - _floatingAnimation.value * 3,
                left: 50,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: buttonColor.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: 2 + _floatingAnimation.value * 4,
                left: MediaQuery.of(context).size.width * 0.3,
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  
  // Handle button press with haptic feedback
  void _handleButtonPress(VoidCallback onPressed) {
    HapticFeedback.lightImpact();
    onPressed();
  }
  
  // Animated login button with hover effects
  Widget _buildAnimatedLoginButton({
    required BuildContext context,
    required IconData icon,
    required String text,
    required int delay,
    required int index,
    required VoidCallback onPressed,
  }) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 600 + delay),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, (1 - value) * 50),
          child: Opacity(
            opacity: value.clamp(0.0, 1.0),
            child: MouseRegion(
              onEnter: (_) => setState(() => _hoveredIndex = index),
              onExit: (_) => setState(() => _hoveredIndex = -1),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: double.infinity,
                height: 64,
                transform: Matrix4.identity()
                  ..scale((_hoveredIndex == index ? 1.02 : 1.0).clamp(0.1, 2.0)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(0.9),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(_hoveredIndex == index ? 0.3 : 0.1),
                        blurRadius: _hoveredIndex == index ? 20 : 10,
                        offset: const Offset(0, 8),
                        spreadRadius: _hoveredIndex == index ? 2 : 0,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: _hoveredIndex == index 
                          ? primaryColor.withOpacity(0.3)
                          : backgroundColor3.withOpacity(0.5),
                      width: 1.5,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onPressed,
                      borderRadius: BorderRadius.circular(20),
                      splashColor: primaryColor.withOpacity(0.1),
                      highlightColor: primaryColor.withOpacity(0.05),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    primaryColor.withOpacity(0.1),
                                    primaryColor.withOpacity(0.05),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: primaryColor.withOpacity(0.2),
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                icon,
                                size: 20,
                                color: textColor1,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                text,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: textColor1,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ),
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                size: 16,
                                color: primaryColor,
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
          ),
        );
      },
    );
  }
  
  // Social login section with modern design
  Widget _buildSocialLoginSection() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 800),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, (1 - value) * 30),
          child: Opacity(
            opacity: value.clamp(0.0, 1.0),
            child: Column(
              children: [
                // Divider with "or" text
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              textColor2.withOpacity(0.3),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'atau lanjutkan dengan',
                        style: TextStyle(
                          fontSize: 14,
                          color: textColor2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              textColor2.withOpacity(0.3),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                // Social login buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSocialButton(
                      icon: Icons.g_mobiledata_rounded,
                      onPressed: () {
                        _handleButtonPress(() {
                          // Handle Google login
                        });
                      },
                      delay: 0,
                    ),
                    _buildSocialButton(
                      icon: Icons.facebook_rounded,
                      onPressed: () {
                        _handleButtonPress(() {
                          // Handle Facebook login
                        });
                      },
                      delay: 100,
                    ),
                    _buildSocialButton(
                      icon: Icons.apple_rounded,
                      onPressed: () {
                        _handleButtonPress(() {
                          // Handle Apple login
                        });
                      },
                      delay: 200,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  
  // Social login button
  Widget _buildSocialButton({
    required IconData icon,
    required VoidCallback onPressed,
    required int delay,
  }) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 500 + delay),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value.clamp(0.0, 1.0),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
              border: Border.all(
                color: backgroundColor3.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPressed,
                borderRadius: BorderRadius.circular(18),
                splashColor: primaryColor.withOpacity(0.1),
                child: Center(
                  child: Icon(
                    icon,
                    size: 28,
                    color: textColor1,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  
  // Sign up section with modern styling
  Widget _buildSignUpSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text.rich(
        TextSpan(
            text: 'Baru di Flowy? ',
          style: TextStyle(
            fontSize: 16,
            color: textColor2,
            fontWeight: FontWeight.w500,
          ),
          children: [
            WidgetSpan(
              child: GestureDetector(
                onTap: () {
                  _handleButtonPress(() {
                    // Handle sign up navigation
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [primaryColor.withOpacity(0.1), primaryColor.withOpacity(0.05)],
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Buat Akun',
                    style: TextStyle(
                      fontSize: 16,
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
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