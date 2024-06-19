import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:review_app_2024/apps/expense_tracker/models/expense.dart';

class NewExpenseModal extends StatefulWidget {
  final void Function(Expense expense) onAddExpense;
  const NewExpenseModal({super.key, required this.onAddExpense});

  @override
  State<NewExpenseModal> createState() => _NewExpenseModalState();
}

class _NewExpenseModalState extends State<NewExpenseModal> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month - 1, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate ?? _selectedDate;
    });
  }

  void _showPlatformDialog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (ctx) {
            return CupertinoAlertDialog(
              title: const Text("Invalid Input"),
              content: const Text(
                  "Please make sure a valid Amount, Date and Title is entered"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text("Okay")),
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text("Invalid Input"),
              content: const Text(
                  "Please make sure a valid Amount, Date and Title is entered"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text("Okay")),
              ],
            );
          });
    }
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      _showPlatformDialog();
      return;
    }
    widget.onAddExpense(
      Expense(
          amount: enteredAmount,
          title: _titleController.text,
          date: _selectedDate!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _amountController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Widget mainLayout = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  controller: _titleController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                      label: Text("Enter Title for the Title")),
                ),
              ),
              const SizedBox(width: 50),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: const InputDecoration(
                    label: Text("Enter Amount"),
                    prefixText: "\$ ",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      _selectedDate == null
                          ? "No Date Selected"
                          : formatter.format(_selectedDate!),
                    ),
                  ),
                  IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_view_month)),
                ],
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: _submitExpenseData,
                    child: const Text("Save Expense")),
              )
            ],
          )
        ],
      ),
    );

    if (width <= 430) {
      mainLayout = Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 500,
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _titleController,
                maxLength: 50,
                decoration: const InputDecoration(
                    label: Text("Enter Title for the Title")),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _amountController,
                      decoration: const InputDecoration(
                        label: Text("Enter Amount"),
                        prefixText: "\$ ",
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: _presentDatePicker,
                        child: Text(
                          _selectedDate == null
                              ? "No Date Selected"
                              : formatter.format(_selectedDate!),
                        ),
                      ),
                      IconButton(
                          onPressed: _presentDatePicker,
                          icon: const Icon(Icons.calendar_view_month))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel")),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: _submitExpenseData,
                        child: const Text("Save Expense")),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }
    return SingleChildScrollView(
      child: mainLayout,
    );
  }
}
