import 'package:bcci_platform/core/services/graphql_service.dart';
import 'package:bcci_platform/core/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:graphql_flutter/graphql_flutter.dart';

class CellManagementPageController extends ChangeNotifier {
  int _selectedTabIndex = 0;
  bool _isLoading = false;
  bool _isLoadingCells = false;
  List<Map<String, dynamic>> _cellData = [];

  final TextEditingController _cellNameController = TextEditingController();
  final TextEditingController _meetingLocationController =
      TextEditingController();
  final TextEditingController _meetingTimeController = TextEditingController();
  final TextEditingController _membershipTargetController =
      TextEditingController();
  final TextEditingController _monthlyBudgetController =
      TextEditingController();
  final TextEditingController _maxCapacityController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _selectedCellType;
  String? _selectedCluster;
  String? _selectedClusterName;
  String? _cellLeader;
  List<String> _selectedMembersList = [];
  final List<Map<String, String>> _clusterOptions = [
    {"id": "64ffce0d8a31f28d9f85e921", "name": "Cluster 1"},
    {"id": "64ffce0d8a31f28d9f85e922", "name": "Cluster 2"},
  ];

  CellManagementPageController() {
    initialize();
  }

  int get selectedTabIndex => _selectedTabIndex;
  bool get isLoading => _isLoading;
  bool get isLoadingCells => _isLoadingCells;
  List<Map<String, dynamic>> get cellData => _cellData;

  TextEditingController get cellNameController => _cellNameController;
  TextEditingController get meetingLocationController =>
      _meetingLocationController;
  TextEditingController get meetingTimeController => _meetingTimeController;
  TextEditingController get membershipTargetController =>
      _membershipTargetController;
  TextEditingController get monthlyBudgetController => _monthlyBudgetController;
  TextEditingController get maxCapacityController => _maxCapacityController;
  TextEditingController get locationController => _locationController;
  TextEditingController get descriptionController => _descriptionController;

  String? get selectedCellType => _selectedCellType;
  String? get selectedCluster => _selectedCluster;
  String? get selectedClusterName => _selectedClusterName;
  String? get cellLeader => _cellLeader;
  List<String> get selectedMembersList =>
      List.unmodifiable(_selectedMembersList);
  List<Map<String, String>> get clusterOptions => _clusterOptions;

  void setSelectedTabIndex(int value) {
    _selectedTabIndex = value;
    notifyListeners();
  }

  void setSelectedCellType(String? value) {
    _selectedCellType = value;
    notifyListeners();
  }

  void setSelectedCluster(String? value) {
    _selectedCluster = value;
    notifyListeners();
  }

  void setSelectedClusterName(String value) {
    _selectedClusterName = value;
    notifyListeners();
  }

  void setCellLeader(String? value) {
    _cellLeader = value;
    notifyListeners();
  }

  void setSelectedMembers(List<String> members) {
    _selectedMembersList = members;
    notifyListeners();
  }

  void initialize() async {
    _cellData = await fetchCells();
    notifyListeners();
  }

  Future<void> refreshCells() async {
    await fetchCells();
  }

  Future<List<Map<String, dynamic>>> fetchCells() async {
    _isLoadingCells = true;
    notifyListeners();

    const String query = r'''
    query Cells {
      getCells {
        id
      }
    }
  ''';

    try {
      final client = await GraphQLService.getClient();
      final result = await client.query(QueryOptions(document: gql(query)));
      print(result);

      final List<dynamic> cells = result.data?['getCells'] ?? [];
      _cellData = cells.map((c) => {'id': c['id']}).toList();
    } catch (e) {
      debugPrint("Error fetching cells: $e");
      _cellData = [];
    }

    _isLoadingCells = false;
    notifyListeners();
    return _cellData; // ✅ actually return it
  }

  Future<void> createCell(BuildContext context) async {
    // Basic field validation
    if (_cellNameController.text.isEmpty ||
        _selectedCellType == null ||
        _meetingLocationController.text.isEmpty ||
        _meetingTimeController.text.isEmpty ||
        _selectedCluster == null ||
        _membershipTargetController.text.isEmpty ||
        _monthlyBudgetController.text.isEmpty ||
        _cellLeader == null ||
        _maxCapacityController.text.isEmpty ||
        _descriptionController.text.isEmpty) {
      print("""
  DEBUG - Missing Fields Check:
  cellName: "${_cellNameController.text}"
  selectedCellType: $_selectedCellType
  meetingLocation: "${_meetingLocationController.text}"
  meetingTime: "${_meetingTimeController.text}"
  selectedCluster: $_selectedCluster
  membershipTarget: "${_membershipTargetController.text}"
  monthlyBudget: "${_monthlyBudgetController.text}"
  cellLeader: $_cellLeader
  maxCapacity: "${_maxCapacityController.text}"
  description: "${_descriptionController.text}"
  """);
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
      mutation CreateCell($input: CreateCellInput!) {
        createCell(input: $input) {
          success
          message
          id
          cell {
            cellName
            id
          }
        }
      }
    ''';

    final variables = {
      "input": {
        "cellName": _cellNameController.text,
        "cellType": _selectedCellType,
        "meetingLocation": _meetingLocationController.text,
        "meetingTime": _meetingTimeController.text,
        "cluster": _selectedCluster,
        "membershipTarget": int.tryParse(_membershipTargetController.text) ?? 0,
        "monthlyBudget": double.tryParse(_monthlyBudgetController.text) ?? 0,
        "cellLeader": _cellLeader,
        "members": _selectedMembersList,
        "maxCapacity": int.tryParse(_maxCapacityController.text) ?? 0,
        "location": _locationController.text,
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
        final errorMessage = result.exception?.graphqlErrors.isNotEmpty == true
            ? result.exception!.graphqlErrors.first.message
            : "An unexpected error occurred";
        print("GraphQL Error: $errorMessage");

        CustomSnackbar.show(context, errorMessage, isError: true);
        return;
      }

      final data = result.data?['createCell'];
      if (data != null && data['success'] == true) {
        _isLoading = false;
        notifyListeners();
        Navigator.pop(context);
        CustomSnackbar.show(
          context,
          "Cell created: ${data['cell']['cellName']}",
          isError: false,
        );
      } else {
        _isLoading = false;
        notifyListeners();
        CustomSnackbar.show(
          context,
          data?['message'] ?? "Unknown error",
          isError: true,
        );
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print("Exception: $e");
      CustomSnackbar.show(
        context,
        "Something went wrong. Please try again.",
        isError: true,
      );
    }
  }

  @override
  void dispose() {
    _cellNameController.dispose();
    _meetingLocationController.dispose();
    _meetingTimeController.dispose();
    _membershipTargetController.dispose();
    _monthlyBudgetController.dispose();
    _maxCapacityController.dispose();
    _locationController.dispose();
    super.dispose();
  }
}
