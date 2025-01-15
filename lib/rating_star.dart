import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({super.key, required this.star});

  final int star; // of 10

  @override
  Widget build(BuildContext context) {
    int fiveStar = (star / 2).truncate();
    ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ...List.generate(fiveStar, (index) {
          return Icon(
            Icons.star_rate_rounded,
            color: theme.colorScheme.primary,
          );
        }),
        ...List.generate(5 - fiveStar, (index) {
          return Icon(
            Icons.star_rate_rounded,
            color: theme.colorScheme.outlineVariant,
          );
        }),
      ],
    );
  }
}
