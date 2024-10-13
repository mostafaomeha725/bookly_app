import 'package:booklyapp1/core/Router/goRouter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();

    // Create an AnimationController
    offsetanimation();
    Future.delayed(const Duration(seconds: 3), () {
      // Code to execute after the delay
      // Get.to(() => const HomeView(),
      //     transition: Transition.fade,
      //     duration: const Duration(milliseconds: 250));

      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kHomeView,
              );
            },
            child: const Image(image: AssetImage('assets/images/Logo.png'))),
        const SizedBox(
          height: 8,
        ),
        Center(
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return SlideTransition(
                  position: animation, child: const Text("Read Free Books"));
            },
          ),
        ),
      ],
    );
  }

  void offsetanimation() {
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Define the animation
    animation = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
        .animate(controller);

    // Start the animation
    controller.forward();
  }
}
