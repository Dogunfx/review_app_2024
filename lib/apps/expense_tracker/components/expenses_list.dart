import 'package:flutter/material.dart';
import 'package:review_app_2024/apps/expense_tracker/components/expense_item.dart';
import 'package:review_app_2024/apps/expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  @override
  Widget build(context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
              background: Container(
                color: Theme.of(context).colorScheme.error,
                margin: const EdgeInsets.symmetric(vertical: 14),
              ),
              key: ValueKey(expenses[index]),
              child: ExpenseItem(expense: expenses[index]),
              onDismissed: (direction) {
                onRemoveExpense(expenses[index]);
              },
            ));
  }
}
