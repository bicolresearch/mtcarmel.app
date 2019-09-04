/*
*   Filename    :   branches_repo.dart
*   Purpose     :
*   Created     :   02/09/2019 12:55 PM by Detective Conan
*   Updated     :   02/09/2019 12:55 PM by Detective Conan
*   Changes     :   
*/

class BranchesRepo {
  // TODO use api
  final List<Map<String, dynamic>> _branches = [
    {
      "id": "1",
      "branch_id": "1",
      "news_feeds": "available",
      "send_help": "available",
      "services": "available",
      "tranparency": "available",
      "profile": "available"
    },
    {
      "id": "2",
      "branch_id": "2",
      "news_feeds": "available",
      "send_help": "available",
      "services": "available",
      "tranparency": "available",
      "profile": "available"
    },
    {
      "id": "3",
      "branch_id": "3",
      "news_feeds": "available",
      "send_help": "available",
      "services": "available",
      "tranparency": "available",
      "profile": "available"
    },
    {
      "id": "4",
      "branch_id": "4",
      "news_feeds": "available",
      "send_help": "available",
      "services": "available",
      "tranparency": "not_available",
      "profile": "available"
    },
  ];

  List<Map<String, dynamic>> get branches => _branches;
}
