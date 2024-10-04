import 'package:fashion/models/fidget_image.dart';
import 'package:fashion/widgets/fidget.dart';
import 'package:flutter/material.dart';

class FidgetList extends StatelessWidget {
  const FidgetList({super.key});

   @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (ctx, idx) {
        return Fidget(fidgetImage: FidgetImage.any());
      },
    );
  }
}
