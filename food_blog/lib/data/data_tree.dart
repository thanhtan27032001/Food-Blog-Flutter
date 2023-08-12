class UserCollection {
  static const String collectionName = 'users';
  static const String fieldId = 'id';
  static const String fieldEmail = 'email';
  static const String fieldNickname = 'nickname';
  static const String fieldCity = 'city';
  static const String fieldIntro = 'intro';
  static const String fieldAvatarUrl = 'avatarUrl';
}

class RecipeCollection {
  static const String collectionName = 'recipes';
  static const String fieldRecipeId = 'recipeId';
  static const String fieldTitle = 'title';
  static const String fieldDescription = 'description';
  static const String fieldImageUrl = 'imageUrl';
  static const String fieldVideoUrl = 'videoUrl';
  static const String fieldIngredientList = 'ingredientList';
  static const String fieldStepList = 'stepList';
  static const String fieldUserId = 'userId';
  static const String fieldCookTime = 'cookTime';
  static const String fieldPrepareTime = 'prepareTime';
  static const String fieldServeNum = 'serveNum';
  static const String fieldStatus = 'status';
  static const String fieldUpdateDate = 'updateDate';
  static const String fieldNumOfLike = 'numOfLike';
  static const String fieldOfComment = 'numOfComment';

  static const String fieldAuthor = 'author';
}

class AuthCollection {
  static const String fieldUsername = 'username';
  static const String fieldPassword = 'password';
}

class IngredientCollection {
  static const String collectionName = 'ingredientTags';
  static const String fieldName = 'name';
  static const String fieldImageUrl = 'imageUrl';
}

class RecipeIngredientTagCollection {
  static const String collectionName = 'recipeIngredientTags';
  static const String fieldTag = 'tag';
  static const String fieldRecipeId = 'recipeId';
}