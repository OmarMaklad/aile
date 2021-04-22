import 'package:aile/views/login/view.dart';
import 'package:aile/views/memberHome/view.dart';
import 'package:aile/views/tabsScreen/view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Color kPrimaryColor = Color(0xFFC59DD5);
const Color kAccentColor = Color(0xFFE1D4E6);
const Color kTextColor = Color(0xFFB5B5B5);
const Color kBackgroundColor = Color(0xFFEEECEC);
const Color kHomeColor = Color(0xFFF9F9F9);
const Color kRoundColor = Color(0xFFFEBD2F);

//constant functions
double sizeFromHeight(BuildContext context, double fraction,{bool removeAppBarSize = true}) {
  double deviceHeight = MediaQuery.of(context).size.height;
  fraction = (removeAppBarSize ? (deviceHeight - AppBar().preferredSize.height) : deviceHeight) / (fraction == 0 ? 1 : fraction);
  return fraction;
}

double sizeFromWidth(BuildContext context, double fraction) {
  fraction = MediaQuery.of(context).size.width / (fraction == 0 ? 1 : fraction);
  return fraction;
}

