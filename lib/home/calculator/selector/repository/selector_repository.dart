import 'package:microcoils/home/calculator/selector/data/air_cooler_request.dart';
import 'package:microcoils/home/calculator/selector/data/air_cooler_response.dart';
import '../../../../utils/ApiUrls.dart';
import '../../../../utils/api_requests.dart';

class SelectorRepository {
  Future<AirCoolerResponse?> getAirCoolers({required AirCoolerRequest airCoolerRequest}) async {
    AirCoolerResponse? loginResponse = await ApiRequest<AirCoolerRequest, AirCoolerResponse>().post(
      url: ApiUrls.airCoolers,
      request: airCoolerRequest,
      reponseFromJson: airCoolerResponseFromJson,
      requestToJson: airCoolerRequestToJson,
    );
    return loginResponse;
  }
}
