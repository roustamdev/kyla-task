class AppAssets {
  AppAssets._();
  static AppFonts fonts = AppFonts._();
  static AppImages images = AppImages._();
  static AppIcons icons = AppIcons._();
  static AppLotties lotties = AppLotties._();
}

class AppFonts {
  AppFonts._();
  final String worksans = 'Worksans';
}

class AppImages {
  AppImages._();
  final String logo = 'assets/images/logo.png';
  final String logoWhite = 'assets/images/logo_white.png';
}

class AppIcons {
  AppIcons._();
  final String logo = 'assets/icons/logo.svg';
  final String logoWhite = 'assets/icons/logo_white.svg';
}

class AppLotties {
  AppLotties._();
  final String loading = 'assets/lotties/loading.json';
  final String empty = 'assets/lotties/empty.json';
  final String error = 'assets/lotties/error.json';
}
