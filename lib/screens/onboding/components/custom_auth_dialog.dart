import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'sign_in_form.dart';
import 'sign_up_form.dart';

Future<Object?> customAuthDialog(BuildContext context,
    {required ValueChanged onCLosed, bool showSignIn = false}) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: showSignIn ? "Sign In" : "Sign Up",
    context: context,
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (_, animation, __, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    pageBuilder: (context, _, __) => AuthNavigationDialog(
      initialShowSignIn: showSignIn,
    ),
  ).then(onCLosed);
}

class AuthNavigationDialog extends StatefulWidget {
  final bool initialShowSignIn;

  const AuthNavigationDialog({
    Key? key,
    this.initialShowSignIn = false,
  }) : super(key: key);

  @override
  State<AuthNavigationDialog> createState() => _AuthNavigationDialogState();
}

class _AuthNavigationDialogState extends State<AuthNavigationDialog> {
  late bool showSignIn;

  @override
  void initState() {
    super.initState();
    showSignIn = widget.initialShowSignIn;
  }

  void toggleAuthMode() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.94),
          borderRadius: const BorderRadius.all(Radius.circular(40)),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      showSignIn ? "Sign In" : "Daftar Akun",
                      style:
                          const TextStyle(fontSize: 34, fontFamily: "Poppins"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        showSignIn
                            ? "Akses berbagai konten sejarah. pelajari materi dan video yang menarik, Gunakan kesempatan ini untuk menjadi sejarawan"
                            : "Bergabunglah dengan History Explorer dan mulai perjalanan sejarah Anda. Daftar sekarang untuk mengakses konten eksklusif",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // Show either Sign In or Sign Up form
                    showSignIn ? const SignInForm() : const SignUpForm(),

                    // Navigation button between forms
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: TextButton(
                        onPressed: toggleAuthMode,
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFFF77D8E),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                        ),
                        child: Text(
                          showSignIn
                              ? "Belum punya akun? Daftar sekarang"
                              : "Sudah punya akun? Masuk di sini",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    Row(
                      children: const [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              color: Colors.black26,
                            ),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        showSignIn
                            ? "Sign up with Email, Facebook or Google"
                            : "Daftar dengan Email, Facebook atau Google",
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ),
                    // Social login buttons
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/icons/google_box.svg",
                        height: 64,
                        width: 64,
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: -48,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
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
