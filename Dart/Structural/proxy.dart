/// Interface representing bank account operations
abstract interface class BankAccount {
  String getAccountNumber();
}

/// Concrete implementation of bank account operations
class RealBankAccount implements BankAccount {
  RealBankAccount({required this.accountNumber});

  final String accountNumber;

  @override
  String getAccountNumber() {
    // Simulating retrieval of sensitive data from a secure source
    print('Fetching bank account number...');
    return accountNumber;
  }
}

/// Proxy class to control access to sensitive bank account information
class BankAccountProxy implements BankAccount {
  BankAccountProxy({required this.realBankAccount, required this.userRole});

  final RealBankAccount realBankAccount;
  final String userRole;
  bool allowAccess = false;

  @override
  String getAccountNumber() {
    if (userRole == 'manager' || allowAccess) {
      print('Access granted. Fetching bank account number...');
      return realBankAccount.getAccountNumber();
    } else {
      throw Exception('Unauthorized access');
    }
  }

  void grantAccess() {
    allowAccess = true;
    print('Access granted by ${userRole}.');
  }

  void revokeAccess() {
    allowAccess = false;
    print('Access revoked by ${userRole}.');
  }
}

void main() {
  // Simulating a real bank account with a sensitive account number
  final realBankAccount = RealBankAccount(accountNumber: '1234567890');

  // Creating a proxy for the bank account
  final bankAccountProxy =
      BankAccountProxy(realBankAccount: realBankAccount, userRole: 'manager');

  // Attempt to access bank account number
  try {
    print('Attempting to access bank account number:');
    print(bankAccountProxy.getAccountNumber()); // Access denied initially
  } catch (e) {
    print('Error: ${e.toString()}');
  }

  // Grant access as a manager
  bankAccountProxy.grantAccess();

  // Now try to access bank account number again
  try {
    print('\nAttempting to access bank account number after access granted:');
    print(bankAccountProxy.getAccountNumber()); // Access granted
  } catch (e) {
    print('Error: ${e.toString()}');
  }

  // Revoking access
  bankAccountProxy.revokeAccess();

  // Try accessing again after access is revoked
  try {
    print('\nAttempting to access bank account number after access revoked:');
    print(bankAccountProxy.getAccountNumber()); // Access denied again
  } catch (e) {
    print('Error: ${e.toString()}');
  }

  /// Here is the expected result:
  /*
  Attempting to access bank account number:
  Error: Exception: Unauthorized access

  Access granted by manager.

  Attempting to access bank account number after access granted:
  Access granted. Fetching bank account number...
  Fetching bank account number...
  1234567890

  Access revoked by manager.

  Attempting to access bank account number after access revoked:
  Error: Exception: Unauthorized access
  */
}
