import 'package:flutter/material.dart';
import 'package:smartykids/ui/core/custom_widget/display_image_widget.dart';
import 'package:smartykids/ui/core/localization/applocalization.dart';
import 'package:smartykids/ui/core/themes/app_images.dart';

//############################################################################################################
enum BookingStatus { upcoming, completed, cancelled }

//############################################################################################################
enum TeeSlotStatus { available, booked, selected }

enum TeeSlotRowType { minPlayers, slotBoxes }

enum BookingTab { upcoming, completed }

enum FriendsTab { myFriends, pendingRequests }

enum FriendRequestStatus { addFriend, unfriend, cancelRequest }

//############################################################################################################
enum SliderMenuType {
  editProfile,
  myFriends,
  settings,
  helpSupport,
  faqs,
  aboutUs,
  privacyPolicy,
  deleteAccount;

  String get getTitle {
    switch (this) {
      case SliderMenuType.editProfile:
        return Strings.editProfile();
      case SliderMenuType.myFriends:
        return Strings.myFriends();
      case SliderMenuType.settings:
        return Strings.settings();
      case SliderMenuType.helpSupport:
        return Strings.helpSupport();
      case SliderMenuType.faqs:
        return Strings.faqs();
      case SliderMenuType.aboutUs:
        return Strings.aboutUs();
      case SliderMenuType.privacyPolicy:
        return Strings.privacyPolicy();
      case SliderMenuType.deleteAccount:
        return Strings.deleteAccount();
    }
  }

  String get getIcon {
    switch (this) {
      case SliderMenuType.editProfile:
        return AppIconsPaths.icPerson.path;
      case SliderMenuType.myFriends:
        return AppIconsPaths.icFriend.path;
      case SliderMenuType.settings:
        return AppIconsPaths.icSetting.path;
      case SliderMenuType.helpSupport:
        return AppIconsPaths.icHelp.path;
      case SliderMenuType.faqs:
        return AppIconsPaths.icFaq.path;
      case SliderMenuType.aboutUs:
        return AppIconsPaths.icAbout.path;
      case SliderMenuType.privacyPolicy:
        return AppIconsPaths.icPrivacy.path;
      case SliderMenuType.deleteAccount:
        return AppIconsPaths.icDelete.path;
    }
  }

  String get getRouteName {
    switch (this) {
      case SliderMenuType.editProfile:
        return 'editProfileScreen';
      case SliderMenuType.myFriends:
        return 'myFriendsScreen';
      case SliderMenuType.settings:
        return 'settingsScreen';
      case SliderMenuType.helpSupport:
        return 'helpAndSupportScreen';
      case SliderMenuType.faqs:
        return 'faqsScreen';
      case SliderMenuType.aboutUs:
        return 'aboutUsScreen';
      case SliderMenuType.privacyPolicy:
        return 'privacyPolicyScreen';
      case SliderMenuType.deleteAccount:
        return 'deleteAccountScreen';
    }
  }
}

//############################################################################################################
enum ScoreType {
  eagle,
  birdie,
  par,
  bogey,
  doubleBogey,
  tripleBogeyPlus;

  String get displayName {
    switch (this) {
      case ScoreType.eagle:
        return 'Eagle';
      case ScoreType.birdie:
        return 'Birdie';
      case ScoreType.par:
        return 'Par';
      case ScoreType.bogey:
        return 'Bogey';
      case ScoreType.doubleBogey:
        return 'Double Bogey';
      case ScoreType.tripleBogeyPlus:
        return 'Triple Bogey +';
    }
  }
}

//############################################################################################################

enum WalkThroughPageType {
  one,
  two,
  three;

  Widget get image {
    switch (this) {
      case WalkThroughPageType.one:
        return CustomImageView(
          imagePath: AppImagePaths.imWalkthroughPage1.path,
          fit: BoxFit.cover,
        );
      case WalkThroughPageType.two:
        return CustomImageView(
          imagePath: AppImagePaths.imWalkthroughPage2.path,
          fit: BoxFit.cover,
        );
      case WalkThroughPageType.three:
        return CustomImageView(
          imagePath: AppImagePaths.imWalkthroughPage3.path,
          fit: BoxFit.cover,
        );
    }
  }

  String get title {
    switch (this) {
      case WalkThroughPageType.one:
        return Strings.walkthroughPage1Title();
      case WalkThroughPageType.two:
        return Strings.walkthroughPage2Title();
      case WalkThroughPageType.three:
        return Strings.walkthroughPage3Title();
    }
  }

  String get subTitle {
    switch (this) {
      case WalkThroughPageType.one:
        return Strings.walkthroughPage1Subtitle();
      case WalkThroughPageType.two:
        return Strings.walkthroughPage2Subtitle();
      case WalkThroughPageType.three:
        return Strings.walkthroughPage3Subtitle();
    }
  }

  static List<WalkThroughPageType> allPages = [WalkThroughPageType.one, WalkThroughPageType.two, WalkThroughPageType.three];
}