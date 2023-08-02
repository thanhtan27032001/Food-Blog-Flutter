import 'base_model.dart';

class RecipeCommentModel {
  late final String id;
  late final String comment;
  late final DateTime commentDate;
  late final UserModel user;

  RecipeCommentModel(this.id, this.comment, this.commentDate, this.user);
}