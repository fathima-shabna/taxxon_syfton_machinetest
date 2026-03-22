import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/app_colors.dart';
import '../../auth/presentation/auth_provider.dart';
import '../domain/transaction_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context, ref),
            _buildFilterSection(context, ref),
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _buildVatSummaryCards(),
                    const SizedBox(height: 16),
                    Expanded(child: _buildTransactionList()),
                    const SizedBox(height: 16),
                    _buildActionButtons(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Text(
                  'Syfton Innovations',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white, size: 28),
            onPressed: () => _showLogoutDialog(context, ref),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(authControllerProvider.notifier).logout();
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(BuildContext context, WidgetRef ref) {
    return Container(
      color: const Color(0xFFF3F3F3),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                size: 18,
                color: Colors.black,
              ),
              const SizedBox(width: 8),
              const Text(
                '3rd Quarter 2025',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.keyboard_arrow_down, size: 20),
            ],
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Text(
              'Download',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            label: const Icon(
              Icons.file_download_outlined,
              color: AppColors.primary,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVatSummaryCards() {
    return Row(
      children: [
        _buildVatCard(
          'Input VAT',
          'AED 4000',
          'Total purchase\nAED 505000',
          AppColors.inputVatCard,
          AppColors.inputVatAmount,
          AppColors.inputVatSubtitle,
        ),
        const SizedBox(width: 8),
        _buildVatCard(
          'Output VAT',
          'AED 10000',
          'Total sales\nAED 625000',
          AppColors.outputVatCard,
          AppColors.outputVatAmount,
          AppColors.outputVatSubtitle,
        ),
        const SizedBox(width: 8),
        _buildVatCard(
          'VAT Payable',
          'AED 6000',
          'Due On\n28-08-2025',
          AppColors.vatPayableCard,
          AppColors.vatPayableAmount,
          AppColors.vatPayableSubtitle,
        ),
      ],
    );
  }

  Widget _buildVatCard(
    String title,
    String amount,
    String subtitle,
    Color bgColor,
    Color amountColor,
    Color subtitleColor,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              amount,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w900,
                color: amountColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(subtitle, style: TextStyle(fontSize: 8, color: subtitleColor)),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionList() {
    return ListView.separated(
      itemCount: mockTransactions.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final tx = mockTransactions[index];
        final bgColor = tx.isExpense ? AppColors.expenseBg : AppColors.salesBg;
        final amountColor = tx.isExpense
            ? AppColors.amountRed
            : AppColors.amountGreen;

        return Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx.supplierName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    'In NO: ${tx.invoiceNumber}',
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    tx.date,
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            _buildGridItem(
              tx.beforeTax.toStringAsFixed(2),
              bgColor,
              amountColor,
              'Before Tax',
            ),
            const SizedBox(width: 4),
            _buildGridItem(
              tx.afterTax.toStringAsFixed(2),
              bgColor,
              amountColor,
              'After Tax',
            ),
            const SizedBox(width: 4),
            _buildGridItem(
              tx.taxAmount.toStringAsFixed(2),
              bgColor,
              amountColor,
              'Tax Amount',
            ),
          ],
        );
      },
    );
  }

  Widget _buildGridItem(
    String value,
    Color bgColor,
    Color textColor,
    String label,
  ) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 8, color: AppColors.black),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            'Purchase',
            'Expense',
            AppColors.purchaseExpenseCard,
            Icons.add,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildActionButton(
            'Sales',
            '',
            AppColors.salesCard,
            Icons.add,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(
    String title,
    String subtitle,
    Color color,
    IconData icon,
  ) {
    return Container(
      height: 60, // Fixed height for both cards
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:
                MainAxisAlignment.center, // Center text vertically
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white70, fontSize: 10),
                ),
              if (subtitle.isEmpty)
                const SizedBox(height: 12), 
            ],
          ),
          Icon(icon, color: Colors.white, size: 24),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/home.png', width: 24, height: 24),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/account-circle-outline.png',
            width: 24,
            height: 24,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
