import 'package:dzandzi/data/services/project_Page_api.dart';
import 'package:dzandzi/presentation/data/models/project_list_model.dart';
import 'package:get/get.dart';

 
 

class ProjectController extends GetxController {
  var allProjects = <Project>[].obs; // all projects from API
  var displayedProjects = <Project>[].obs; // filtered & searched
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  // Search text
  var searchQuery = ''.obs;

  // Filter: All, Active, Completed, On-going
  var filterStatus = 'All'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProjects();
  }

  void fetchProjects() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final result = await ProjectPageApi.fetchProjectList();
      allProjects.value = result;
      applyFilters();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void applyFilters() {
    List<Project> filtered = allProjects;

    // Filter by status
    if (filterStatus.value != 'All') {
      filtered = filtered
          .where((p) => p.status.toLowerCase() ==
              filterStatus.value.toLowerCase())
          .toList();
    }

    // Search by project name
    if (searchQuery.value.isNotEmpty) {
      filtered = filtered
          .where((p) =>
              p.name.toLowerCase().contains(searchQuery.value.toLowerCase()))
          .toList();
    }

    displayedProjects.value = filtered;
  }

  void updateSearch(String query) {
    searchQuery.value = query;
    applyFilters();
  }

  void updateFilter(String status) {
    filterStatus.value = status;
    applyFilters();
  }
}
