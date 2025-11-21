import 'package:s5s5/features/home/data/models/category_model.dart';
import 'package:s5s5/features/home/data/models/question_model.dart';

abstract class HomeRepo {
  Future<List<Category>> getCategories();
  Future<Question> getQuestionByCategoryAndPoints({required String categoryName , required int questionPoints});
}
