/// Base prototype
abstract class Document {
  /// Common constructor
  Document({
    required this.title,
  });

  /// Common property
  final String title;

  /// Clone method
  Document clone();
}

/// Concrete Report prototype
class Report extends Document {
  /// Constructor
  Report({
    required String title,
    required this.content,
  }) : super(title: title);

  /// Concrete prototype properties
  final String content;

  /// Clone method
  @override
  Report clone() {
    return Report(
      title: this.title,
      content: this.content,
    );
  }
}

/// Concrete Invoice prototype
class Invoice extends Document {
  /// Constructor
  Invoice({
    required String title,
    required this.amount,
  }) : super(title: title);

  /// Concrete prototype properties
  final double amount;

  /// Clone method
  @override
  Invoice clone() {
    return Invoice(
      title: this.title,
      amount: this.amount,
    );
  }
}

void main() {
  final report = Report(
      title: 'Monthly Report',
      content: 'This is the content of the monthly report.');
  final reportClone = report.clone();

  final invoice = Invoice(title: 'Invoice #1234', amount: 2500.0);
  final invoiceClone = invoice.clone();

  print('''
--Original Report--
Title: ${report.title}
Content: ${report.content}
----------------------
---Clone Report---
Title: ${reportClone.title}
Content: ${reportClone.content}
----------------------

--Original Invoice--
Title: ${invoice.title}
Amount: ${invoice.amount}
----------------------
---Clone Invoice---
Title: ${invoiceClone.title}
Amount: ${invoiceClone.amount}
----------------------
''');

  /// Here is the result:
  /*
  --Original Report--
  Title: Monthly Report
  Content: This is the content of the monthly report.
  ----------------------
  ---Clone Report---
  Title: Monthly Report
  Content: This is the content of the monthly report.
  ----------------------

  --Original Invoice--
  Title: Invoice #1234
  Amount: 2500.0
  ----------------------
  ---Clone Invoice---
  Title: Invoice #1234
  Amount: 2500.0
  ----------------------
  */
}
