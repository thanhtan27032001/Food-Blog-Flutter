import 'package:food_blog/domain/models/user.dart';

class RecipeComment {
  late final String id;
  late final String comment;
  late final DateTime commentDate;
  late final User user;

  RecipeComment(this.id, this.comment, this.commentDate, this.user);
}