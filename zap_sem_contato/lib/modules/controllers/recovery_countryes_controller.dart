import 'package:zap_sem_contato/shared/data/database_country.dart';

class RecoveryCountryesController {
  DatabaseCountry countryes = DatabaseCountry();

  late List _countryesList = [];

  List get countryesList => _countryesList;
  set countryesList(value) => _countryesList = value;

  Future listCountryes() async {
    for (var country in countryes.countries.values.toList()) {
      _countryesList.add({'ddi': country.ddi, 'country': country.pais});
    }
  }
}
