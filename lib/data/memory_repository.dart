import 'dart:core';
import 'package:flutter/foundation.dart';
import 'repository.dart';
import 'models/models.dart';
import 'dart:async';

class MemoryRepository extends Repository {
  final List<Recipe> _currentRecipes = <Recipe>[];
  final List<Ingredient> _currentIngredients = <Ingredient>[];
  Stream<List<Recipe>>? _recipeStream;
  Stream<List<Ingredient>>? _ingredientStream;
  final StreamController _recipeStreamController =
      StreamController<List<Recipe>>();
  final StreamController _ingredientStreamController =
      StreamController<List<Ingredient>>();

  @override
  void close() {
    _recipeStreamController.close();
    _ingredientStreamController.close();
  }

  @override
  Future<void> deleteIngredient(Ingredient ingredient) {
   _currentIngredients.remove(ingredient);
   _ingredientStreamController.sink.add(_currentIngredients);
   return Future.value();
  }

  @override
  Future<void> deleteIngredients(List<Ingredient> ingredients) {
    _currentIngredients.removeWhere((ingredient) => ingredients.contains(ingredient));
    _ingredientStreamController.sink.add(_currentIngredients);
    return Future.value();
  }

  @override
  Future<void> deleteRecipe(Recipe recipe) {
    _currentRecipes.remove(recipe);
    _recipeStreamController.sink.add(_currentRecipes);
    deleteRecipeIngredients(recipe.id!);
    return Future.value();
  }

  @override
  Future<void> deleteRecipeIngredients(int recipeId) {
    _currentIngredients.removeWhere((ingredient)  => ingredient.recipeId==recipeId);
    _ingredientStreamController.sink.add(_currentIngredients);
    return Future.value();
  }

  @override
  Future<List<Ingredient>> findAllIngredients() {
    return Future.value(_currentIngredients);
  }

  @override
  Future<List<Recipe>> findAllRecipes() {
    return Future.value(_currentRecipes);
  }

  @override
  Future<Recipe> findRecipeById(int id) {
   return Future.value(_currentRecipes.firstWhere((recipe) => recipe.id==id ));
  }

  @override
  Future<List<Ingredient>> findRecipeIngredients(int recipeId) {
    final ingredients = _currentIngredients.where((ingredient) => ingredient.recipeId==recipeId) as List<Ingredient>;
    return Future.value(ingredients);
  }

  @override
  Future init() {
    return Future.value();
  }

  @override
  Future<List<int>> insertIngredients(List<Ingredient>? ingredients) {
  _currentIngredients.addAll(ingredients!);
  _ingredientStreamController.sink.add(_currentIngredients);
   return Future.value([]);
  }

  @override
  Future<int> insertRecipe(Recipe recipe) {
    _currentRecipes.add(recipe);
    _recipeStreamController.sink.add(_currentRecipes);
     insertIngredients(recipe.ingredients!);
     return Future.value(0);
  }

  @override
  Stream<List<Recipe>>? watchAllRecipes() {
    _recipeStream ??= _recipeStreamController.stream as Stream<List<Recipe>>?;
    return _recipeStream;
  }

  @override
  Stream<List<Ingredient>>? watchAllIngredients() {
    _ingredientStream ??= _ingredientStreamController.stream as Stream<List<Ingredient>>?;
    return _ingredientStream;
  }
}
