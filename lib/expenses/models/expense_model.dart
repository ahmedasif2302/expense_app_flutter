import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final dateFormatter = DateFormat.yMd();

enum Categories { food, travel, leisure, work }

const categoriesIcons = {
  Categories.food: Icons.lunch_dining,
  Categories.travel: Icons.flight_takeoff,
  Categories.work: Icons.work,
  Categories.leisure: Icons.movie
};

class ExpenseModel {
  final String title;
  final double amount;
  final String id; // used as String for uuid
  final DateTime date; // Special Data type to store date
  final Categories category;

  ExpenseModel(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  String get formattedDate {
    return dateFormatter.format(date);
  }
}
