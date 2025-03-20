enum Flavor{
  development,
  production,
  local
}


class AppConfig{

  static Flavor appFlavor = Flavor.production;
  static String get baseUrl {
    switch(appFlavor){
      case Flavor.development:
        return 'http://192.168.1.7:8080';
      case Flavor.production:
      return 'http://192.168.1.3:8080';
      case Flavor.local:
        return 'http://172.17.240.1:8080';
    }
  }

}