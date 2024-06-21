/// Interface for managing bank accounts
abstract interface class AccountManager {
  void createAccount(String ownerName, double initialBalance);
  double getAccountBalance(String accountNumber);
}

/// Concrete implementation of account management
class BankAccountManager implements AccountManager {
  final Map<String, double> _accounts = {};

  @override
  void createAccount(String ownerName, double initialBalance) {
    final accountNumber = _generateAccountNumber();
    _accounts[accountNumber] = initialBalance;
    print(
        'Created account for $ownerName with initial balance $initialBalance. Account number: $accountNumber');
  }

  @override
  double getAccountBalance(String accountNumber) {
    if (_accounts.containsKey(accountNumber)) {
      return _accounts[accountNumber]!;
    } else {
      print('Account $accountNumber not found.');
      return 0.0;
    }
  }

  String _generateAccountNumber() {
    // Simplified account number generation for demonstration
    return 'ACC-${DateTime.now().millisecondsSinceEpoch}';
  }
}

/// Interface for managing transactions
abstract interface class TransactionManager {
  bool transfer(String fromAccount, String toAccount, double amount);
}

/// Concrete implementation of transaction management
class BankTransactionManager implements TransactionManager {
  final AccountManager _accountManager;

  BankTransactionManager(this._accountManager);

  @override
  bool transfer(String fromAccount, String toAccount, double amount) {
    final fromBalance = _accountManager.getAccountBalance(fromAccount);
    if (fromBalance >= amount) {
      _accountManager.createAccount(fromAccount, fromBalance - amount);
      _accountManager.createAccount(
          toAccount, _accountManager.getAccountBalance(toAccount) + amount);
      print(
          'Transferred $amount from account $fromAccount to account $toAccount.');
      return true;
    } else {
      print('Insufficient funds in account $fromAccount.');
      return false;
    }
  }
}

/// Interface for sending notifications
abstract interface class NotificationService {
  void sendNotification(String recipient, String message);
}

/// Concrete implementation of notification service
class EmailNotificationService implements NotificationService {
  @override
  void sendNotification(String recipient, String message) {
    print('Sending email to $recipient: $message');
  }
}

/// Banking facade that simplifies interaction for clients
class BankingFacade {
  final AccountManager _accountManager;
  final TransactionManager _transactionManager;
  final NotificationService _notificationService;

  BankingFacade()
      : _accountManager = BankAccountManager(),
        _transactionManager = BankTransactionManager(BankAccountManager()),
        _notificationService = EmailNotificationService();

  void createAccount(String ownerName, double initialBalance) {
    _accountManager.createAccount(ownerName, initialBalance);
  }

  bool transfer(String fromAccount, String toAccount, double amount) {
    final success =
        _transactionManager.transfer(fromAccount, toAccount, amount);
    if (success) {
      _notificationService.sendNotification(
          toAccount, 'You received $amount in your account.');
    }
    return success;
  }

  double getAccountBalance(String accountNumber) {
    return _accountManager.getAccountBalance(accountNumber);
  }
}

void main() {
  final bankingFacade = BankingFacade();

  bankingFacade.createAccount('Alice', 1000.0);
  bankingFacade.createAccount('Bob', 500.0);

  print('Initial balances:');
  print('Alice: ${bankingFacade.getAccountBalance('ACC-')}');
  print('Bob: ${bankingFacade.getAccountBalance('ACC-')}');

  print('Transferring 200 from Alice to Bob...');
  bankingFacade.transfer('ACC-', 'ACC-', 200.0);

  print('Updated balances:');
  print('Alice: ${bankingFacade.getAccountBalance('ACC-')}');
  print('Bob: ${bankingFacade.getAccountBalance('ACC-')}');
}
