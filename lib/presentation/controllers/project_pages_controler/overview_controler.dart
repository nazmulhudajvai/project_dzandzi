import 'package:get/get.dart';
import 'package:dzandzi/data/services/project_Page_api.dart';
import 'package:dzandzi/presentation/data/models/project_overview_model.dart';

class ProjectOverviewController extends GetxController {
  var isLoading = true.obs;
  var overviewData = Rxn<ProjectOverviewModel>();
  var errorMessage = ''.obs;

  final String projectId; // receive projectId from navigation

  ProjectOverviewController(this.projectId);

  @override
  void onInit() {
    super.onInit();
    fetchProjectOverview();
  }

  void fetchProjectOverview() async {
    try {
      isLoading(true);
      errorMessage('');
      var data = await ProjectPageApi.fetchProjectDetails(projectId);
      overviewData.value = data;
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
