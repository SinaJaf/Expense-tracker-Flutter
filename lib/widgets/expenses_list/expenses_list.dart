import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';

// Widget deleteIconDirection(DismissDirection direction) {
//   if(direction == DismissDirection.horizontal) {const Icon(Icons.delete);};
// }

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: isDarkMode
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.error.withOpacity(0.85),
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: const Icon(Icons.delete),
          // margin: EdgeInsets.symmetric(
          //   horizontal: Theme.of(context).cardTheme.margin!.horizontal/2,
          // ),
        ),
        secondaryBackground: Container(
          color: isDarkMode
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.error.withOpacity(0.85),
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          alignment: Alignment.centerRight,
          child: const Icon(Icons.delete),
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
