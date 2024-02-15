//Todo: Check the email address validation extension

extension EmailValidation on String {
  bool isValidEmail() {
    return !RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(this);
  }
}
