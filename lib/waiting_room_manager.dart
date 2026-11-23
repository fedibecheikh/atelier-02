/// Logique métier de la file d'attente, totalement indépendante de l'UI.
class WaitingRoomManager {
  final List<String> _clients = [];

  /// Copie non modifiable pour éviter les mutations depuis l'extérieur.
  List<String> get clients => List.unmodifiable(_clients);

  void addClient(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return;
    _clients.add(trimmed);
  }

  void removeClient(String name) {
    _clients.remove(name);
  }

  void clear() {
    _clients.clear();
  }
}
