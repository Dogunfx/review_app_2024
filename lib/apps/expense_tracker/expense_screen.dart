import 'package:flutter/material.dart';
import 'package:review_app_2024/apps/expense_tracker/components/expenses_list.dart';
import 'package:review_app_2024/apps/expense_tracker/components/new_expense.dart';
import 'package:review_app_2024/apps/expense_tracker/models/expense.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesState();
}

class _ExpensesState extends State<ExpensesScreen> {
  final List<Expense> _registeredExpenses = [
    Expense(
      amount: 19.99,
      title: "Flutter Course",
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      amount: 50.69,
      title: "Cinema",
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return NewExpenseModal(
            onAddExpense: _addExpense,
          );
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${expense.title} Expense Deleted"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text("No Expense has been made"));

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses Tracker"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text("Chart"),
            Expanded(child: mainContent),
          ],
        ),
      ),
    );
  }
}
