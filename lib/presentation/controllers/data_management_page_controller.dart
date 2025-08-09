import 'package:bcci_platform/core/services/graphql_service.dart';
import 'package:bcci_platform/core/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';

class DataManagementPageController extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  String _gender = "Male";
  bool _isLoading = false;
  final storage = const FlutterSecureStorage();

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _location = TextEditingController();

  DataManagementPageController();

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

  Future<void> deleteUserAccount(BuildContext context) async {
    // Read saved ID from secure storage
    final String? userId = await storage.read(key: "userId");

    if (userId == null || userId.trim().isEmpty) {
      CustomSnackbar.show(context, 'No user ID found.', isError: true);
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      const String deleteUserMutation = r'''
    mutation deleteUser($id: String!) {
      deleteUser(id: $id) {
        message
        success
      }
    }
    ''';

      final Map<String, dynamic> variables = {"id": userId};

      final QueryResult result = await GraphQLService.client.mutate(
        MutationOptions(
          document: gql(deleteUserMutation),
          variables: variables,
        ),
      );

      print("===== DELETE USER RESPONSE =====");
      print(result.data);

      if (result.hasException) {
        print('GraphQL Exception: ${result.exception}');
        final String errorMessage =
            result.exception?.graphqlErrors.isNotEmpty == true
            ? result.exception!.graphqlErrors.first.message
            : 'Account deletion failed.';
        CustomSnackbar.show(context, errorMessage, isError: true);
        return;
      }

      final deleteResponse = result.data?['deleteUser'];
      final bool success = deleteResponse?['success'] ?? false;
      final String message =
          deleteResponse?['message'] ?? 'Account deletion completed.';

      CustomSnackbar.show(context, message, isError: !success);

      if (success) {
        // Clear storage and navigate to login
        await storage.deleteAll();
        Navigator.pushReplacementNamed(context, '/login');
      }
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
