import 'package:flutter/material.dart';

const double _gap = 24;
const double _buttonHeight = 60;

class MealBottomBar extends StatefulWidget {
  const MealBottomBar({
    super.key,
    required this.price,
    required this.onAddToCart,
  });

  final double price;
  final Function() onAddToCart;

  @override
  State<MealBottomBar> createState() => _MealBottomBarState();
}

class _MealBottomBarState extends State<MealBottomBar> {
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final total = (_count * widget.price)
        .toString()
        .replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '');

    return Card.filled(
      color: theme.colorScheme.surfaceContainer,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(36.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(_gap),
        child: Row(
          children: [
            UnitCountButton(
              onCountChange: (int count) {
                setState(() {
                  _count = count;
                });
              },
            ),
            const SizedBox(width: _gap),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.primary.withAlpha(127),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: FilledButton(
                  onPressed: widget.onAddToCart,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(0, _buttonHeight),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    textStyle: theme.textTheme.labelLarge?.copyWith(
                      fontSize: 18,
                    ),
                    padding: EdgeInsets.zero
                  ),
                  child: Text('\$ $total | Add to cart', maxLines: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UnitCountButton extends StatefulWidget {
  const UnitCountButton({super.key, required this.onCountChange});

  final Function(int) onCountChange;

  @override
  State<UnitCountButton> createState() => _UnitCountButtonState();
}

class _UnitCountButtonState extends State<UnitCountButton> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      height: _buttonHeight,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.onSurface.withAlpha(15),
              blurRadius: 8,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Card.filled(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          color: theme.colorScheme.surface,
          margin: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: count > 1
                    ? () {
                        setState(() {
                          count--;
                        });
                        widget.onCountChange(count);
                      }
                    : null,
                icon: Text(
                  '-',
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontSize: 18,
                  ),
                ),
              ),
              Text(
                count.toString(),
                style: theme.textTheme.labelLarge?.copyWith(
                  fontSize: 18,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                  widget.onCountChange(count);
                },
                icon: Text(
                  '+',
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
