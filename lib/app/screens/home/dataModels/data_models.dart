// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const int numberOfCategories = 6;

enum categoriesList { Lakes, Sea, Mountains, Forests, Towns, Architecture }

const categoriesListIcons = {
  categoriesList.Lakes: Icons.waves_outlined,
  categoriesList.Sea: Icons.water,
  categoriesList.Mountains: Icons.question_mark_outlined,
  categoriesList.Forests: Icons.forest_outlined,
  categoriesList.Towns: Icons.location_city_outlined,
  categoriesList.Architecture: Icons.castle_outlined
};
