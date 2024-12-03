import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding/src/src.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffE6FFFA), Color(0xffEBF4FF)])),
                  child: Column(
                    children: [
                      ContainerWidget(
                          height: 6,
                          width: size.width,
                          borderRadius: BorderRadius.circular(0),
                          child: const SizedBox()),
                      ContainerWidget(
                        height: 67,
                        width: size.width,
                        colorsList: const [Colors.white, Colors.white],
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                AppStrings.login,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.tealColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                      height(50),
                      size.width < 400
                          ? Column(
                              children: [
                                Text(
                                  AppStrings.deineJobWebsite,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          fontSize: 42,
                                          fontWeight: FontWeight.w500),
                                ),
                                height(20),
                                SvgPicture.asset(
                                  Images.agreement,
                                  fit: BoxFit.fitWidth,
                                )
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppStrings.deineJobWebsite,
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              fontSize: 42,
                                              fontWeight: FontWeight.w500),
                                    ),
                                    height(20),
                                    ContainerWidget(
                                        width: size.width * .15,
                                        height: 40,
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            AppStrings.registration,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                          ),
                                        ))
                                  ],
                                ),
                                width(100),
                                CircleAvatar(
                                  radius: 120,
                                  backgroundColor: Colors.white,
                                  child: SvgPicture.asset(
                                    Images.agreement,
                                    fit: BoxFit.fitWidth,
                                  ),
                                )
                              ],
                            ),
                      height(50),
                    ],
                  )),
              height(50),
              size.width > 400
                  ? const CustomTabBar()
                  : ContainerWidget(
                      color: Colors.white,
                      colorsList: const [Colors.white, Colors.white],
                      boxShadow: BoxShadow(
                          offset: const Offset(2, -2),
                          blurRadius: 5,
                          color: Colors.grey.withOpacity(.5)),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Column(
                        children: [
                          height(20),
                          ContainerWidget(
                              width: size.width,
                              margin: const EdgeInsets.all(20),
                              isMargin: true,
                              height: 40,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  AppStrings.registration,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                ),
                              )),
                          height(50),
                          const CustomTabBar(),
                          height(50),
                        ],
                      )),
              size.width > 400 ? height(50) : height(0),
            ],
          ),
        ),
      ),
    );
  }
}
