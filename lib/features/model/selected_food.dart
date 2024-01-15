class SelectedFood {
  final String title;
  final int id;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> instruction;

  SelectedFood({
    required this.title,
    required this.id,
    required this.imageUrl,
    required this.ingredients,
    required this.instruction,
  });
}
