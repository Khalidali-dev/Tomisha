import '../src.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.isWhite = false,
    required this.child,
    this.border,
    this.isPadding = false,
    this.isImage = false,
    this.color,
    this.isMargin = false,
    this.alignment,
    this.margin,
    this.padding,
    this.isDark = true,
    this.colorsList,
    this.boxShadow,
  });

  final double? width, height;
  final bool? isWhite, isPadding, isImage, isMargin;
  final Widget child;
  final Border? border;
  final Color? color;
  final BorderRadius? borderRadius;
  final Alignment? alignment;
  final EdgeInsetsGeometry? margin, padding;
  final List<Color>? colorsList;
  final bool isDark;
  final BoxShadow? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: alignment ?? Alignment.center,
      margin: isMargin == true ? margin : const EdgeInsets.all(0),
      padding: isPadding == true ? padding : const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        boxShadow: [
          boxShadow ??
              BoxShadow(
                  offset: const Offset(-2, 2),
                  blurRadius: 5,
                  color: Colors.grey.withOpacity(.5))
        ],
        gradient: LinearGradient(
          colors: colorsList ?? AppColors.gradientColors,
        ),
        color: color ?? Theme.of(context).scaffoldBackgroundColor,
        border: border ?? Border.all(width: 0, color: Colors.transparent),
      ),
      child: child,
    );
    // });
  }
}
