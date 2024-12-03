import 'package:onboarding/src/src.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: OnboardingBodyWidget(size: size),
    );
  }
}
