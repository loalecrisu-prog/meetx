import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  static final AppState _i = AppState._internal();
  factory AppState() => _i;
  AppState._internal();

  bool isSubscriber = false;
  int directMatchCredits = 0;
  DateTime _dmDay = DateTime.now();

  final int baseDailyLikeLimit = 50;
  int likesRemaining = 50;
  DateTime _likesDay = DateTime.now();

  double kingBidRON = 0.0;
  String kingName = '';

  void _ensureDailyReset() {
    final now = DateTime.now();
    if (now.day != _likesDay.day || now.month != _likesDay.month || now.year != _likesDay.year) {
      _likesDay = now;
      likesRemaining = baseDailyLikeLimit;
    }
    if (now.day != _dmDay.day || now.month != _dmDay.month || now.year != _dmDay.year) {
      _dmDay = now;
      directMatchCredits = isSubscriber ? 2 : 0;
    }
  }

  void subscribe() { isSubscriber = true; directMatchCredits = 2; _dmDay = DateTime.now(); notifyListeners(); }
  void unsubscribe() { isSubscriber = false; directMatchCredits = 0; notifyListeners(); }

  bool like() { _ensureDailyReset(); if (likesRemaining > 0) { likesRemaining--; notifyListeners(); return true; } return false; }
  void addLikesFromAd() { likesRemaining += 50; notifyListeners(); }

  bool canDirectMatch() { _ensureDailyReset(); return isSubscriber && directMatchCredits > 0; }
  bool useDirectMatch() { _ensureDailyReset(); if (isSubscriber && directMatchCredits > 0) { directMatchCredits--; notifyListeners(); return true; } return false; }

  bool bidKing({required String bidder, required double ron}) {
    if (ron < 0.5) return false;
    if (ron <= kingBidRON) return false;
    kingBidRON = ron;
    kingName = bidder;
    notifyListeners();
    return true;
  }
}
