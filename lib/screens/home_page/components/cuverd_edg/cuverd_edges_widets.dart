import 'package:flutter/material.dart';
import 'package:khedma_link/screens/home_page/components/cuverd_edg/curved_edgs.dart';

class TCurveWidgets extends StatelessWidget {
  const TCurveWidgets({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: child,
    );
  }
}
