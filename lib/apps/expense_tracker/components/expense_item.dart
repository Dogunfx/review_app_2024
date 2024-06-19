import 'package:flutter/material.dart';
import 'package:review_app_2024/apps/expense_tracker/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;

  @override
  const ExpenseItem({super.key, required this.expense});

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Row(children: [
              Text("\$ ${expense.amount.toStringAsFixed(2)}"),
              const Spacer(),
              Row(
                children: [
                  Icon(CategoryIcons[expense.category]),
                  const SizedBox(width: 8),
                  Text(expense.formattedDate),
                ],
              )
            ]),
          ],
        ),
      ),
    );
  }
}
