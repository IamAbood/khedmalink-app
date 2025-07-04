import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/screens/home_page/components/circular_container.dart';
import 'package:khedma_link/screens/home_page/components/cuverd_edg/cuverd_edges_widets.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurveWidgets(
      child: Container(
        color: wPurble,
        // padding: const EdgeInsets.only(bottom: 0),
        // child: SizedBox(
        //   height: 400,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: TCircularContainer(
                // ignore: deprecated_member_use
                backgraoundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TCircularContainer(
                // ignore: deprecated_member_use
                backgraoundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
