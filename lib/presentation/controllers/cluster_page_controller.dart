import 'dart:math';

import 'package:bcci_platform/core/services/graphql_service.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:graphql_flutter/graphql_flutter.dart';
import 'dart:async';

class ClusterPageController extends ChangeNotifier {
  int _selectedTabIndex = 0;
  bool _isLoading = false;
  List<Map<String, dynamic>> _clusterData = [];
  int _calculateAvgPerCell(Map<String, dynamic> cluster) {
    final members =
        int.tryParse(
          cluster['stats'].firstWhere((s) => s['label'] == 'Members')['value'],
        ) ??
        0;

    final cells =
        int.tryParse(
          cluster['stats'].firstWhere((s) => s['label'] == 'Cells')['value'],
        ) ??
        1; // avoid division by zero

    return (members / cells).round();
  }

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

  ClusterPageController() {
    initialize();
  }

  // Getters
  int get selectedTabIndex => _selectedTabIndex;
  bool get isLoading => _isLoading;
  List<Map<String, dynamic>> get clusterData => _clusterData;
  int Function(Map<String, dynamic> cluster) get calculateAvgPerCell =>
      _calculateAvgPerCell;
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
}
