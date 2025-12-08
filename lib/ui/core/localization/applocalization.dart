import 'package:localization/localization.dart';

class _LocaleDelegate {
  final String _str;

  _LocaleDelegate(this._str);

  call([dynamic args]) {
    List<String> mArgs = [];
    if (args != null) {
      mArgs.addAll(args);
    }
    return _str.i18n(mArgs);
  }
}

class Strings {
  static var appName = _LocaleDelegate("sKoreKard");

  static var somethingWentWrong = _LocaleDelegate("Something Went Wrong");
  static var noInternetConnectionError = _LocaleDelegate("No internet connection. Please try again later.");
  static var requestTimeOutError = _LocaleDelegate("Request timeout. Please try again late.");

  // Slider Menu
  static var editProfile = _LocaleDelegate("Edit Profile");
  static var myFriends = _LocaleDelegate("My Friends");
  static var pendingRequests = _LocaleDelegate("Pending Requests");
  static var settings = _LocaleDelegate("Settings");
  static var helpSupport = _LocaleDelegate("Help & Support");
  static var faqs = _LocaleDelegate("FAQs");
  static var aboutUs = _LocaleDelegate("About Us");
  static var privacyPolicy = _LocaleDelegate("Privacy Policy");
  static var deleteAccount = _LocaleDelegate("Delete Account");
  static var logOut = _LocaleDelegate("Log Out");
  static var accept = _LocaleDelegate("Accept");
  static var areYouSureYouWantToLogout = _LocaleDelegate("Are You Sure You Want To Log Out?");
  static var ifYouCancelYourReservedSlot = _LocaleDelegate("If you cancel, your reserved slot will be released and cannot be recovered.");
  static var areYorSureYouWantToDeleteYourAccount = _LocaleDelegate("Are You Sure You Want To Delete Your Account?");
  static var ifYouDeleteYourAccountYouWillLooseAllYourScore =
  _LocaleDelegate("If you delete your account you will loose all your score booking and membership info.");
  static var noPendingRequestsView = _LocaleDelegate("Everything's clear no pending requests at the moment.");
  static var noFriendsView = _LocaleDelegate("Looks like you're playing solo right now, start connecting with Golfers today!");

  //   Walkthrough Screen
  static var walkthroughPage1Title = _LocaleDelegate("Track Every Swing Like a Pro");
  static var walkthroughPage1Subtitle = _LocaleDelegate("Book tee times, join group rounds, and never miss a shot all in one place");
  static var walkthroughPage2Title = _LocaleDelegate("Your Game, Your Data");
  static var walkthroughPage2Subtitle = _LocaleDelegate("View net scores, birdies, bogeys, and more updated instantly.");
  static var walkthroughPage3Title = _LocaleDelegate("Climb the Leaderboard");
  static var walkthroughPage3Subtitle = _LocaleDelegate("Compete with friends, track ranking, and celebrate victories.");
  static var login = _LocaleDelegate("Log In");
  static var dontHaveAccount = _LocaleDelegate("Don't have an account? ");
  static var registerHere = _LocaleDelegate("Register here!");

  //  Login Screen
  static var welcomeBack = _LocaleDelegate("Welcome Back!");
  static var enterYourMailIdOrMobileNumberLogin = _LocaleDelegate("Enter your mail id or Mobile Number Log in.");
  static var enterEmailAddressMobileNumber = _LocaleDelegate("Enter Email Address / Mobile Number");
  static var iAccept = _LocaleDelegate("I accept  ");
  static var termsAndCondition = _LocaleDelegate("Terms & Condition");

  // Verify Screen
  static var verifyOtp = _LocaleDelegate("Verify OTP!");
  static var enterYourOTPSentToYourEmailID = _LocaleDelegate("Enter your OTP sent to your Email ID.");
  static var enterYourOTPSentToYourMobileNumber = _LocaleDelegate("Enter your OTP sent to your Mobile number.");
  static var resendOTP = _LocaleDelegate("Resend OTP");
  static var resendIn = _LocaleDelegate("Resend in:");
  static var verifyOTP = _LocaleDelegate("Verify OTP");

  // Register Screen
  static var welcomeToScoreKard = _LocaleDelegate("Welcome To SKoreKard!");
  static var pleaseFillTheBasicDetails = _LocaleDelegate("Please fill the basic details to continue to the next step.");
  static var enterYourFullName = _LocaleDelegate("Enter Your Full Name");
  static var enterMobileNumber = _LocaleDelegate("Enter Mobile Number");
  static var enterYourEmailAddress = _LocaleDelegate("Enter Your Email Address");
  static var selectGender = _LocaleDelegate("Select Gender");
  static var enterDateOfBirth = _LocaleDelegate("Enter Date Of Birth");
  static var register = _LocaleDelegate("Register");
  static var alreadyHaveAnAccount = _LocaleDelegate("Already have an account?");
  static var loginHere = _LocaleDelegate("Login here!");
  static var male = _LocaleDelegate("male");
  static var female = _LocaleDelegate("female");
  static var other = _LocaleDelegate("other");
  static var changeYourPhoto = _LocaleDelegate("Change your photo");
  static var addProfilePhoto = _LocaleDelegate("Add Profile Photo");
  static var editProfilePhoto = _LocaleDelegate("Edit Profile Photo");
  static var takeAPicture = _LocaleDelegate("Take a picture");
  static var openCamera = _LocaleDelegate("Open Camera");
  static var uploadFromGallery = _LocaleDelegate("Upload From Gallery");
  static var removePhoto = _LocaleDelegate("Remove photo");
  static var delete = _LocaleDelegate("Delete");
  static var cancel = _LocaleDelegate("Cancel");
  static var allowSkoreKardToAccessYourPhotos = _LocaleDelegate("Allow SkoreKard to Access Your Photos");
  static var allowSkoreKardToAccessYourCamera = _LocaleDelegate("Allow SkoreKard to Access your Camera");
  static var openSettings = _LocaleDelegate("Open settings");
  static var saveChanges = _LocaleDelegate("Save Changes");
  static var enterYourCity = _LocaleDelegate("Enter Your City");
  static var enterYourCountry = _LocaleDelegate("Enter Your Country");
  static var profileUpdatedSuccessfully = _LocaleDelegate("Profile updated successfully");

  // Tee Time Screen
  static var selectGolfClub = _LocaleDelegate("Select Golf Club");
  static var course = _LocaleDelegate("Course");
  static var date = _LocaleDelegate("Date");
  static var searchCourse = _LocaleDelegate("Search Course / Location");
  static var searchResults = _LocaleDelegate("Search Results");
  static var priceDetails = _LocaleDelegate("Price Details");
  static var moreInformation = _LocaleDelegate("More Information");
  static var amenities = _LocaleDelegate("Amenities");
  static var location = _LocaleDelegate("Location");
  static var viewOnGoogleMaps = _LocaleDelegate("View On Google Maps");
  static var holes = _LocaleDelegate("Holes");
  static var totalGolfers = _LocaleDelegate("Total Golfers");
  static var times = _LocaleDelegate("Time");
  static var firstTee = _LocaleDelegate("1st Tee");
  static var tenthTee = _LocaleDelegate("10th Tee");
  static var soloSlots = _LocaleDelegate("Solo Slots");
  static var minimum = _LocaleDelegate('minimum');
  static var available = _LocaleDelegate("available");
  static var selected = _LocaleDelegate("selected");
  static var playerName = _LocaleDelegate("Player Name");
  static var caddie = _LocaleDelegate("Caddie");
  static var cart = _LocaleDelegate("Cart");
  static var member = _LocaleDelegate("Member");
  static var player = _LocaleDelegate("Player");
  static var optional = _LocaleDelegate("(Optional)");
  static var totalAmount = _LocaleDelegate("Total Amount");
  static var paymentSummery = _LocaleDelegate("Payment Summary");
  static var cancellationPolicy = _LocaleDelegate("Cancellation Policy");
  static var price = _LocaleDelegate("Price");
  static var qty = _LocaleDelegate("Qty.");
  static var total = _LocaleDelegate("Total");
  static var greenFees = _LocaleDelegate("Green Fees");
  static var confirmBooking = _LocaleDelegate("Confirm Booking");
  static var addPlayer = _LocaleDelegate("Add Players");
  static var selectPlayer = _LocaleDelegate("Select Player");
  static var friends = _LocaleDelegate("Friends");
  static var guest = _LocaleDelegate("Guest");
  static var timeOfCancellation = _LocaleDelegate("Time Of Cancellation");
  static var amountRefund = _LocaleDelegate("Amount Refund");
  static var note = _LocaleDelegate("Note:");
  static var searchNameSkoreKardId = _LocaleDelegate("Search Name/sKoreKard ID");
  static var done = _LocaleDelegate("Done");
  static var searchFriends = _LocaleDelegate("Search Friends");
  static var addFriend = _LocaleDelegate("Add Friend");
  static var unfriend = _LocaleDelegate("Unfriend");
  static var cancelRequest = _LocaleDelegate("Cancel Request");
  static var noClubsFound = _LocaleDelegate("No clubs match your search.");

  static var noteMessage = _LocaleDelegate(
      "Please note that all reservation for caddies or cart can be cancelled up to 24 hours in advanced without any penalty. If You need to cancel your booking, please contact us as soon as possible.");
  static var caddieOrCartIsCompulsoryForEachMember = _LocaleDelegate("*caddie or cart is compulsory for each member.");
  static var oneCartCanBeSharedBetweenTwoMembers = _LocaleDelegate("**one cart can be shared between 2 members.");

  static var welcomeMessageForDelhiGolf = _LocaleDelegate(
      "Welcome to Green Valley Golf Course, where every swing counts! Our beautifully designed 18-hole course is perfect for golfers of all skill levels, from beginners taking their first shot to seasoned players looking for a challenge. Surrounded by lush greenery and scenic views, each hole offers a unique experience that blends relaxation with excitement. Whether you’re here for a casual round with friends or a competitive game, our course promises an unforgettable day. Enjoy top-class facilities, a welcoming clubhouse, and professional staff always ready to assist. At Green Valley, it’s not just about golf—it’s about creating lasting memories in the heart of nature. Welcome to Green Valley Golf Course, where every swing counts! Our beautifully designed 18-hole course is perfect for golfers of all skill levels, from beginners taking their first shot to seasoned players looking for a challenge. Surrounded by lush greenery and scenic views, each hole offers a unique experience that blends relaxation with excitement. Whether you’re here for a casual round with friends or a competitive game, our course promises an unforgettable day. Enjoy top-class facilities, a welcoming clubhouse, and professional staff always ready to assist. At Green Valley, it’s not just about golf—it’s about creating lasting memories in the heart of nature.");

  // Leaderboard Screen
  static var leaderboard = _LocaleDelegate("Leaderboard");
  static var scoreboard = _LocaleDelegate("Scoreboard");
  static var scorecard = _LocaleDelegate("Scorecard");
  static var position = _LocaleDelegate("Position");
  static var score = _LocaleDelegate("Score");
  static var thru = _LocaleDelegate("Thru");
  static var hole = _LocaleDelegate("HOLE");
  static var out = _LocaleDelegate("OUT");
  static var index = _LocaleDelegate("INDEX");
  static var par = _LocaleDelegate("PAR");
  static var gross = _LocaleDelegate("GROSS");
  static var net = _LocaleDelegate("NET");
  static var eagle = _LocaleDelegate("Eagle");
  static var birdie = _LocaleDelegate("Birdie");
  static var parScore = _LocaleDelegate("Par");
  static var bogey = _LocaleDelegate("Bogey");
  static var doubleBogey = _LocaleDelegate("Double Bogey");
  static var tripleBogeyPlus = _LocaleDelegate("Triple Bogey +");

  // My Booking Screen
  static var myBooking = _LocaleDelegate("My Booking");
  static var live = _LocaleDelegate("Live");
  static var upComing = _LocaleDelegate("Upcoming");
  static var pastBooking = _LocaleDelegate("Past Booking");
  static var cancelled = _LocaleDelegate("Cancelled");
  static var Date = _LocaleDelegate("Date");
  static var time = _LocaleDelegate("Time");
  static var players = _LocaleDelegate("Players");
  static var myGame = _LocaleDelegate("My Game");

  // Validations
  static var valid = _LocaleDelegate("valid");
  static var pleaseEnterYourFirstName = _LocaleDelegate("Please enter your first name");
  static var pleaseEnterYourLastName = _LocaleDelegate("Please enter your last name");
  static var pleaseEnterValidEmail = _LocaleDelegate("Please enter valid email");
  static var pleaseEnterValidPhoneNumber = _LocaleDelegate("Please enter valid phone number");
  static var youMustBeAtLeast18YearsOld = _LocaleDelegate("You must be at least 18 years old");
}