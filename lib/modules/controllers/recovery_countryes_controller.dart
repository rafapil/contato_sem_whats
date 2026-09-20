import 'package:zap_sem_contato/shared/data/database_country.dart';

class RecoveryCountryesController {
  DatabaseCountry countryes = DatabaseCountry();

  List<Map<String, String>> countryesList = [];

  Future listCountryes() async {
    for (var country in countryes.countries.values.toList()) {
      countryesList.add({'ddi': country.ddi, 'country': country.pais});
    }
  }

}
