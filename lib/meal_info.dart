import 'package:flutter/material.dart';
import 'package:zendai_flutter_test/meal.dart';
import 'package:zendai_flutter_test/rating_star.dart';
import 'package:zendai_flutter_test/status_badge.dart';

class MealInfo extends StatefulWidget {
  const MealInfo({super.key, required this.meal});

  final Meal meal;

  @override
  State<MealInfo> createState() => _MealInfoState();
}

class _MealInfoState extends State<MealInfo> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final Meal meal = widget.meal;
    final ThemeData theme = Theme.of(context);

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 350.0,
          child: Image.asset(meal.image, fit: BoxFit.cover),
        ),
        Transform.translate(
          offset: const Offset(0, -48),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Card.filled(
                  margin: EdgeInsets.zero,
                  color: theme.colorScheme.surface,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24.0),
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0).add(
                      const EdgeInsets.only(bottom: 56.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Text(meal.title, style: theme.textTheme.headlineLarge),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            RatingStar(star: meal.star),
                            const SizedBox(width: 8),
                            Text(
                                "${(meal.star / 2).toString()} | ${meal.commentCount} comments"),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StatusBadge(
                              icon: const Icon(
                                Icons.change_circle_outlined,
                                color: Colors.orange,
                              ),
                              label: meal.level.value,
                            ),
                            StatusBadge(
                              icon: const Icon(
                                Icons.location_on_outlined,
                                color: Colors.teal,
                              ),
                              label: "${meal.distance}km",
                            ),
                            StatusBadge(
                              icon: const Icon(
                                Icons.history,
                                color: Colors.deepOrange,
                              ),
                              label: "${meal.period}min",
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Text('Introduce', style: theme.textTheme.titleLarge),
                        const SizedBox(height: 16),
                        Text(
                          meal.description,
                          textAlign: TextAlign.justify,
                          style: theme.textTheme.bodyLarge,
                          maxLines: expanded ? null : 3,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              expanded = !expanded;
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Expand',
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                              Icon(
                                expanded
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: theme.colorScheme.primary,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(right: 24.0),
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
                  child: FloatingActionButton(
                    onPressed: () {},
                    elevation: 0.0,
                    shape: const CircleBorder(),
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.surface,
                    child: const Icon(Icons.favorite),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
