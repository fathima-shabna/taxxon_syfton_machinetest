class TransactionModel {
  final String supplierName;
  final String invoiceNumber;
  final String date;
  final double beforeTax;
  final double afterTax;
  final double taxAmount;
  final bool isExpense;

  TransactionModel({
    required this.supplierName,
    required this.invoiceNumber,
    required this.date,
    required this.beforeTax,
    required this.afterTax,
    required this.taxAmount,
    required this.isExpense,
  });
}

// Mock data to populate the list
final mockTransactions = [
  TransactionModel(
    supplierName: 'SKN Suppliers',
    invoiceNumber: '45982345',
    date: '23-02-2026',
    beforeTax: 4560.50,
    afterTax: 6560.50,
    taxAmount: 2000.00,
    isExpense: true,
  ),
  TransactionModel(
    supplierName: 'Abu Suppliers',
    invoiceNumber: '58965424',
    date: '20-02-2026',
    beforeTax: 5050.50,
    afterTax: 6000.50,
    taxAmount: 950.00,
    isExpense: true,
  ),
  TransactionModel(
    supplierName: 'ADP Enterprises',
    invoiceNumber: '87982310',
    date: '19-02-2026',
    beforeTax: 3570.50,
    afterTax: 4580.50,
    taxAmount: 1010.00,
    isExpense: false,
  ),
  TransactionModel(
    supplierName: 'Alhan Suppliers',
    invoiceNumber: '78956556',
    date: '14-02-2026',
    beforeTax: 4560.50,
    afterTax: 6560.50,
    taxAmount: 2000.00,
    isExpense: true,
  ),
  TransactionModel(
    supplierName: 'ADP Enterprises',
    invoiceNumber: '87982310',
    date: '12-02-2026',
    beforeTax: 3570.50,
    afterTax: 4580.50,
    taxAmount: 1010.00,
    isExpense: false,
  ),
  TransactionModel(
    supplierName: 'PNK Suppliers',
    invoiceNumber: '89585853',
    date: '10-02-2026',
    beforeTax: 3570.50,
    afterTax: 4580.50,
    taxAmount: 1010.00,
    isExpense: false,
  ),
];
