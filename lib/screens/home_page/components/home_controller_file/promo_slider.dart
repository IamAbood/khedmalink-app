import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/screens/home_page/components/circular_container.dart';
import 'package:khedma_link/screens/home_page/components/home_controller_file/home_controller.dart';
import 'package:khedma_link/screens/home_page/components/rounded_image.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
    required this.banners,
  });
  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) => controller.updatePgeIndicator(index),
            ),
            items: banners.map((url) => RoundedImage(imageUrl: url)).toList()),
        const SizedBox(height: TSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  TCircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgraoundColor: controller.carousalCurrentIndex.value == i
                        ? buttounColor
                        : TColors.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
