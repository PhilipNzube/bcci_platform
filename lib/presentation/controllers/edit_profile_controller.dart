import 'package:bcci_platform/core/services/graphql_service.dart';
import 'package:bcci_platform/core/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';

class EditProfileController extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  String _gender = "Male";
  bool _isLoading = false;

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _location = TextEditingController();

  EditProfileController();

  //public getters
  bool get isLoading => _isLoading;
  String? get gender => _gender;

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
