import 'package:flutter/material.dart';
import 'package:msa_internship/presentation/resources/color_manager.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child: Text('Welcome to onboarding screen'),
      ),
    );
  }
}
