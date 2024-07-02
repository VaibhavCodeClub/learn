import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteScreenProvider with ChangeNotifier {
  bool _drawingBoard = false;
  bool get drawingBoard => _drawingBoard;

  List<int> _selectedItemList = [];

  List<int> get selectedItemList => _selectedItemList;

  FavouriteScreenProvider() {
    loadFromPrefs();
  }

  void setDrawingBoard() {
    _drawingBoard = !_drawingBoard;
    notifyListeners();
    saveToPrefs();
  }

  void setList(int item) {
    _selectedItemList.add(item);
    notifyListeners();
    saveToPrefs();
  }

  void removeList(int item) {
    _selectedItemList.remove(item);
    notifyListeners();
    saveToPrefs();
  }

  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _drawingBoard = prefs.getBool('drawingBoard') ?? false;
    _selectedItemList = prefs
            .getStringList('selectedItemList')
            ?.map((e) => int.parse(e))
            .toList() ??
        [];
    notifyListeners();
  }

  Future<void> saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('drawingBoard', _drawingBoard);
    await prefs.setStringList('selectedItemList',
        _selectedItemList.map((e) => e.toString()).toList());
  }
}
