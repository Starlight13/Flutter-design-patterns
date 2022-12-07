enum PatternClassName { creational, structural, behavioral }

class DesignPattern {
  final String id;
  final String title;
  final String description;
  final PatternClassName patternClassName;

  DesignPattern(
    this.id, {
    required this.title,
    required this.description,
    required this.patternClassName,
  });
}
