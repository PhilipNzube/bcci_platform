import 'package:bcci_platform/core/services/graphql_service.dart';
import 'package:bcci_platform/core/widgets/custom_snackbar.dart';
import 'package:bcci_platform/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class UserPageController extends ChangeNotifier {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  List _searchResults = [];
  bool _searchLoading = false;
  bool _isSearching = false;
  List<String> _imagePaths = [
    "images/Banner.png",
    "images/Banner.png",
    "images/Banner.png",
  ];
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  Map<String, bool> _isLikedMap = {};
  int? _selectedRadioValue = 0;
  final storage = const FlutterSecureStorage();
  ValueNotifier<String?> _selectedFilter = ValueNotifier<String?>(null);
  bool _isFilterActive = false;
  int? userId;
  String? _fullName;
  String? _userName;
  String? _profileImage;
  String? _email;
  String? _address;
  String? _city;
  String? _state;
  String? _storeName;
  String? _storeWebsiteUrl;
  String? _storeDescription;
  String? _walletBalance;
  String? _phone;
  String? _gender;
  String? _role;
  List<Map<String, dynamic>> products = [];
  bool _isLoading = false;
  late SharedPreferences prefs;
  Timer? _timer;
  int _remainingTime = 0;
  bool _isLoading2 = false;
  bool _isRefreshing = false;
  StreamSubscription<ConnectivityResult>? connectivitySubscription;
  late ScrollController _scrollController;
  int pageNum = 1;
  bool _isFetchingMore = false;
  String _userRole = "";
  String _url = "";
  bool _isMoved = false;
  bool _isLoggedOut = false;
  String _previousRole = "Customer";
  String _currentRole = "Customer";
  bool _activateFabForCustomerView = false;
  // late Future<void> _userData;

  UserPageController() {
    initialize();
  }

  //public getters
  String? get fullName => _fullName;
  String? get userName => _userName;
  String? get phone => _phone;
  String? get email => _email;
  String? get profileImage => _profileImage;
  String? get address => _address;
  String? get city => _city;
  String? get state => _state;
  String? get storeName => _storeName;
  String? get storeWebsiteUrl => _storeWebsiteUrl;
  String? get storeDescription => _storeDescription;
  String? get walletBalance => _walletBalance;
  String? get gender => _gender;
  String? get role => _role;
  int get remainingTime => _remainingTime;
  bool get isSearching => _isSearching;
  bool get isLoading => _isLoading;
  bool get isLoading2 => _isLoading2;
  bool get searchLoading => _searchLoading;
  List<dynamic> get searchResults => _searchResults;
  int get current => _current;
  bool get isFetchingMore => _isFetchingMore;
  List<String> get imagePaths => _imagePaths;
  bool get isFilterActive => _isFilterActive;
  ValueNotifier<String?> get selectedFilter => _selectedFilter;
  int? get selectedRadioValue => _selectedRadioValue;
  String get userRole => _userRole;
  bool get isMoved => _isMoved;
  bool get isLoggedOut => _isLoggedOut;
  String get previousRole => _previousRole;
  String get currentRole => _currentRole;
  bool get activateFabForCustomerView => _activateFabForCustomerView;
  // Future<void> get userData => _userData;

  TextEditingController get searchController => _searchController;
  CarouselSliderController get controller => _controller;
  ScrollController get scrollController => _scrollController;

  FocusNode get searchFocusNode => _searchFocusNode;

  void setActivateFabForCustomerView(bool value) {
    _activateFabForCustomerView = value;
    notifyListeners();
  }

  void setCurrentRole(String value) {
    _currentRole = value;
    notifyListeners();
  }

  void setPreviousRole(String value) {
    _previousRole = value;
    notifyListeners();
  }

  void refreshController() {
    notifyListeners();
  }

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setIsLoggedOut(bool value) {
    _isLoggedOut = value;
    notifyListeners();
  }

  void setIsSearching(bool value) {
    _isSearching = value;
    notifyListeners();
  }

  void setCurrent(int value) {
    _current = value;
    notifyListeners();
  }

  void setIsFilterActive(bool value) {
    _isFilterActive = value;
    notifyListeners();
  }

  void setSelectedRadioValue(int value) {
    _selectedRadioValue = value;
    notifyListeners();
  }

  void setIsMoved(bool value) {
    _isMoved = value;
    notifyListeners();
  }

  void initialize() async {
    await fetchUserProfile(navigatorKey.currentContext!);
  }

  Future<void> initializePrefs() async {
    prefs = await SharedPreferences.getInstance();
    notifyListeners();
  }

  Future<void> fetchUserProfile(BuildContext context) async {
    // Get stored ID and token
    final String? userId = await storage.read(key: "userId");
    final String? token = await storage.read(key: "accessToken");

    if (userId == null || userId.trim().isEmpty) {
      CustomSnackbar.show(context, 'No user ID found.', isError: true);
      return;
    }
    if (token == null || token.trim().isEmpty) {
      CustomSnackbar.show(context, 'No access token found.', isError: true);
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      const String userQuery = r'''
    query User($id: String) {
      user(id: $id) {
        id
        fullName
        phone
        username
      }
    }
    ''';

      final Map<String, dynamic> variables = {"id": userId};

      final QueryResult result = await GraphQLService.client.mutate(
        MutationOptions(document: gql(userQuery), variables: variables),
      );

      print("===== USER PROFILE RESPONSE =====");
      print(result.data);

      if (result.hasException) {
        print('GraphQL Exception: ${result.exception}');
        final String errorMessage =
            result.exception?.graphqlErrors.isNotEmpty == true
            ? result.exception!.graphqlErrors.first.message
            : 'Failed to fetch profile.';
        CustomSnackbar.show(context, errorMessage, isError: true);
        return;
      }

      final userData = result.data?['user'];
      if (userData == null) {
        CustomSnackbar.show(context, 'User not found.', isError: true);
        return;
      }

      CustomSnackbar.show(
        context,
        'Welcome back, ${userData['username']}!',
        isError: false,
      );

      // You can store/update local profile state here
      // Example:
      // _currentUser = User.fromJson(userData);
    } catch (e, stackTrace) {
      print('Unexpected error: $e');
      print('Stack trace: $stackTrace');
      CustomSnackbar.show(
        context,
        'Something went wrong. Please try again.',
        isError: true,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
