/*
*   Filename    :   certification_service.dart
*   Purpose     :
*   Created     :   28/11/2019 1:52 PM by Detective Conan
*   Updated     :   28/11/2019 1:52 PM by Detective Conan
*   Changes     :   
*/

class CertificationService {
  // TODO implement code
//  Future<List<MassRequest>> getLiturgicalList() async {
//    final branchId = locator<BranchService>().branch.id;
//    final roleId = await locator<AuthenticationService>().getRoleId();
//    final userId = await locator<AuthenticationService>().getUserId();
//    List<MassRequest> _liturgicalList = [];
//    // TODO implement code
//    String url =
//        "${AppConstants.API_BASE_URL}mass_requests/?branch_id=$branchId&role_id=$roleId&user_id=$userId";

//    await http
//        .get(url)
//        .then((result) {
//      if (result.statusCode == 200) {
//        final body = json.decode(result.body);
//        print(body);
//        // TODO implement code
//      } else {
//        print(result.statusCode);
//      }
//    })
//        .timeout(Duration(seconds: 5))
//        .catchError((error) => throw error);
//    return _liturgicalList;
//  }
}