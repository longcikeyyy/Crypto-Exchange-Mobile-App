import 'package:crypto_exchange_mobile_app/models/coin.dart';
import 'package:crypto_exchange_mobile_app/services/local_storage_service.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final Set<String> _favoriteSymbols = {};

  FavoriteProvider() {
    _loadFromStorage();
  }

  bool isFavorite(String symbol) => _favoriteSymbols.contains(symbol);

  void toggleFavorite(String symbol) {
    if (_favoriteSymbols.contains(symbol)) {
      _favoriteSymbols.remove(symbol);
    } else {
      _favoriteSymbols.add(symbol);
    }
    notifyListeners();
    _persist();
  }

  List<Coin> favoritesFrom(List<Coin>? coins) {
    if (coins == null) return [];
    return coins.where((c) => _favoriteSymbols.contains(c.symbol)).toList();
  }

  Future<void> _loadFromStorage() async {
    final stored = await LocalStorageService.instance.loadFavoriteSymbols();
    _favoriteSymbols
      ..clear()
      ..addAll(stored);
    notifyListeners();
  }

  Future<void> _persist() async {
    await LocalStorageService.instance.saveFavoriteSymbols(
      _favoriteSymbols.toList(),
    );
  }
}
