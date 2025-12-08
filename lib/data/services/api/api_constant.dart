class ApiConstant {
  ///  Common API List
  static const String stagingUrl = "https://la12.webdevprojects.cloud/la_the_skorekard/api";
  static const String version = "v1";
  static const String api = "$stagingUrl/$version";

  ///  Authentication API List
  static const String verifyLoginOtpUrl = "$api/verify-otp";
  static const String registerUrl = "$api/register";
  static const String sendOtpUrl = "$api/send-otp";
  static const String logoutUrl = "$api/logout";

  ///  User API List
  static const String getProfileUrl = "$api/get-profile";
  static const String editProfileUrl = "$api/edit-profile";
  static const String deleteAccountUrl = "$api/delete-account";

  /// Friends API List
  static const String getListUsers = "$api/users/list";
  static const String acceptFriendRequestUrl = "$api/friends/accept-request";
  static const String sendFriendRequestUrl = "$api/friends/send-request";

  /// Club API List
  static const String clubList = "$api/club/list";
  static const String clubShowDetails = "$api/club/show";

  /// Add Favorite API List
  static const String addOrRemovedFavoriteClub = "$api/favourites/add-remove";

  /// Golf-Course API List
  static const String golfCourseList = "$api/golf-course/list";
  static const String golfCourseShow = "$api/golf-course/show";
  static const String golfCourseCalendar = "$api/golf-course/calendar";

  /// Slot Listing API List
  static const String slotList = "$api/slots/list";
}