import 'package:get/get.dart';
import 'package:my_food/utils/app_constants.dart';
import '../api/api_client.dart';

class PupularProductRepo extends GetxService {
  final ApiClient apiClient;
  PupularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.popularProductUri);
  }
}