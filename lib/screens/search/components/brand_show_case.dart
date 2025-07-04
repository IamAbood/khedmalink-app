import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/widgets/rounded_container.dart';
import 'package:khedma_link/screens/search/components/brand_name.dart';

class BrandShoeCase extends StatelessWidget {
  const BrandShoeCase({
    super.key,
    // required this.texts,
  });
  // final List<String> texts;
  @override
  Widget build(BuildContext context) {
    return const RoundedContainer(
      showBorder: true,
      padding: EdgeInsets.all(TSizes.md),
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      childe: Column(
        children: [
          BrandCart(
            title: "",
            showBorder: false,
          ),
          SizedBox(
            height: TSizes.spaceBtwItems,
          )
          // Row(
          //   children: texts
          //       .map((text) => brandTopProductImageWidget(text, context))
          //       .toList(),
          // ),
        ],
      ),
    );
  }
}

//   Widget brandTopProductImageWidget(String text, context) {
//     return Expanded(
//       child: RoundedContainer(
//         height: 100,
//         padding: const EdgeInsets.all(TSizes.md),
//         margin: const EdgeInsets.only(right: TSizes.sm),
//         backgroundColor: buttounColor,
//         childe: TextButton(
//           onPressed: () {},
//           child: Text(
//             "We are looking for front-end developer",
//             style: Theme.of(context)
//                 .textTheme
//                 .labelMedium
//                 ?.copyWith(color: Colors.white),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
