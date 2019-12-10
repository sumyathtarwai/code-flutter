void main() {
  var acc = BankAccount('A', 'ABC-1234', 500);
  acc
    ..owner = 'B'
    ..balance = 400
    ..deposit(200)
    ..withdraw(300);
  // print('Owner: ${acc.owner} Balance: ${acc.balance}');
  print(acc.toString());
}

class BankAccount {
  String owner, number;
  double balance;
  DateTime dateCreated, dateModified;

  BankAccount(this.owner, this.number, this.balance)
      : dateCreated = DateTime.now();

  void deposit(double amount) {
    balance += amount;
    print('deposit -> Balance: $balance');
    dateModified = DateTime.now();
  }

  void withdraw(double amount) {
    balance -= amount;
    print('withdraw -> Balance: $balance');
    dateModified = DateTime.now();
  }

  @override
  String toString() => 'Account $owner has $balance $dateModified';
}
