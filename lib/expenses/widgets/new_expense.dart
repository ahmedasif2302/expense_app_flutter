import 'package:fh_clone/expenses/models/expense_model.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addExpenseHandler});
  final Function(ExpenseModel expense) addExpenseHandler;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  Categories dropdownValue = Categories.food;
  String? _title = '';
  DateTime? _selectedDate;
  String? _amount = '';

  void _onChangeText(String value) {
    setState(() {
      _title = value;
    });
  }

  void _onChangeAmount(String value) {
    setState(() {
      _amount = value;
    });
  }

  void _openDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 2, now.month, now.day);
    final lastDate = DateTime(now.year + 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _onSaveHandler() {
    var validAmount = double.tryParse(_amount!);
    var isValidAmount = validAmount != null && validAmount >= 0;
    if (_title.toString().isEmpty || !isValidAmount || _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid data'),
                content: const Text('Please provide valid data'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Okay'),
                  )
                ],
              ));
      return;
    }
    widget.addExpenseHandler(ExpenseModel(
        title: _title.toString(),
        amount: validAmount,
        date: _selectedDate!,
        category: dropdownValue));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            onChanged: _onChangeText,
            maxLength: 43,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: _onChangeAmount,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate != null
                        ? dateFormatter.format(_selectedDate!)
                        : "No Date Selected"),
                    IconButton(
                      onPressed: _openDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              DropdownButton(
                value: dropdownValue,
                items: Categories.values
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase().toString()),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
              ),
              const Spacer(
                flex: 5,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _onSaveHandler,
                child: const Text('Save Expense'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
