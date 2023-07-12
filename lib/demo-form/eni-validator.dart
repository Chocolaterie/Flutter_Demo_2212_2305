class EniValidator {

  static String? emailValidator(String? value) {
    // Erreur : Email doit être supérieur à 3 caracteres
    if (value!.length  < 4){
      return "Email doit être plus grand que 3";
    }

    // Erreur : Regex
    final bool emailValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if(!emailValid) {
      return "Le format de l'email est incorrecte";
    }

    return null;
  }

}