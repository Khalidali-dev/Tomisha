import 'package:flutter_svg/flutter_svg.dart';

import '../src.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: size.width > 400 ? size.width * .307 : size.width,
            height: 50,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                  side: BorderSide(color: Colors.grey.shade300)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTabItem(0, AppStrings.arbeitnehmer, size),
                  _buildTabItem(1, AppStrings.arbeitgeber, size),
                  _buildTabItem(2, AppStrings.temporarbaro, size),
                ],
              ),
            ),
          ),
        ),
        height(50),
        _getTabContent(_selectedIndex, size),
      ],
    );
  }

  Widget _buildTabItem(int index, String label, Size size) {
    final isSelected = _selectedIndex == index;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Container(
            width: size.width > 400 ? size.width * .1 : size.width * .32,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: _getBorderRadius(index),
              color: isSelected ? AppColors.btnColor : Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (label.isNotEmpty)
                  Text(
                    label,
                    style: TextStyle(
                        color: isSelected ? Colors.white : AppColors.tealColor,
                        fontSize: size.width > 400 ? 14 : 10,
                        fontWeight: size.width > 400
                            ? FontWeight.w500
                            : FontWeight.bold),
                  ),
              ],
            ),
          ),
        ),
        index == 2
            ? const SizedBox()
            : Container(
                height: 50,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5)),
              ),
      ],
    );
  }

  BorderRadius _getBorderRadius(int index) {
    if (index == 0) {
      return const BorderRadius.only(
        topLeft: Radius.circular(17),
        bottomLeft: Radius.circular(17),
      );
    } else if (index == 2) {
      return const BorderRadius.only(
        topRight: Radius.circular(17),
        bottomRight: Radius.circular(17),
      );
    }
    return BorderRadius.circular(0);
  }

  Widget _getTabContent(int index, Size size) {
    return Column(
      children: [
        if (index == 0)
          const ContentWidget(
              heading: AppStrings.dreiEinfache,
              title1: AppStrings.erstellen,
              title2: AppStrings.erstellen,
              title3: AppStrings.mitNur,
              image1: Images.profile,
              image2: Images.task,
              image3: Images.personalFile),
        if (index == 1)
          const ContentWidget(
              heading: AppStrings.mitarbeiter,
              title1: AppStrings.one,
              title2: AppStrings.two,
              title3: AppStrings.wahle,
              image1: Images.profile,
              image2: Images.about,
              image3: Images.swipe),
        if (index == 2)
          ContentWidget(
              heading: AppStrings.vermit,
              title1: AppStrings.one3,
              title2: size.width > 400 ? AppStrings.to : AppStrings.mobileTo,
              title3:
                  size.width > 400 ? AppStrings.three : AppStrings.mobileThree,
              image1: Images.profile,
              image2: Images.jobOffers,
              image3: Images.business),
      ],
    );
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    super.key,
    required this.heading,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.image1,
    required this.image2,
    required this.image3,
  });

  final String heading, title1, title2, title3;
  final String image1, image2, image3;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              heading,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 16),
            ),
            height(20),
            SvgPicture.asset(image1),
            height(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "1.",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 130,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blueGreyTextColor),
                ),
                width(20),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Text(
                    title1,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
            height(20),
            Container(
              width: size.width,
              height: size.height * .6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: size.width > 400
                        ? const Radius.circular(1000)
                        : const Radius.circular(100),
                    bottomRight: size.width > 400
                        ? const Radius.circular(1000)
                        : const Radius.circular(100),
                  ),
                  gradient: const LinearGradient(
                      colors: [Color(0xffE6FFFA), Color(0xffEBF4FF)])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "2.",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 130,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blueGreyTextColor),
                      ),
                      width(20),
                      Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: Text(
                          title2,
                          maxLines: 2,
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  height(10),
                  SvgPicture.asset(image2),
                ],
              ),
            ),
            height(20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "3.",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 130,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueGreyTextColor),
                    ),
                    width(20),
                    Text(
                      title3,
                      maxLines: 2,
                      softWrap: true,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 16),
                    ),
                  ],
                ),
                height(10),
                SvgPicture.asset(image3),
              ],
            ),
          ]),
    );
  }
}
