import 'package:freezed_annotation/freezed_annotation.dart';


part 'tutorial.freezed.dart';

part 'tutorial.g.dart';

@freezed
class Tutorial with _$Tutorial{
  const factory Tutorial({
    bool? isEditMood,
    bool? isFoodChoose,
    bool? isRegenerateRecipe,
    bool? isRecipeButton,
    bool? isShowBottomBar,
    bool? isSwipeCards,
    bool? isAddCraving,
  }) = _Tutorial;

  factory Tutorial.fromJson(Map<String, dynamic> json) =>
      _$TutorialFromJson(json);
}