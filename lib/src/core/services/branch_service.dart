/*
*   Filename    :   branch_service.dart
*   Purpose     :
*   Created     :   09/09/2019 9:36 AM by Detective Conan
*   Updated     :   09/09/2019 9:36 AM by Detective Conan
*   Changes     :   
*/

class BranchService{
  String _branchId = "1";

  String get branchId => _branchId;

  set branchId(String value) {
    _branchId = value;
  }

  String _branchName = "1";

  String get branchName {
    return _branchName;
  }

  set branchName(String value) => _branchName = value;
}