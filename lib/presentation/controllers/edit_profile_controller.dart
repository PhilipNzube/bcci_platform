import 'package:bcci_platform/core/services/graphql_service.dart';
import 'package:bcci_platform/core/widgets/custom_snackbar.dart';
import 'package:bcci_platform/main.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';

class EditProfileController extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  String _gender = "Male";
  String? _userName;
  bool _isLoading = false;
  final storage = const FlutterSecureStorage();

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _location = TextEditingController();

  EditProfileController() {
    initialize();
  }

  //public getters
  bool get isLoading => _isLoading;
  String? get gender => _gender;
  String? get userName => _userName;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get fullName => _fullName;
  TextEditingController get dateOfBirth => _dateOfBirth;
  TextEditingController get email => _email;
  TextEditingController get phoneNumber => _phoneNumber;
  TextEditingController get location => _location;

  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  void setDateOfBirth(String value) {
    _dateOfBirth.text = value;
    notifyListeners();
  }

  void setFullName(String value) {
    _fullName.text = value;
    notifyListeners();
  }

  void setGender(String? value) {
    _gender = value!;
    notifyListeners();
  }

  void setUserName(String value) {
    _userName = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email.text = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    _phoneNumber.text = value;
    notifyListeners();
  }

  void setLocation(String value) {
    _location.text = value;
    notifyListeners();
  }

  void initialize() async {
    await fetchUserProfile(navigatorKey.currentContext!);
  }

  Future<void> fetchUserProfile(BuildContext context) async {
    // Get stored ID and token
    final String? userId = await storage.read(key: "userId");
    final String? token = await storage.read(key: "accessToken");

    print("User ID: $userId");

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
        username
        email
        phone
        roles
        country
        state
        city
        bookmarkedContent
        spiritualGoals
      }
    }
    ''';

      final Map<String, dynamic> variables = {"id": userId};

      final client = await GraphQLService.getClient();

      final QueryResult result = await client.mutate(
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

      setUserName(userData['username']);
      setEmail(userData['email']);

      // CustomSnackbar.show(
      //   context,
      //   'Welcome back, ${userData['username']}!',
      //   isError: false,
      // );

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

  Future<void> updateUserProfile({
    required String fullName,
    required String phone,
    required String username,
    required BuildContext context,
  }) async {
    // Validate inputs
    if (fullName.trim().isEmpty ||
        phone.trim().isEmpty ||
        username.trim().isEmpty) {
      CustomSnackbar.show(context, 'All fields are required.', isError: true);
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      const String updateUserMutation = r'''
    mutation UpdateUser($user: updateUserInput!) {
      updateUser(user: $user) {
        id
        fullName
        phone
        username
      }
    }
    ''';

      final Map<String, dynamic> variables = {
        "user": {"fullName": fullName, "phone": phone, "username": username},
      };

      final client = await GraphQLService.getClient();

      final QueryResult result = await client.mutate(
        MutationOptions(
          document: gql(updateUserMutation),
          variables: variables,
        ),
      );

      print("===== UPDATE USER RESPONSE =====");
      print(result.data);

      if (result.hasException) {
        print('GraphQL Exception: ${result.exception}');
        final String errorMessage =
            result.exception?.graphqlErrors.isNotEmpty == true
            ? result.exception!.graphqlErrors.first.message
            : 'Update failed. Please try again.';
        CustomSnackbar.show(context, errorMessage, isError: true);
        return;
      }

      final updatedUser = result.data?['updateUser'];

      CustomSnackbar.show(
        context,
        'Profile updated for ${updatedUser['username']}',
        isError: false,
      );
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
