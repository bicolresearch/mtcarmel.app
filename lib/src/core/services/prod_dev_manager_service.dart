/*
*   Filename    :   prod_dev_manager_service.dart
*   Purpose     :   Sets production or development
*   Created     :   14/10/2019 9:57 AM by Detective Conan
*   Updated     :   14/10/2019 9:57 AM by Detective Conan
*   Changes     :   
*/

enum ProdDevEnum{
  Production,
  Development
}

class ProdDevManagerService{

  final _prodDevEnum;

  get prodDevEnum => _prodDevEnum;

  ProdDevManagerService(this._prodDevEnum);

}