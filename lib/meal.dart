class Meal {
  Meal({
    required this.title,
    required this.description,
    required this.star,
    required this.commentCount,
    required this.level,
    required this.distance,
    required this.period,
    required this.price,
    required this.image,
  });
  final String title;
  final String description;
  final int star;
  final int commentCount;
  final MealLevel level;
  final double distance;
  final int period;
  final double price;
  final String image;
}

enum MealLevel {
  easy('Easy'),
  normal('Normal'),
  hard('Hard');

  const MealLevel(this.value);

  final String value;
}
