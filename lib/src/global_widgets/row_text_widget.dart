import '../src.dart';

class RowTextWidget extends StatelessWidget {
  const RowTextWidget({
    super.key,
    required this.title,
    required this.description,
    this.descStyle,
    this.titleStyle,
  });
  final String title, description;
  final TextStyle? titleStyle, descStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        Text(
          description,
          style: descStyle ??
              Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.blueGrey),
        ),
      ],
    );
  }
}
