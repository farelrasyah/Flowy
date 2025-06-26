import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'selection_login_register.dart';
import '../../../utils/colors.dart';


class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOutQuart,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutBack,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.85,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));

    // Start animations with delays
    Future.delayed(const Duration(milliseconds: 300), () {
      _fadeController.forward();
    });
    
    Future.delayed(const Duration(milliseconds: 600), () {
      _slideController.forward();
    });
    
    Future.delayed(const Duration(milliseconds: 900), () {
      _scaleController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          child: Column(
            children: [
              // Top Section with Animation
              Expanded(
                flex: 3,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    width: double.infinity,
                    child: Stack(
                      children: [
                        // Creative Background Elements
                        // Floating Geometric Shape - Top Right
                        Positioned(
                          top: -30,
                          right: -20,
                          child: ScaleTransition(
                            scale: _scaleAnimation,
                            child: TweenAnimationBuilder(
                              duration: const Duration(seconds: 8),
                              tween: Tween<double>(begin: 0, end: 1),
                              builder: (context, value, child) {
                                return Transform.rotate(
                                  angle: value * 6.28,
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(60),
                                        bottomRight: Radius.circular(60),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                      gradient: SweepGradient(
                                        center: Alignment.center,
                                        colors: [
                                          primaryColor.withOpacity(0.3),
                                          primaryColor.withOpacity(0.1),
                                          Colors.transparent,
                                          primaryColor.withOpacity(0.05),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        
                        // Morphing Shape - Left Side
                        Positioned(
                          top: size.height * 0.18,
                          left: -40,
                          child: ScaleTransition(
                            scale: _scaleAnimation,
                            child: TweenAnimationBuilder(
                              duration: const Duration(seconds: 6),
                              tween: Tween<double>(begin: 0, end: 1),
                              builder: (context, value, child) {
                                return Transform.scale(
                                  scale: 0.8 + (0.2 * value),
                                  child: Container(
                                    width: 100,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(50),
                                        bottom: Radius.circular(20),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          backgroundColor3.withOpacity(0.4),
                                          backgroundColor3.withOpacity(0.2),
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        
                        // Diamond Shape - Bottom Right
                        Positioned(
                          top: size.height * 0.3,
                          right: 30,
                          child: TweenAnimationBuilder(
                            duration: const Duration(seconds: 4),
                            tween: Tween<double>(begin: 0, end: 1),
                            builder: (context, value, child) {
                              return Transform.rotate(
                                angle: value * 3.14,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        primaryColor.withOpacity(0.6),
                                        primaryColor.withOpacity(0.2),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        
                        // Organic Blob - Left Bottom
                        Positioned(
                          top: size.height * 0.4,
                          left: 60,
                          child: TweenAnimationBuilder(
                            duration: const Duration(seconds: 5),
                            tween: Tween<double>(begin: 0, end: 1),
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: 0.6 + (0.4 * value),
                                child: Container(
                                  width: 30,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(15),
                                    ),
                                    gradient: RadialGradient(
                                      center: Alignment.topLeft,
                                      colors: [
                                        backgroundColor3.withOpacity(0.5),
                                        backgroundColor3.withOpacity(0.1),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        
                        // Floating Ring - Top Center
                        Positioned(
                          top: size.height * 0.05,
                          left: size.width * 0.3,
                          child: TweenAnimationBuilder(
                            duration: const Duration(seconds: 7),
                            tween: Tween<double>(begin: 0, end: 1),
                            builder: (context, value, child) {
                              return Transform.translate(
                                offset: Offset(
                                  20 * (value * 2 - 1),
                                  10 * (value * 2 - 1),
                                ),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: primaryColor.withOpacity(0.3),
                                      width: 2,
                                    ),
                                    gradient: RadialGradient(
                                      colors: [
                                        Colors.transparent,
                                        primaryColor.withOpacity(0.1),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        
                        // Main Content Area
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Creative Hexagonal Container with Modern Design
                              ScaleTransition(
                                scale: _scaleAnimation,
                                child: Container(
                                  width: 320,
                                  height: 320,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      // Outer Rotating Frame - Hexagon
                                      TweenAnimationBuilder(
                                        duration: const Duration(seconds: 8),
                                        tween: Tween<double>(begin: 0, end: 1),
                                        builder: (context, value, child) {
                                          return Transform.rotate(
                                            angle: value * 6.28, // 2π for full rotation
                                            child: Container(
                                              width: 320,
                                              height: 320,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: primaryColor.withOpacity(0.3),
                                                  width: 2,
                                                ),
                                                borderRadius: BorderRadius.circular(60),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      
                                      // Middle Floating Frame - Rounded Rectangle
                                      TweenAnimationBuilder(
                                        duration: const Duration(seconds: 6),
                                        tween: Tween<double>(begin: 0, end: 1),
                                        builder: (context, value, child) {
                                          return Transform.rotate(
                                            angle: -value * 6.28,
                                            child: Container(
                                              width: 280,
                                              height: 280,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    backgroundColor3.withOpacity(0.2),
                                                    Colors.transparent,
                                                    primaryColor.withOpacity(0.1),
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.circular(40),
                                                border: Border.all(
                                                  color: Colors.white.withOpacity(0.2),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      
                                      // Main Image Container - Modern Rounded Square
                                      Container(
                                        width: 240,
                                        height: 240,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              primaryColor.withOpacity(0.8),
                                              primaryColor,
                                              primaryColor.withOpacity(0.6),
                                            ],
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: primaryColor.withOpacity(0.4),
                                              blurRadius: 40,
                                              spreadRadius: 0,
                                              offset: const Offset(0, 15),
                                            ),
                                            BoxShadow(
                                              color: Colors.white.withOpacity(0.2),
                                              blurRadius: 20,
                                              spreadRadius: -5,
                                              offset: const Offset(0, -10),
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: Stack(
                                            children: [
                                              // Background Animated Gradient
                                              TweenAnimationBuilder(
                                                duration: const Duration(seconds: 4),
                                                tween: Tween<double>(begin: 0, end: 1),
                                                builder: (context, value, child) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      gradient: SweepGradient(
                                                        center: Alignment.center,
                                                        startAngle: value * 6.28,
                                                        colors: [
                                                          Colors.transparent,
                                                          primaryColor.withOpacity(0.1),
                                                          Colors.transparent,
                                                          backgroundColor3.withOpacity(0.1),
                                                          Colors.transparent,
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              
                                              // Main Image
                                              Container(
                                                margin: const EdgeInsets.all(12),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(38),
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      primaryColor.withOpacity(0.2),
                                                      primaryColor.withOpacity(0.1),
                                                      Colors.transparent,
                                                    ],
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(38),
                                                  child: Image.asset(
                                                    'assets/images/image.png',
                                                    fit: BoxFit.cover,
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                  ),
                                                ),
                                              ),
                                              
                                              // Floating Overlay Effect
                                              TweenAnimationBuilder(
                                                duration: const Duration(seconds: 3),
                                                tween: Tween<double>(begin: 0, end: 1),
                                                builder: (context, value, child) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(50),
                                                      gradient: RadialGradient(
                                                        center: Alignment(
                                                          0.3 * (value * 2 - 1),
                                                          -0.3 * (value * 2 - 1),
                                                        ),
                                                        radius: 0.8,
                                                        colors: [
                                                          Colors.white.withOpacity(0.1),
                                                          Colors.transparent,
                                                          primaryColor.withOpacity(0.05),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              
                                              // Inner Border Glow
                                              Container(
                                                margin: const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(42),
                                                  border: Border.all(
                                                    color: Colors.white.withOpacity(0.3),
                                                    width: 1.5,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      
                                      // Corner Accent Elements
                                      ...List.generate(4, (index) {
                                        return TweenAnimationBuilder(
                                          duration: Duration(milliseconds: 2000 + (index * 500)),
                                          tween: Tween<double>(begin: 0, end: 1),
                                          builder: (context, value, child) {
                                            double angle = (index * 1.57) + (value * 0.5); // π/2 * index + rotation
                                            return Transform.rotate(
                                              angle: angle,
                                              child: Positioned(
                                                top: 20 + (index % 2) * 280,
                                                left: 20 + ((index ~/ 2) % 2) * 280,
                                                child: Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        primaryColor.withOpacity(0.6),
                                                        Colors.transparent,
                                                      ],
                                                    ),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              ),
                              
                              const SizedBox(height: 32),
                              
                              // Modern Progress Indicator
                              FadeTransition(
                                opacity: _fadeAnimation,
                                child: Container(
                                  width: 80,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  child: Stack(
                                    children: [
                                      TweenAnimationBuilder(
                                        duration: const Duration(seconds: 2),
                                        tween: Tween<double>(begin: 0, end: 1),
                                        builder: (context, value, child) {
                                          return Container(
                                            width: 80 * value,
                                            height: 4,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2),
                                              gradient: LinearGradient(
                                                colors: [
                                                  primaryColor,
                                                  primaryColor.withOpacity(0.6),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
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
              
              // Bottom Content Section
              Expanded(
                flex: 2,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          // Title with modern typography
                          ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: [textColor1, primaryColor],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(bounds),
                            child: Text(
                              "Discover your\nDream Job Here",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 36,
                                color: Colors.white,
                                height: 1.1,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 16),
                          
                          // Subtitle with better spacing
                          Text(
                            "Explore exciting job opportunities\ntailored to your interests and expertise",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: textColor2,
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          
                          const Spacer(),
                          
                          // Modern Action Buttons with Advanced Interactions
                          ScaleTransition(
                            scale: _scaleAnimation,
                            child: Container(
                              height: 64,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                gradient: LinearGradient(
                                  colors: [
                                    backgroundColor3.withOpacity(0.9),
                                    backgroundColor3.withOpacity(0.7),
                                  ],
                                ),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 20,
                                    spreadRadius: 0,
                                    offset: const Offset(0, 4),
                                  ),
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.1),
                                    blurRadius: 10,
                                    spreadRadius: -5,
                                    offset: const Offset(0, -2),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  // Register Button
                                  Expanded(
                                    child: Container(
                                      height: 56,
                                      margin: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white.withOpacity(0.95),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(28),
                                        boxShadow: [
                                          BoxShadow(
                                            color: primaryColor.withOpacity(0.3),
                                            blurRadius: 12,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          borderRadius: BorderRadius.circular(28),
                                          onTap: () {
                                            print("Register button tapped!");
                                            HapticFeedback.lightImpact();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const SelectionLoginRegister(),
                                              ),
                                            );
                                          },
                                          child: Center(
                                            child: Text(
                                              "Register",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                                color: textColor1,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  
                                  // Login Button
                                  Expanded(
                                    child: Container(
                                      height: 56,
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          borderRadius: BorderRadius.circular(28),
                                          onTap: () {
                                            print("Login button tapped!");
                                            HapticFeedback.lightImpact();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const SelectionLoginRegister(),
                                              ),
                                            );
                                          },
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Login",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: textColor1,
                                                    letterSpacing: 0.5,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Icon(
                                                  Icons.arrow_forward_rounded,
                                                  color: textColor1,
                                                  size: 18,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Modern Button Widget with Advanced Interactions
class _ModernButton extends StatefulWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final Gradient? gradient;
  final Color textColor;
  final List<BoxShadow>? shadows;
  final bool showArrow;

  const _ModernButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.textColor,
    this.gradient,
    this.shadows,
    this.showArrow = false,
  });

  @override
  State<_ModernButton> createState() => _ModernButtonState();
}

class _ModernButtonState extends State<_ModernButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        height: 56,
        margin: widget.isSelected ? const EdgeInsets.all(4) : EdgeInsets.zero,
        decoration: BoxDecoration(
          gradient: widget.gradient,
          borderRadius: BorderRadius.circular(28),
          boxShadow: widget.shadows,
          border: !widget.isSelected && _isPressed
              ? Border.all(color: Colors.white.withOpacity(0.3), width: 1)
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(28),
            onTap: () {
              setState(() => _isPressed = true);
              _animationController.forward().then((_) {
                _animationController.reverse();
                setState(() => _isPressed = false);
              });
              widget.onTap(); // Call the actual onTap function
            },
            child: Center(
              child: widget.showArrow
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.text,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: widget.textColor,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: widget.textColor,
                          size: 18,
                        ),
                      ],
                    )
                  : Text(
                      widget.text,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: widget.textColor,
                        letterSpacing: 0.5,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}