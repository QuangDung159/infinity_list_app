class Comment {
  final int postId;
  final int id;
  final String email;
  final String body;
  final String name;

  Comment(
      {required this.postId,
      required this.id,
      required this.body,
      required this.email,
      required this.name});
}
