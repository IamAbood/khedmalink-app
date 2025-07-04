import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/widgets/appbar/appbar.dart';
import 'package:khedma_link/screens/home_page/components/cuverd_edg/cuverd_edges_widets.dart';

class ProjectImage extends StatelessWidget {
  const ProjectImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TCurveWidgets(
      child: Container(
        color: TColors.white,
        child: const Stack(
          children: [
            SizedBox(
              height: 435,
              child: Padding(
                padding: EdgeInsets.all(0.8),
                child: Center(
                  child: Image(
                    image: AssetImage("assets/banner/greenHouse.jpeg"),
                  ),
                ),
              ),
            ),
            //appbar icons
            TAppBar(
              showBackArrow: true,
            ),
          ],
        ),
      ),
    );
  }
}
