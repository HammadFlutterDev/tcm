class PostDataModel {
  final UserModel? user;
  final String? postText;
  final String? attachmentLink;
  final List<String>? postImages;
  final num reactionCount;
  final List<String>? topReactions;
  final List<UserComments>? comments;

  // Constructor with required parameters and optional parameters
  PostDataModel({
    required this.user,
    required this.postText,
    required this.attachmentLink,
    required this.comments,
    required this.postImages,
    required this.reactionCount,
    this.topReactions,
  });
}

class UserModel {
  final String? name;
  final String? image;
  final String? status;

  // Constructor with optional parameters
  UserModel({
    this.name,
    this.image,
    this.status,
  });

  // Default constructor
  UserModel.defaultConstructor()
      : name = '',
        image = '',
        status = '';
}

class UserComments {
  final UserModel? user;
  final String content;

  // Constructor with optional user and default content
  UserComments({
    this.user,
    this.content = "",
  });
}
