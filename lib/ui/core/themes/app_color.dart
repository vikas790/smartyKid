import 'dart:ui';

import '../../../utils/common.dart';

enum AppColorsData {
  // Black Colors Shade
  black050506('#050506'),
  black000000("#000000"),
  black17191C('#17191C'),
  black333333('#333333'),
  black030712("#030712"),
  black1A1A1A('#1A1A1A'),
  black040506('#040506'),
  black15171E('#15171E'),

  //  White Color Shade
  whiteFFFFFF('#FFFFFF'),
  whiteFCFCFD("#FCFCFD"),
  whiteE3E5E8("#E3E5E8"),
  whiteF0F0F5("#F0F0F5"),
  whiteF9F9FB('#F9F9FB'),
  whiteF7F8FD("#F7F8FD"),
  whiteF6F4F4('#F6F4F4'),
  whiteE0E0EB('#E0E0EB'),
  whiteF0F1F5('#F0F1F5'),
  whiteEAEBF1('#EAEBF1'),
  whiteF6F6F9('#F6F6F9'),

  // Green Color Shade
  green7FBF5C('#7FBF5C'),
  green4D8B31('#4D8B31'),
  green315024('#315024'),
  green008300("#008300"),
  green56BF27("#56BF27"),
  green47A025('#47A025'),
  green35AE28('#35AE28'),
  green28831E('#28831E'),
  green1C5B15('#1C5B15'),

  // Gray Color Shade
  gray767D89('#767D89'),
  gray3E445BCC('#3E445BCC'),
  gray2D3142('#2D3142'),
  gray464B53("#464B53"),
  grayF0F0F5('#F0F0F5'),
  gray454E54('#454E54'),
  grayF9F9FB('#F9F9FB'),
  gray141414('#141414'),
  grayACB1B9('#ACB1B9'),
  grayE3E5E8('#E3E5E8'),
  grayE0E0E0('#E0E0E0'),
  gray25282C('#25282C'),
  gray717E86('#717E86'),
  grayF3F3F7('#F3F3F7'),
  gray9197A1('#9197A1'),
  grayCCCCCC('#CCCCCC'),
  gray40465E('#40465E'),
  gray323649('#323649'),
  grayC2C6D6('#C2C6D6'),
  grayA4AAC1('#A4AAC1'),
  grayE0E2EB('#E0E2EB'),
  gray868DAC('#868DAC'),
  gray3E435B('#3E435B'),
  grayD9D9D9('#D9D9D9'),

  // Blue Color Shade
  blueABA8EE('#ABA8EE'),
  blueE7E6FB('#E7E6FB'),
  blue8A86E5('#8A86E5'),
  blue8784E8('#8784E8'),
  blue007AFF('#007AFF'),
  blue1428A0('#1428A0'),
  blue535A79('#535A79'),
  blue52527A('#52527A'),

  //  Purple Color Shade
  purpleE0DEF9('#E0DEF9'),
  purpleA09ED7('#A09ED7'),
  purple8784E8('#8784E8'),
  // Yellow Color Shade
  yellowEEE696('#EEE696'),
  yellowE5C203('#E5C203'),
  yellowC3A60A('#C3A60A'),

  //  Cherry
  cherryF8966D('#F8966D'),
  cherryB41803('#B41803'),

  // Red Color Shade
  redCD0617('#CD0617'),
  redFF0000('#FF0000'),
  redF5939C('#F5939C'),
  redFF700A('#FF700A'),
  redEC2328('#EC2328'),
  redF14600('#F14600'),
  redE95616('#E95616'),
  redFBDDD0('#FBDDD0'),
  redCB0617('#CB0617'),
  redFFEAEB('#FFEAEB'),
  redEF8354('#EF8354');

  final String color;

  const AppColorsData(this.color);

  Color get value => Common.setColor(color);
}