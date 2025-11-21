import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:s5s5/features/home/data/models/category_model.dart';
import 'package:s5s5/features/home/data/models/question_model.dart';
import 'package:s5s5/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  List<Category>? _cachedCategories;

  final Map<String, Set<int>> _usedQuestions = {};

  Future<void> _loadUsedQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();

    for (var key in keys) {
      final list = prefs.getStringList(key);
      if (list != null) {
        _usedQuestions[key] = list.map(int.parse).toSet();
      }
    }
  }

  Future<void> _saveUsedQuestions(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      key,
      _usedQuestions[key]!.map((e) => e.toString()).toList(),
    );
  }

  @override
  Future<List<Category>> getCategories() async {
    await _loadUsedQuestions();

    if (_cachedCategories != null) {
      return _cachedCategories!;
    }

    try {
      final String jsonString = await rootBundle.loadString(
        'assets/data/questions.json',
      );

      final Map<String, dynamic> jsonData = json.decode(jsonString);

      final List<dynamic> categoriesJson = jsonData['categories'] as List;

      _cachedCategories = categoriesJson
          .map(
            (categoryJson) =>
                Category.fromJson(categoryJson as Map<String, dynamic>),
          )
          .toList();

      return _cachedCategories!;
    } catch (e) {
      debugPrint('Error loading categories: $e');
      return [];
    }
  }

  @override
  Future<Question> getQuestionByCategoryAndPoints({
    required String categoryName,
    required int questionPoints,
  }) async {
    await _loadUsedQuestions();

    final categories = await getCategories();

    final category = categories.firstWhere(
      (cat) => cat.name == categoryName,
      orElse: () => throw Exception('Category not found'),
    );

    final List<Question> questions = category.questions
        .where((q) => q.points == questionPoints)
        .toList();

    if (questions.isEmpty) {
      throw Exception('No questions for this point value');
    }

    final key = "$categoryName-$questionPoints";

    _usedQuestions.putIfAbsent(key, () => <int>{});

    if (_usedQuestions[key]!.length == questions.length) {
      _usedQuestions[key]!.clear();
    }

    final unusedQuestions = questions
        .where((q) => !_usedQuestions[key]!.contains(q.id))
        .toList();

    final random = Random();
    final Question selected =
        unusedQuestions[random.nextInt(unusedQuestions.length)];

    _usedQuestions[key]!.add(selected.id);

    await _saveUsedQuestions(key);

    return selected;
  }
}
