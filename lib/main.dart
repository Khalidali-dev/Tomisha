import 'package:onboarding/src/src.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.tealColor),
        useMaterial3: true,
      ),
      home: const OnboardingView(),
    );
  }
}
