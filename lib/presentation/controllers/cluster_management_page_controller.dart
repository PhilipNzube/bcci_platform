import 'dart:math';

import 'package:bcci_platform/core/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:bcci_platform/core/services/graphql_service.dart';

class ClusterManagementPageController extends ChangeNotifier {
  int _selectedTabIndex = 0;
  bool _isLoading = false;
  List<Map<String, dynamic>> _clusterData = [];

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

  ClusterManagementPageController() {
    initialize();
  }

  // Getters
  int get selectedTabIndex => _selectedTabIndex;
  bool get isLoading => _isLoading;
  List<Map<String, dynamic>> get clusterData => _clusterData;
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

  void initialize() async {
    _clusterData = await fetchClusters();
    notifyListeners();
  }

  Future<void> refreshClusters() async {
    _clusterData = await fetchClusters();
    notifyListeners();
  }

  Future<List<Map<String, dynamic>>> fetchClusters() async {
    const String query = r'''
    query Clusters {
      getClusters {
        id
        clusterName
      }
    }
  ''';

    try {
      final client = await GraphQLService.getClient();
      final result = await client.query(QueryOptions(document: gql(query)));

      if (result.hasException) {
        print("GraphQL Error: ${result.exception}");
        return [];
      }

      final clusters = result.data?['getClusters'] ?? [];

      return clusters.map<Map<String, dynamic>>((c) {
        return {
          // API values
          'id': c['id'],
          'title': c['clusterName'] ?? 'Unnamed Cluster',

          // Dummy placeholders (replace when backend provides real values)
          'cluster': 'Unknown Region',
          'leader': 'No Leader Assigned',
          'stats': [
            {'label': 'Members', 'value': '${Random().nextInt(150)}'},
            {'label': 'Cells', 'value': '${Random().nextInt(15)}'},
            {
              'label': 'Health',
              'value': '+${(Random().nextDouble() * 20).toStringAsFixed(1)}%',
              'colorize': true,
            },
          ],
          'nextTime': 'TBD',
          'progressCurrent': Random().nextInt(150),
          'progressTotal': 150,
          'tags': ['Pending Setup'],
        };
      }).toList();
    } catch (e) {
      print("Exception: $e");
      return [];
    }
  }

  Future<void> createCluster(BuildContext context) async {
    if (_clusterNameController.text.isEmpty ||
        _selectedRegion == null ||
        _clusterLeaderController.text.isEmpty ||
        _membershipTargetController.text.isEmpty ||
        _cellTargetController.text.isEmpty ||
        _descriptionController.text.isEmpty) {
      CustomSnackbar.show(
        context,
        "Please fill all required fields",
        isError: true,
      );
      return;
    }
    _isLoading = true;
    notifyListeners();

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
        "country": _selectedCountry ?? "",
        "clusterLeader": _clusterLeaderController.text,
        "cells": [],
        "description": _descriptionController.text,
      },
    };

    try {
      final client = await GraphQLService.getClient();

      final result = await client.mutate(
        MutationOptions(document: gql(mutation), variables: variables),
      );

      if (result.hasException) {
        _isLoading = false;
        notifyListeners();
        // First, check GraphQL error messages
        String errorMessage = "An unexpected error occurred.";
        if (result.exception!.graphqlErrors.isNotEmpty) {
          errorMessage = result.exception!.graphqlErrors.first.message;
        } else if (result.exception!.linkException != null) {
          // This catches network-level errors
          errorMessage = result.exception!.linkException.toString();
        }

        CustomSnackbar.show(context, errorMessage, isError: true);
        return;
      }

      final data = result.data?['createCluster'];

      if (data != null && data['success'] == true) {
        _isLoading = false;
        notifyListeners();
        Navigator.pop(context); // Close dialog
        CustomSnackbar.show(
          context,
          "Cluster created: ${data['cluster']['clusterName']}",
          isError: false,
        );
      } else {
        _isLoading = false;
        notifyListeners();
        // If success is false, use the server's message or fallback
        final msg = data?['message'] ?? "Unable to create cluster.";
        CustomSnackbar.show(context, msg, isError: true);
      }
    } catch (e, stack) {
      _isLoading = false;
      notifyListeners();
      print("Unexpected error: $e");
      print(stack);
      CustomSnackbar.show(
        context,
        "Something went wrong. Please try again.",
        isError: true,
      );
    }
  }
}
