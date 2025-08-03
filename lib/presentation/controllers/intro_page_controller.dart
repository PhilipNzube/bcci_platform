import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class IntroPageController extends ChangeNotifier {
  List<String> _imagePaths = [
    "images/WelcomeImg.png",
    "images/WelcomeImg2.png",
    "images/WelcomeImg3.png",
  ];

  List<String> _imageHeaders = [
    'Grow Spiritually',
    'Connect Globally, Belong Locally',
    'Serve & Lead With Purpose',
  ];

  List<String> _imageSubheadings = [
    'Discipleship at Your Fingertips',
    'Join Your Cell, Anywhere',
    'Be Equipped to Impact',
  ];

  List<String> _imageSubheadings2 = [
    'Follow personalized learning paths, complete devotionals, and track your spiritual journey - all from your dashboard.',
    'Get auto-assigned to your local cluster and cell. Chat, attend events, and stay spiritually accountable - no matter where you are.',
    'Record your growth, earn badges, submit testimonies, and step into leadership or missionary roles.',
  ];

  int _current = 0;

  // Use the fully qualified CarouselController from the carousel_slider package
  final CarouselSliderController _controller = CarouselSliderController();
  DateTime? _currentBackPressTime;

  IntroPageController();

  //public getters
  int get current => _current;
  CarouselSliderController get controller => _controller;
  List<String> get imagePaths => _imagePaths;
  List<String> get imageHeaders => _imageHeaders;
  List<String> get imageSubheadings => _imageSubheadings;
  List<String> get imageSubheadings2 => _imageSubheadings2;

  void setCurrent(int value) {
    _current = value;
    notifyListeners();
  }
}
