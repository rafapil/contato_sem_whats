import 'package:zap_sem_contato/shared/data/database_country.dart';

class RecoveryCountryes {
  DatabaseCountry countryes = DatabaseCountry();

  late List _countryesList = [];

  List get countryesList => _countryesList;
  set countryesList(value) => _countryesList = value;

  Future listCountryes() async {
    // _countryesList = countryes.countries.values.toList();
    for (var country in countryes.countries.values.toList()) {
      _countryesList.add({'ddi': country.ddi, 'country': country.pais});
    }
  }
}
