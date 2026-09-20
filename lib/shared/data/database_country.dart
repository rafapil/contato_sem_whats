import 'package:zap_sem_contato/shared/models/country_model.dart';

class DatabaseCountry {
  final Map<int, CountryModel> countries = {
    1: CountryModel(
        id: 1,
        pais: 'Turcas e Caicos',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Flag_of_the_Turks_and_Caicos_Islands.svg/23px-Flag_of_the_Turks_and_Caicos_Islands.svg.png',
        ddi: '+1'),
    7: CountryModel(
        id: 7,
        pais: 'Rússia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Flag_of_Russia.svg/23px-Flag_of_Russia.svg.png',
        ddi: '+7'),
    20: CountryModel(
        id: 20,
        pais: 'Egipto',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/23px-Flag_of_Egypt.svg.png',
        ddi: '+20'),
    27: CountryModel(
        id: 27,
        pais: 'África do Sul',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Flag_of_South_Africa.svg/23px-Flag_of_South_Africa.svg.png',
        ddi: '+27'),
    30: CountryModel(
        id: 30,
        pais: 'Grécia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Greece.svg/23px-Flag_of_Greece.svg.png',
        ddi: '+30'),
    31: CountryModel(
        id: 31,
        pais: 'Países Baixos',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/23px-Flag_of_the_Netherlands.svg.png',
        ddi: '+31'),
    32: CountryModel(
        id: 32,
        pais: 'Bélgica',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Flag_of_Belgium_%28civil%29.svg/23px-Flag_of_Belgium_%28civil%29.svg.png',
        ddi: '+32'),
    33: CountryModel(
        id: 33,
        pais: 'França',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/23px-Flag_of_France.svg.png',
        ddi: '+33'),
    34: CountryModel(
        id: 34,
        pais: 'Espanha',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Spain.svg/23px-Flag_of_Spain.svg.png',
        ddi: '+34'),
    36: CountryModel(
        id: 36,
        pais: 'Hungria',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Flag_of_Hungary.svg/23px-Flag_of_Hungary.svg.png',
        ddi: '+36'),
    39: CountryModel(
        id: 39,
        pais: 'Itália',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Flag_of_Italy.svg/23px-Flag_of_Italy.svg.png',
        ddi: '+39'),
    40: CountryModel(
        id: 40,
        pais: 'Romênia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Flag_of_Romania.svg/23px-Flag_of_Romania.svg.png',
        ddi: '+40'),
    41: CountryModel(
        id: 41,
        pais: 'Suíça',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Flag_of_Switzerland.svg/16px-Flag_of_Switzerland.svg.png',
        ddi: '+41'),
    43: CountryModel(
        id: 43,
        pais: 'Áustria',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Flag_of_Austria.svg/23px-Flag_of_Austria.svg.png',
        ddi: '+43'),
    44: CountryModel(
        id: 44,
        pais: 'Reino Unido',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Flag_of_the_United_Kingdom.svg/23px-Flag_of_the_United_Kingdom.svg.png',
        ddi: '+44'),
    45: CountryModel(
        id: 45,
        pais: 'Dinamarca',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Flag_of_Denmark.svg/20px-Flag_of_Denmark.svg.png',
        ddi: '+45'),
    46: CountryModel(
        id: 46,
        pais: 'Suécia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Flag_of_Sweden.svg/23px-Flag_of_Sweden.svg.png',
        ddi: '+46'),
    47: CountryModel(
        id: 47,
        pais: 'Noruega',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Norway.svg/21px-Flag_of_Norway.svg.png',
        ddi: '+47'),
    48: CountryModel(
        id: 48,
        pais: 'Polônia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Flag_of_Poland.svg/23px-Flag_of_Poland.svg.png',
        ddi: '+48'),
    49: CountryModel(
        id: 49,
        pais: 'Alemanha',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/23px-Flag_of_Germany.svg.png',
        ddi: '+49'),
    51: CountryModel(
        id: 51,
        pais: 'Peru',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Flag_of_Peru.svg/23px-Flag_of_Peru.svg.png',
        ddi: '+51'),
    52: CountryModel(
        id: 52,
        pais: 'México',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Flag_of_Mexico.svg/23px-Flag_of_Mexico.svg.png',
        ddi: '+52'),
    53: CountryModel(
        id: 53,
        pais: 'Cuba',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Flag_of_Cuba.svg/23px-Flag_of_Cuba.svg.png',
        ddi: '+53'),
    54: CountryModel(
        id: 54,
        pais: 'Argentina',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_Argentina.svg/23px-Flag_of_Argentina.svg.png',
        ddi: '+54'),
    55: CountryModel(
        id: 55,
        pais: 'Brasil',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/22px-Flag_of_Brazil.svg.png',
        ddi: '+55'),
    56: CountryModel(
        id: 56,
        pais: 'Chile',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Flag_of_Chile.svg/23px-Flag_of_Chile.svg.png',
        ddi: '+56'),
    57: CountryModel(
        id: 57,
        pais: 'Colômbia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Colombia.svg/23px-Flag_of_Colombia.svg.png',
        ddi: '+57'),
    58: CountryModel(
        id: 58,
        pais: 'Venezuela',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Flag_of_Venezuela.svg/23px-Flag_of_Venezuela.svg.png',
        ddi: '+58'),
    60: CountryModel(
        id: 60,
        pais: 'Malásia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Flag_of_Malaysia.svg/23px-Flag_of_Malaysia.svg.png',
        ddi: '+60'),
    61: CountryModel(
        id: 61,
        pais: 'Austrália',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Flag_of_Australia.svg/23px-Flag_of_Australia.svg.png',
        ddi: '+61'),
    62: CountryModel(
        id: 62,
        pais: 'Indonésia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Flag_of_Indonesia.svg/23px-Flag_of_Indonesia.svg.png',
        ddi: '+62'),
    63: CountryModel(
        id: 63,
        pais: 'Filipinas',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Flag_of_the_Philippines.svg/23px-Flag_of_the_Philippines.svg.png',
        ddi: '+63'),
    64: CountryModel(
        id: 64,
        pais: 'Nova Zelândia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Flag_of_New_Zealand.svg/23px-Flag_of_New_Zealand.svg.png',
        ddi: '+64'),
    65: CountryModel(
        id: 65,
        pais: 'Singapura',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Flag_of_Singapore.svg/23px-Flag_of_Singapore.svg.png',
        ddi: '+65'),
    66: CountryModel(
        id: 66,
        pais: 'Tailândia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_Thailand.svg/23px-Flag_of_Thailand.svg.png',
        ddi: '+66'),
    81: CountryModel(
        id: 81,
        pais: 'Japão',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Flag_of_Japan.svg/23px-Flag_of_Japan.svg.png',
        ddi: '+81'),
    82: CountryModel(
        id: 82,
        pais: 'Coreia do Sul',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/23px-Flag_of_South_Korea.svg.png',
        ddi: '+82'),
    84: CountryModel(
        id: 84,
        pais: 'Vietnã',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Vietnam.svg/23px-Flag_of_Vietnam.svg.png',
        ddi: '+84'),
    86: CountryModel(
        id: 86,
        pais: 'República Popular da China',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/23px-Flag_of_the_People%27s_Republic_of_China.svg.png',
        ddi: '+86'),
    90: CountryModel(
        id: 90,
        pais: 'Turquia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Flag_of_Turkey.svg/23px-Flag_of_Turkey.svg.png',
        ddi: '+90'),
    91: CountryModel(
        id: 91,
        pais: 'Índia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Flag_of_India.svg/23px-Flag_of_India.svg.png',
        ddi: '+91'),
    92: CountryModel(
        id: 92,
        pais: 'Paquistão',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Flag_of_Pakistan.svg/23px-Flag_of_Pakistan.svg.png',
        ddi: '+92'),
    93: CountryModel(
        id: 93,
        pais: 'Afeganistão',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Afghanistan.svg/23px-Flag_of_Afghanistan.svg.png',
        ddi: '+93'),
    94: CountryModel(
        id: 94,
        pais: 'Sri Lanka',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Flag_of_Sri_Lanka.svg/23px-Flag_of_Sri_Lanka.svg.png',
        ddi: '+94'),
    95: CountryModel(
        id: 95,
        pais: 'Myanmar',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Flag_of_Myanmar.svg/23px-Flag_of_Myanmar.svg.png',
        ddi: '+95'),
    98: CountryModel(
        id: 98,
        pais: 'Irã',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Flag_of_Iran.svg/23px-Flag_of_Iran.svg.png',
        ddi: '+98'),
    211: CountryModel(
        id: 211,
        pais: 'Sudão do Sul',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Flag_of_South_Sudan.svg/23px-Flag_of_South_Sudan.svg.png',
        ddi: '+211'),
    212: CountryModel(
        id: 212,
        pais: 'Saara Ocidental',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Flag_of_the_Sahrawi_Arab_Democratic_Republic.svg/23px-Flag_of_the_Sahrawi_Arab_Democratic_Republic.svg.png',
        ddi: '+212'),
    213: CountryModel(
        id: 213,
        pais: 'Argélia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Flag_of_Algeria.svg/23px-Flag_of_Algeria.svg.png',
        ddi: '+213'),
    216: CountryModel(
        id: 216,
        pais: 'Tunísia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Flag_of_Tunisia.svg/23px-Flag_of_Tunisia.svg.png',
        ddi: '+216'),
    218: CountryModel(
        id: 218,
        pais: 'Líbia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Libya.svg/23px-Flag_of_Libya.svg.png',
        ddi: '+218'),
    220: CountryModel(
        id: 220,
        pais: 'Gâmbia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Flag_of_The_Gambia.svg/23px-Flag_of_The_Gambia.svg.png',
        ddi: '+220'),
    221: CountryModel(
        id: 221,
        pais: 'Senegal',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Flag_of_Senegal.svg/23px-Flag_of_Senegal.svg.png',
        ddi: '+221'),
    222: CountryModel(
        id: 222,
        pais: 'Mauritânia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Flag_of_Mauritania.svg/23px-Flag_of_Mauritania.svg.png',
        ddi: '+222'),
    223: CountryModel(
        id: 223,
        pais: 'Mali',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Flag_of_Mali.svg/23px-Flag_of_Mali.svg.png',
        ddi: '+223'),
    224: CountryModel(
        id: 224,
        pais: 'Guiné',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Flag_of_Guinea.svg/23px-Flag_of_Guinea.svg.png',
        ddi: '+224'),
    225: CountryModel(
        id: 225,
        pais: 'Costa do Marfim',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_C%C3%B4te_d%27Ivoire.svg/23px-Flag_of_C%C3%B4te_d%27Ivoire.svg.png',
        ddi: '+225'),
    226: CountryModel(
        id: 226,
        pais: 'Burkina Faso',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Flag_of_Burkina_Faso.svg/23px-Flag_of_Burkina_Faso.svg.png',
        ddi: '+226'),
    227: CountryModel(
        id: 227,
        pais: 'Níger',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Flag_of_Niger.svg/18px-Flag_of_Niger.svg.png',
        ddi: '+227'),
    228: CountryModel(
        id: 228,
        pais: 'Togo',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Flag_of_Togo.svg/23px-Flag_of_Togo.svg.png',
        ddi: '+228'),
    229: CountryModel(
        id: 229,
        pais: 'Benim',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Flag_of_Benin.svg/23px-Flag_of_Benin.svg.png',
        ddi: '+229'),
    230: CountryModel(
        id: 230,
        pais: 'Maurícia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Flag_of_Mauritius.svg/23px-Flag_of_Mauritius.svg.png',
        ddi: '+230'),
    231: CountryModel(
        id: 231,
        pais: 'Libéria',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Flag_of_Liberia.svg/23px-Flag_of_Liberia.svg.png',
        ddi: '+231'),
    232: CountryModel(
        id: 232,
        pais: 'Serra Leoa',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Flag_of_Sierra_Leone.svg/23px-Flag_of_Sierra_Leone.svg.png',
        ddi: '+232'),
    233: CountryModel(
        id: 233,
        pais: 'Gana',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Flag_of_Ghana.svg/23px-Flag_of_Ghana.svg.png',
        ddi: '+233'),
    234: CountryModel(
        id: 234,
        pais: 'Nigéria',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flag_of_Nigeria.svg/23px-Flag_of_Nigeria.svg.png',
        ddi: '+234'),
    235: CountryModel(
        id: 235,
        pais: 'Chade',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Flag_of_Chad.svg/23px-Flag_of_Chad.svg.png',
        ddi: '+235'),
    236: CountryModel(
        id: 236,
        pais: 'República CentroAfricana',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Flag_of_the_Central_African_Republic.svg/23px-Flag_of_the_Central_African_Republic.svg.png',
        ddi: '+236'),
    237: CountryModel(
        id: 237,
        pais: 'Camarões',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Flag_of_Cameroon.svg/23px-Flag_of_Cameroon.svg.png',
        ddi: '+237'),
    238: CountryModel(
        id: 238,
        pais: 'Cabo Verde',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Flag_of_Cape_Verde.svg/23px-Flag_of_Cape_Verde.svg.png',
        ddi: '+238'),
    239: CountryModel(
        id: 239,
        pais: 'São Tomé e Príncipe',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Flag_of_Sao_Tome_and_Principe.svg/23px-Flag_of_Sao_Tome_and_Principe.svg.png',
        ddi: '+239'),
    240: CountryModel(
        id: 240,
        pais: 'Guiné Equatorial',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Flag_of_Equatorial_Guinea.svg/23px-Flag_of_Equatorial_Guinea.svg.png',
        ddi: '+240'),
    241: CountryModel(
        id: 241,
        pais: 'Gabão',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Flag_of_Gabon.svg/20px-Flag_of_Gabon.svg.png',
        ddi: '+241'),
    242: CountryModel(
        id: 242,
        pais: 'CongoBrazzaville',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Flag_of_the_Republic_of_the_Congo.svg/23px-Flag_of_the_Republic_of_the_Congo.svg.png',
        ddi: '+242'),
    243: CountryModel(
        id: 243,
        pais: 'CongoKinshasa',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Flag_of_the_Democratic_Republic_of_the_Congo.svg/20px-Flag_of_the_Democratic_Republic_of_the_Congo.svg.png',
        ddi: '+243'),
    244: CountryModel(
        id: 244,
        pais: 'Angola',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Flag_of_Angola.svg/23px-Flag_of_Angola.svg.png',
        ddi: '+244'),
    245: CountryModel(
        id: 245,
        pais: 'GuinéBissau',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Flag_of_Guinea-Bissau.svg/23px-Flag_of_Guinea-Bissau.svg.png',
        ddi: '+245'),
    246: CountryModel(
        id: 246,
        pais: 'Território Britânico do Oceano Índico',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_the_Commissioner_of_the_British_Indian_Ocean_Territory.svg/23px-Flag_of_the_Commissioner_of_the_British_Indian_Ocean_Territory.svg.png',
        ddi: '+246'),
    247: CountryModel(id: 247, pais: 'Ascensão', img: 'Ascensão', ddi: '+247'),
    248: CountryModel(
        id: 248,
        pais: 'Seicheles',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Flag_of_Seychelles.svg/23px-Flag_of_Seychelles.svg.png',
        ddi: '+248'),
    249: CountryModel(
        id: 249,
        pais: 'Sudão',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Flag_of_Sudan.svg/23px-Flag_of_Sudan.svg.png',
        ddi: '+249'),
    250: CountryModel(
        id: 250,
        pais: 'Ruanda',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Flag_of_Rwanda.svg/23px-Flag_of_Rwanda.svg.png',
        ddi: '+250'),
    251: CountryModel(
        id: 251,
        pais: 'Etiópia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Flag_of_Ethiopia.svg/23px-Flag_of_Ethiopia.svg.png',
        ddi: '+251'),
    252: CountryModel(
        id: 252,
        pais: 'Somália',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Flag_of_Somalia.svg/23px-Flag_of_Somalia.svg.png',
        ddi: '+252'),
    253: CountryModel(
        id: 253,
        pais: 'Djibuti',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Flag_of_Djibouti.svg/23px-Flag_of_Djibouti.svg.png',
        ddi: '+253'),
    254: CountryModel(
        id: 254,
        pais: 'Quênia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Flag_of_Kenya.svg/23px-Flag_of_Kenya.svg.png',
        ddi: '+254'),
    255: CountryModel(
        id: 255,
        pais: 'Tanzânia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Flag_of_Tanzania.svg/23px-Flag_of_Tanzania.svg.png',
        ddi: '+255'),
    256: CountryModel(
        id: 256,
        pais: 'Uganda',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Flag_of_Uganda.svg/23px-Flag_of_Uganda.svg.png',
        ddi: '+256'),
    257: CountryModel(
        id: 257,
        pais: 'Burundi',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Flag_of_Burundi.svg/23px-Flag_of_Burundi.svg.png',
        ddi: '+257'),
    258: CountryModel(
        id: 258,
        pais: 'Moçambique',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Flag_of_Mozambique.svg/23px-Flag_of_Mozambique.svg.png',
        ddi: '+258'),
    260: CountryModel(
        id: 260,
        pais: 'Zâmbia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Flag_of_Zambia.svg/23px-Flag_of_Zambia.svg.png',
        ddi: '+260'),
    261: CountryModel(
        id: 261,
        pais: 'Madagascar',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Flag_of_Madagascar.svg/23px-Flag_of_Madagascar.svg.png',
        ddi: '+261'),
    262: CountryModel(
        id: 262,
        pais: 'Reunião',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/23px-Flag_of_France.svg.png',
        ddi: '+262'),
    263: CountryModel(
        id: 263,
        pais: 'Zimbábue',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Flag_of_Zimbabwe.svg/23px-Flag_of_Zimbabwe.svg.png',
        ddi: '+263'),
    264: CountryModel(
        id: 264,
        pais: 'Namíbia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Flag_of_Namibia.svg/23px-Flag_of_Namibia.svg.png',
        ddi: '+264'),
    265: CountryModel(
        id: 265,
        pais: 'Malawi',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Flag_of_Malawi.svg/23px-Flag_of_Malawi.svg.png',
        ddi: '+265'),
    266: CountryModel(
        id: 266,
        pais: 'Lesoto',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Flag_of_Lesotho.svg/23px-Flag_of_Lesotho.svg.png',
        ddi: '+266'),
    267: CountryModel(
        id: 267,
        pais: 'Botswana',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_Botswana.svg/23px-Flag_of_Botswana.svg.png',
        ddi: '+267'),
    268: CountryModel(
        id: 268,
        pais: 'Suazilândia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Flag_of_Eswatini.svg/23px-Flag_of_Eswatini.svg.png',
        ddi: '+268'),
    269: CountryModel(
        id: 269,
        pais: 'Mayotte',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/23px-Flag_of_France.svg.png',
        ddi: '+269'),
    290: CountryModel(
        id: 290,
        pais: 'Santa Helena território',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Flag_of_Saint_Helena.svg/23px-Flag_of_Saint_Helena.svg.png',
        ddi: '+290'),
    291: CountryModel(
        id: 291,
        pais: 'Eritreia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Flag_of_Eritrea.svg/23px-Flag_of_Eritrea.svg.png',
        ddi: '+291'),
    297: CountryModel(
        id: 297,
        pais: 'Aruba',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Flag_of_Aruba.svg/23px-Flag_of_Aruba.svg.png',
        ddi: '+297'),
    298: CountryModel(
        id: 298,
        pais: 'Ilhas Féroe',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Flag_of_the_Faroe_Islands.svg/21px-Flag_of_the_Faroe_Islands.svg.png',
        ddi: '+298'),
    299: CountryModel(
        id: 299,
        pais: 'Groenlândia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_Greenland.svg/23px-Flag_of_Greenland.svg.png',
        ddi: '+299'),
    350: CountryModel(
        id: 350,
        pais: 'Gibraltar',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Flag_of_Gibraltar.svg/23px-Flag_of_Gibraltar.svg.png',
        ddi: '+350'),
    351: CountryModel(
        id: 351,
        pais: 'Portugal',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/23px-Flag_of_Portugal.svg.png',
        ddi: '+351'),
    352: CountryModel(
        id: 352,
        pais: 'Luxemburgo',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Flag_of_Luxembourg.svg/23px-Flag_of_Luxembourg.svg.png',
        ddi: '+352'),
    353: CountryModel(
        id: 353,
        pais: 'Irlanda',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Flag_of_Ireland.svg/23px-Flag_of_Ireland.svg.png',
        ddi: '+353'),
    354: CountryModel(
        id: 354,
        pais: 'Islândia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Flag_of_Iceland.svg/21px-Flag_of_Iceland.svg.png',
        ddi: '+354'),
    355: CountryModel(
        id: 355,
        pais: 'Albânia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Flag_of_Albania.svg/21px-Flag_of_Albania.svg.png',
        ddi: '+355'),
    356: CountryModel(
        id: 356,
        pais: 'Malta',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Flag_of_Malta.svg/23px-Flag_of_Malta.svg.png',
        ddi: '+356'),
    357: CountryModel(
        id: 357,
        pais: 'Chipre',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Flag_of_Cyprus.svg/23px-Flag_of_Cyprus.svg.png',
        ddi: '+357'),
    358: CountryModel(
        id: 358,
        pais: 'Finlândia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Flag_of_Finland.svg/23px-Flag_of_Finland.svg.png',
        ddi: '+358'),
    359: CountryModel(
        id: 359,
        pais: 'Bulgária',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Bulgaria.svg/23px-Flag_of_Bulgaria.svg.png',
        ddi: '+359'),
    370: CountryModel(
        id: 370,
        pais: 'Lituânia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Flag_of_Lithuania.svg/23px-Flag_of_Lithuania.svg.png',
        ddi: '+370'),
    371: CountryModel(
        id: 371,
        pais: 'Letônia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Flag_of_Latvia.svg/23px-Flag_of_Latvia.svg.png',
        ddi: '+371'),
    372: CountryModel(
        id: 372,
        pais: 'Estónia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Flag_of_Estonia.svg/23px-Flag_of_Estonia.svg.png',
        ddi: '+372'),
    373: CountryModel(
        id: 373,
        pais: 'Moldávia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Flag_of_Moldova.svg/23px-Flag_of_Moldova.svg.png',
        ddi: '+373'),
    374: CountryModel(
        id: 374,
        pais: 'Armênia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Flag_of_Armenia.svg/23px-Flag_of_Armenia.svg.png',
        ddi: '+374'),
    375: CountryModel(
        id: 375,
        pais: 'Bielorrússia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Flag_of_Belarus.svg/23px-Flag_of_Belarus.svg.png',
        ddi: '+375'),
    376: CountryModel(
        id: 376,
        pais: 'Andorra',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Flag_of_Andorra.svg/22px-Flag_of_Andorra.svg.png',
        ddi: '+376'),
    377: CountryModel(
        id: 377,
        pais: 'Mônaco',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Flag_of_Monaco.svg/19px-Flag_of_Monaco.svg.png',
        ddi: '+377'),
    378: CountryModel(
        id: 378,
        pais: 'São Marinho',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Flag_of_San_Marino.svg/20px-Flag_of_San_Marino.svg.png',
        ddi: '+378'),
    379: CountryModel(
        id: 379,
        pais: 'Vaticano',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Flag_of_the_Vatican_City.svg/15px-Flag_of_the_Vatican_City.svg.png',
        ddi: '+379'),
    380: CountryModel(
        id: 380,
        pais: 'Ucrânia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Flag_of_Ukraine.svg/23px-Flag_of_Ukraine.svg.png',
        ddi: '+380'),
    381: CountryModel(
        id: 381,
        pais: 'Sérvia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Flag_of_Serbia.svg/23px-Flag_of_Serbia.svg.png',
        ddi: '+381'),
    382: CountryModel(
        id: 382,
        pais: 'Montenegro',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Flag_of_Montenegro.svg/23px-Flag_of_Montenegro.svg.png',
        ddi: '+382'),
    383: CountryModel(
        id: 383,
        pais: 'Kosovo',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Flag_of_Kosovo.svg/21px-Flag_of_Kosovo.svg.png',
        ddi: '+383'),
    385: CountryModel(
        id: 385,
        pais: 'Croácia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Flag_of_Croatia.svg/23px-Flag_of_Croatia.svg.png',
        ddi: '+385'),
    386: CountryModel(
        id: 386,
        pais: 'Eslovénia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Flag_of_Slovenia.svg/23px-Flag_of_Slovenia.svg.png',
        ddi: '+386'),
    387: CountryModel(
        id: 387,
        pais: 'Bósnia e Herzegovina',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Flag_of_Bosnia_and_Herzegovina.svg/23px-Flag_of_Bosnia_and_Herzegovina.svg.png',
        ddi: '+387'),
    389: CountryModel(
        id: 389,
        pais: 'República da Macedônia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flag_of_North_Macedonia.svg/23px-Flag_of_North_Macedonia.svg.png',
        ddi: '+389'),
    420: CountryModel(
        id: 420,
        pais: 'República Tcheca',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_Czech_Republic.svg/23px-Flag_of_the_Czech_Republic.svg.png',
        ddi: '+420'),
    421: CountryModel(
        id: 421,
        pais: 'Eslováquia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Flag_of_Slovakia.svg/23px-Flag_of_Slovakia.svg.png',
        ddi: '+421'),
    423: CountryModel(
        id: 423,
        pais: 'Liechtenstein',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Flag_of_Liechtenstein.svg/23px-Flag_of_Liechtenstein.svg.png',
        ddi: '+423'),
    500: CountryModel(
        id: 500,
        pais: 'Ilhas Malvinas',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Flag_of_the_Falkland_Islands.svg/23px-Flag_of_the_Falkland_Islands.svg.png',
        ddi: '+500'),
    501: CountryModel(
        id: 501,
        pais: 'Belize',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Flag_of_Belize.svg/23px-Flag_of_Belize.svg.png',
        ddi: '+501'),
    502: CountryModel(
        id: 502,
        pais: 'Guatemala',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Flag_of_Guatemala.svg/23px-Flag_of_Guatemala.svg.png',
        ddi: '+502'),
    503: CountryModel(
        id: 503,
        pais: 'El Salvador',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Flag_of_El_Salvador.svg/23px-Flag_of_El_Salvador.svg.png',
        ddi: '+503'),
    504: CountryModel(
        id: 504,
        pais: 'Honduras',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flag_of_Honduras_%282008_Olympics%29.svg/23px-Flag_of_Honduras_%282008_Olympics%29.svg.png',
        ddi: '+504'),
    505: CountryModel(
        id: 505,
        pais: 'Nicarágua',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Flag_of_Nicaragua.svg/23px-Flag_of_Nicaragua.svg.png',
        ddi: '+505'),
    506: CountryModel(
        id: 506,
        pais: 'Costa Rica',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Flag_of_Costa_Rica.svg/23px-Flag_of_Costa_Rica.svg.png',
        ddi: '+506'),
    507: CountryModel(
        id: 507,
        pais: 'Panamá',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Flag_of_Panama.svg/23px-Flag_of_Panama.svg.png',
        ddi: '+507'),
    508: CountryModel(
        id: 508,
        pais: 'SaintPierre e Miquelon',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/23px-Flag_of_France.svg.png',
        ddi: '+508'),
    509: CountryModel(
        id: 509,
        pais: 'Haiti',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Flag_of_Haiti.svg/23px-Flag_of_Haiti.svg.png',
        ddi: '+509'),
    590: CountryModel(
        id: 590,
        pais: 'Guadalupe',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/23px-Flag_of_France.svg.png',
        ddi: '+590'),
    591: CountryModel(
        id: 591,
        pais: 'Bolívia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Flag_of_Bolivia.svg/22px-Flag_of_Bolivia.svg.png',
        ddi: '+591'),
    592: CountryModel(
        id: 592,
        pais: 'Guiana',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Flag_of_Guyana.svg/23px-Flag_of_Guyana.svg.png',
        ddi: '+592'),
    593: CountryModel(
        id: 593,
        pais: 'Equador',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Flag_of_Ecuador.svg/23px-Flag_of_Ecuador.svg.png',
        ddi: '+593'),
    594: CountryModel(
        id: 594,
        pais: 'Guiana Francesa',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Flag_of_French_Guiana.svg/23px-Flag_of_French_Guiana.svg.png',
        ddi: '+594'),
    595: CountryModel(
        id: 595,
        pais: 'Paraguai',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Flag_of_Paraguay.svg/23px-Flag_of_Paraguay.svg.png',
        ddi: '+595'),
    596: CountryModel(
        id: 596,
        pais: 'Martinica',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/23px-Flag_of_France.svg.png',
        ddi: '+596'),
    597: CountryModel(
        id: 597,
        pais: 'Suriname',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Flag_of_Suriname.svg/23px-Flag_of_Suriname.svg.png',
        ddi: '+597'),
    598: CountryModel(
        id: 598,
        pais: 'Uruguai',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Uruguay.svg/23px-Flag_of_Uruguay.svg.png',
        ddi: '+598'),
    599: CountryModel(
        id: 599,
        pais: 'Antilhas Holandesas',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Flag_of_the_Netherlands_Antilles_%281986%E2%80%932010%29.svg/23px-Flag_of_the_Netherlands_Antilles_%281986%E2%80%932010%29.svg.png',
        ddi: '+599'),
    670: CountryModel(
        id: 670,
        pais: 'TimorLeste',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Flag_of_East_Timor.svg/23px-Flag_of_East_Timor.svg.png',
        ddi: '+670'),
    672: CountryModel(
        id: 672,
        pais: 'Ilha Norfolk',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Flag_of_Norfolk_Island.svg/23px-Flag_of_Norfolk_Island.svg.png',
        ddi: '+672'),
    673: CountryModel(
        id: 673,
        pais: 'Brunei',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Flag_of_Brunei.svg/23px-Flag_of_Brunei.svg.png',
        ddi: '+673'),
    674: CountryModel(
        id: 674,
        pais: 'Nauru',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Flag_of_Nauru.svg/23px-Flag_of_Nauru.svg.png',
        ddi: '+674'),
    675: CountryModel(
        id: 675,
        pais: 'PapuaNova Guiné',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Flag_of_Papua_New_Guinea.svg/20px-Flag_of_Papua_New_Guinea.svg.png',
        ddi: '+675'),
    676: CountryModel(
        id: 676,
        pais: 'Tonga',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Tonga.svg/23px-Flag_of_Tonga.svg.png',
        ddi: '+676'),
    677: CountryModel(
        id: 677,
        pais: 'Ilhas Salomão',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Flag_of_the_Solomon_Islands.svg/23px-Flag_of_the_Solomon_Islands.svg.png',
        ddi: '+677'),
    678: CountryModel(
        id: 678,
        pais: 'Vanuatu',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Flag_of_Vanuatu.svg/23px-Flag_of_Vanuatu.svg.png',
        ddi: '+678'),
    679: CountryModel(
        id: 679,
        pais: 'Fiji',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Fiji.svg/23px-Flag_of_Fiji.svg.png',
        ddi: '+679'),
    680: CountryModel(
        id: 680,
        pais: 'Palau',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Flag_of_Palau.svg/23px-Flag_of_Palau.svg.png',
        ddi: '+680'),
    681: CountryModel(
        id: 681,
        pais: 'Wallis e Futuna',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/23px-Flag_of_France.svg.png',
        ddi: '+681'),
    682: CountryModel(
        id: 682,
        pais: 'Ilhas Cook',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Flag_of_the_Cook_Islands.svg/23px-Flag_of_the_Cook_Islands.svg.png',
        ddi: '+682'),
    683: CountryModel(
        id: 683,
        pais: 'Niue',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Flag_of_Niue.svg/23px-Flag_of_Niue.svg.png',
        ddi: '+683'),
    685: CountryModel(
        id: 685,
        pais: 'Samoa',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Flag_of_Samoa.svg/23px-Flag_of_Samoa.svg.png',
        ddi: '+685'),
    686: CountryModel(
        id: 686,
        pais: 'Kiribati',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Flag_of_Kiribati.svg/23px-Flag_of_Kiribati.svg.png',
        ddi: '+686'),
    687: CountryModel(
        id: 687,
        pais: 'Nova Caledônia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Flags_of_New_Caledonia.svg/40px-Flags_of_New_Caledonia.svg.png',
        ddi: '+687'),
    688: CountryModel(
        id: 688,
        pais: 'Tuvalu',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Flag_of_Tuvalu.svg/23px-Flag_of_Tuvalu.svg.png',
        ddi: '+688'),
    689: CountryModel(
        id: 689,
        pais: 'Polinésia Francesa',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Flag_of_French_Polynesia.svg/23px-Flag_of_French_Polynesia.svg.png',
        ddi: '+689'),
    690: CountryModel(
        id: 690,
        pais: 'Tokelau',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Flag_of_Tokelau.svg/23px-Flag_of_Tokelau.svg.png',
        ddi: '+690'),
    691: CountryModel(
        id: 691,
        pais: 'Estados Federados da Micronésia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Flag_of_the_Federated_States_of_Micronesia.svg/23px-Flag_of_the_Federated_States_of_Micronesia.svg.png',
        ddi: '+691'),
    692: CountryModel(
        id: 692,
        pais: 'Ilhas Marshall',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Flag_of_the_Marshall_Islands.svg/23px-Flag_of_the_Marshall_Islands.svg.png',
        ddi: '+692'),
    850: CountryModel(
        id: 850,
        pais: 'Coreia do Norte',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Flag_of_North_Korea.svg/23px-Flag_of_North_Korea.svg.png',
        ddi: '+850'),
    852: CountryModel(
        id: 852,
        pais: 'Hong Kong',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Flag_of_Hong_Kong.svg/23px-Flag_of_Hong_Kong.svg.png',
        ddi: '+852'),
    853: CountryModel(
        id: 853,
        pais: 'Macau',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Flag_of_Macau.svg/23px-Flag_of_Macau.svg.png',
        ddi: '+853'),
    855: CountryModel(
        id: 855,
        pais: 'Camboja',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Flag_of_Cambodia.svg/23px-Flag_of_Cambodia.svg.png',
        ddi: '+855'),
    856: CountryModel(
        id: 856,
        pais: 'Laos',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Flag_of_Laos.svg/23px-Flag_of_Laos.svg.png',
        ddi: '+856'),
    880: CountryModel(
        id: 880,
        pais: 'Bangladesh',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Flag_of_Bangladesh.svg/23px-Flag_of_Bangladesh.svg.png',
        ddi: '+880'),
    886: CountryModel(
        id: 886,
        pais: 'República da China',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Flag_of_the_Republic_of_China.svg/23px-Flag_of_the_Republic_of_China.svg.png',
        ddi: '+886'),
    960: CountryModel(
        id: 960,
        pais: 'Maldivas',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Flag_of_Maldives.svg/23px-Flag_of_Maldives.svg.png',
        ddi: '+960'),
    961: CountryModel(
        id: 961,
        pais: 'Líbano',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Flag_of_Lebanon.svg/23px-Flag_of_Lebanon.svg.png',
        ddi: '+961'),
    962: CountryModel(
        id: 962,
        pais: 'Jordânia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Flag_of_Jordan.svg/23px-Flag_of_Jordan.svg.png',
        ddi: '+962'),
    963: CountryModel(
        id: 963,
        pais: 'Síria',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Flag_of_Syria.svg/23px-Flag_of_Syria.svg.png',
        ddi: '+963'),
    964: CountryModel(
        id: 964,
        pais: 'Iraque',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Flag_of_Iraq.svg/23px-Flag_of_Iraq.svg.png',
        ddi: '+964'),
    965: CountryModel(
        id: 965,
        pais: 'Kuwait',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Flag_of_Kuwait.svg/23px-Flag_of_Kuwait.svg.png',
        ddi: '+965'),
    966: CountryModel(
        id: 966,
        pais: 'Arábia Saudita',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Flag_of_Saudi_Arabia.svg/23px-Flag_of_Saudi_Arabia.svg.png',
        ddi: '+966'),
    967: CountryModel(
        id: 967,
        pais: 'Iêmen',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Flag_of_Yemen.svg/23px-Flag_of_Yemen.svg.png',
        ddi: '+967'),
    968: CountryModel(
        id: 968,
        pais: 'Omã',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Flag_of_Oman.svg/23px-Flag_of_Oman.svg.png',
        ddi: '+968'),
    970: CountryModel(
        id: 970,
        pais: 'Palestina',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Flag_of_Palestine.svg/23px-Flag_of_Palestine.svg.png',
        ddi: '+970'),
    971: CountryModel(
        id: 971,
        pais: 'Emirados Árabes Unidos',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/23px-Flag_of_the_United_Arab_Emirates.svg.png',
        ddi: '+971'),
    972: CountryModel(
        id: 972,
        pais: 'Israel',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Flag_of_Israel.svg/21px-Flag_of_Israel.svg.png',
        ddi: '+972'),
    973: CountryModel(
        id: 973,
        pais: 'Bahrein',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Flag_of_Bahrain.svg/23px-Flag_of_Bahrain.svg.png',
        ddi: '+973'),
    974: CountryModel(
        id: 974,
        pais: 'Qatar',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_Qatar.svg/23px-Flag_of_Qatar.svg.png',
        ddi: '+974'),
    975: CountryModel(
        id: 975,
        pais: 'Butão',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Flag_of_Bhutan.svg/23px-Flag_of_Bhutan.svg.png',
        ddi: '+975'),
    976: CountryModel(
        id: 976,
        pais: 'Mongólia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Flag_of_Mongolia.svg/23px-Flag_of_Mongolia.svg.png',
        ddi: '+976'),
    977: CountryModel(
        id: 977,
        pais: 'Nepal',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Flag_of_Nepal.svg/12px-Flag_of_Nepal.svg.png',
        ddi: '+977'),
    992: CountryModel(
        id: 992,
        pais: 'Tadjiquistão',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Flag_of_Tajikistan.svg/23px-Flag_of_Tajikistan.svg.png',
        ddi: '+992'),
    993: CountryModel(
        id: 993,
        pais: 'Turquemenistão',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Flag_of_Turkmenistan.svg/23px-Flag_of_Turkmenistan.svg.png',
        ddi: '+993'),
    994: CountryModel(
        id: 994,
        pais: 'Azerbaijão',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Flag_of_Azerbaijan.svg/23px-Flag_of_Azerbaijan.svg.png',
        ddi: '+994'),
    995: CountryModel(
        id: 995,
        pais: 'Geórgia',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Flag_of_Georgia.svg/23px-Flag_of_Georgia.svg.png',
        ddi: '+995'),
    996: CountryModel(
        id: 996,
        pais: 'Quirguistão',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Flag_of_Kyrgyzstan.svg/23px-Flag_of_Kyrgyzstan.svg.png',
        ddi: '+996'),
    998: CountryModel(
      id: 998,
      pais: 'Uzbequistão',
      img:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Flag_of_Uzbekistan.svg/23px-Flag_of_Uzbekistan.svg.png',
      ddi: '+998',
    )
  };
}
