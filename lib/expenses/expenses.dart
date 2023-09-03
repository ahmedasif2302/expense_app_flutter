import 'package:fh_clone/expenses/models/expense_model.dart';
import 'package:fh_clone/expenses/widgets/expenses_list.dart';
import 'package:fh_clone/expenses/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseModel> _expensesList = [
    ExpenseModel(
      title: 'Petrol',
      amount: 300.00,
      category: Categories.travel,
      date: DateTime.now(),
    ),
    ExpenseModel(
      title: 'Food',
      amount: 75.00,
      category: Categories.food,
      date: DateTime.now(),
    ),
    ExpenseModel(
      title: 'Cinema',
      amount: 175.00,
      category: Categories.leisure,
      date: DateTime.now(),
    )
  ];

  void addExpense(ExpenseModel expense) {
    setState(() {
      _expensesList.add(expense);
    });
  }

  void removeExpense(ExpenseModel expense) {
    final expenseIndex = _expensesList.indexOf(expense);
    setState(() {
      _expensesList.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 3000),
      content: const Text('Expense deleted.'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            _expensesList.insert(expenseIndex, expense);
          });
        },
      ),
    ));
  }

  void _openModal() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(addExpenseHandler: addExpense));
  }

  @override
  Widget build(BuildContext context) {
    Widget listContent = const Center(
      child: Text('No data found....'),
    );

    if (_expensesList.isNotEmpty) {
      listContent = ExpenesesList(
        expensesList: _expensesList,
        removeExpense: removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(onPressed: _openModal, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          const Text("The Charts"),
          Expanded(child: listContent),
        ],
      ),
    );
  }
}
