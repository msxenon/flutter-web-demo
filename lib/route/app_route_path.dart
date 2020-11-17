class AppRoutePath {
   final int? id;
  AppRoutePath.home():
      id = null,
        isUnknown = false;
  AppRoutePath.unKnown():
        id = null,
        isUnknown = true;

  AppRoutePath.post(int postId):
        id = postId,
        isUnknown = false;

  bool isUnknown  = false;

  @override
  String toString() {
    return 'AppRoutePath{ id: $id, isUnKnown: $isUnknown, isHomePage: $isHomePage, isDetails: $isDetailsPage}';
  }

   bool get isHomePage => id == null;

   bool get isDetailsPage => id != null;
}
