String? cekEmail(String? txt) {
    if (txt == null || txt.isEmpty) {
      return "Please Enter You Email";
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(txt)) {
      return "Email Not Valid";
    }
    return null;
  }

  String? cekPassword(String? txt) {
    if (txt == null || txt.isEmpty) {
      return "Please Enter Your Password";
    }
    return null;
  }