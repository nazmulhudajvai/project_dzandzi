import 'package:get/get.dart';
import '../../../core/model/project_models/project_usage_model.dart';
import '../../../core/services/project_usage_api_service.dart';

class ProjectUsageFilterController extends GetxController {
  final ProjectUsageApiService _apiService = ProjectUsageApiService();
  
  var selectedFilter = 'All'.obs;
  var searchQuery = ''.obs;
  var isLoading = false.obs;
  var allProjects = <ProjectUsageModel>[].obs;
  var mostUsedItems = <MostUsedItemModel>[].obs;
  var totalProjects = 0.obs;
  
  @override
  void onInit() {
    super.onInit();
    print('🚀 ProjectUsageFilterController initialized');
    loadProjectUsageData();
  }
  
  Future<void> loadProjectUsageData() async {
    print('📡 Loading project usage data...');
    isLoading.value = true;
    try {
      final response = await _apiService.getProjectUsageData();
      if (response != null) {
        allProjects.value = response.projects;
        mostUsedItems.value = response.mostUsedItems;
        totalProjects.value = response.totalProjects;
        print('✅ Loaded ${response.projects.length} projects');
        print('✅ Loaded ${response.mostUsedItems.length} items');
      }
    } catch (e) {
      print('❌ Error: $e');
      Get.snackbar('Error', 'Failed to load projects');
    } finally {
      isLoading.value = false;
    }
  }
  
  void setFilter(String filter) {
    selectedFilter.value = filter;
    Get.back();
  }
  
  void clearFilter() {
    selectedFilter.value = 'All';
  }
  
  void setSearchQuery(String query) {
    searchQuery.value = query.toLowerCase();
  }
  
  void clearSearch() {
    searchQuery.value = '';
  }
  
  List<ProjectUsageModel> get filteredProjects {
    List<ProjectUsageModel> projects = allProjects.toList();
    
    // Apply filter
    if (selectedFilter.value == 'Active') {
      projects = projects.where((p) => p.status == 'Active').toList();
    } else if (selectedFilter.value == 'Inactive') {
      projects = projects.where((p) => p.status == 'Inactive').toList();
    }
    
    // Apply search
    if (searchQuery.value.isNotEmpty) {
      projects = projects.where((p) =>
        p.projectName.toLowerCase().contains(searchQuery.value) ||
        p.projectId.toLowerCase().contains(searchQuery.value)
      ).toList();
    }
    
    return projects;
  }
}
