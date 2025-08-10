import 'package:bcci_platform/core/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:bcci_platform/core/services/graphql_service.dart';

class ClusterManagementPageController extends ChangeNotifier {
  int _selectedTabIndex = 0;

  // Form controllers
  final TextEditingController _clusterNameController = TextEditingController();
  final TextEditingController _clusterLeaderController =
      TextEditingController();
  final TextEditingController _membershipTargetController =
      TextEditingController();
  final TextEditingController _cellTargetController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // Dropdown values
  String? _selectedRegion;
  String? _selectedState;
  String? _selectedCountry;

  // Getters
  int get selectedTabIndex => _selectedTabIndex;
  TextEditingController get clusterNameController => _clusterNameController;
  TextEditingController get clusterLeaderController => _clusterLeaderController;
  TextEditingController get membershipTargetController =>
      _membershipTargetController;
  TextEditingController get cellTargetController => _cellTargetController;
  TextEditingController get descriptionController => _descriptionController;

  String? get selectedRegion => _selectedRegion;
  String? get selectedState => _selectedState;
  String? get selectedCountry => _selectedCountry;

  // Setters
  void setSelectedTabIndex(int value) {
    _selectedTabIndex = value;
    notifyListeners();
  }

  void setSelectedRegion(String? value) {
    _selectedRegion = value;
    notifyListeners();
  }

  void setSelectedState(String? value) {
    _selectedState = value;
    notifyListeners();
  }

  void setSelectedCountry(String? value) {
    _selectedCountry = value;
    notifyListeners();
  }

  Future<void> createCluster(BuildContext context) async {
    if (_clusterNameController.text.isEmpty ||
        _selectedRegion == null ||
        _clusterLeaderController.text.isEmpty ||
        _membershipTargetController.text.isEmpty ||
        _cellTargetController.text.isEmpty ||
        _selectedCountry == null) {
      CustomSnackbar.show(
        context,
        "Please fill all required fields",
        isError: true,
      );

      return;
    }

    const String mutation = r'''
      mutation CreateCluster($input: CreateClusterInput!) {
        createCluster(input: $input) {
          success
          message
          id
          cluster {
            clusterName
          }
        }
      }
    ''';

    final variables = {
      "input": {
        "clusterName": _clusterNameController.text,
        "region": _selectedRegion,
        "state": _selectedState ?? "",
        "membershipTarget": _membershipTargetController.text,
        "cellTarget": _cellTargetController.text,
        "country": _selectedCountry,
        "clusterLeader": _clusterLeaderController.text,
        "cells": [],
        "description": _descriptionController.text,
      },
    };

    final client = await GraphQLService.getClient();

    final result = await client.mutate(
      MutationOptions(document: gql(mutation), variables: variables),
    );

    if (result.hasException) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${result.exception.toString()}")),
      );
    } else {
      final data = result.data?['createCluster'];
      if (data != null && data['success'] == true) {
        Navigator.pop(context); // Close dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Cluster created: ${data['cluster']['clusterName']}"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data?['message'] ?? "Unknown error")),
        );
      }
    }
  }
}
