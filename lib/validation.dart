
  
  bool isValidName(String name) {
    // Basic name validation
    // This is a simple example, adjust based on your requirements
    return name.isNotEmpty;
  }

  bool isValidEmail(String email) {
    // Basic email validation
    // This is a simple example, you might want to use a more robust email validation logic
    return RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(email);
  }

  bool isValidPassword(String password) {
    // Basic password validation
    // This is a simple example, adjust based on your requirements
    return password.length >= 6;
  }
