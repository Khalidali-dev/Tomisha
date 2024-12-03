import '../src.dart';

class RoundedButtonWidget extends StatelessWidget {
  const RoundedButtonWidget({
    super.key,
    required this.press,
    required this.title,
    this.bg = AppColors.primaryColor,
  });
  final VoidCallback press;
  final String title;
  final Color bg;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      onPressed: press,
      child: Text(title,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.white)),
    );
  }
}
