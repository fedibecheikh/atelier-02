# Atelier 2 — State Management + TDD

## Réalisation

Application « Local Waiting Room » interactive, construite en TDD (cycle Red → Green → Refactor).

### Logique (`lib/waiting_room_manager.dart`)

- `WaitingRoomManager` : liste de clients, `addClient`, `removeClient`, `clear`.
- Aucune dépendance à Flutter : la logique est testable en pur Dart.

### UI (`lib/main.dart`)

- `StatefulWidget` + `setState()` pour rafraîchir l'écran.
- `TextField` + `ElevatedButton` pour ajouter un client.
- Compteur « Clients in Queue: N ».
- `ListView.builder` + `IconButton(Icons.delete)` pour retirer un client.

### Tests

- `test/waiting_room_manager_test.dart` : tests unitaires (ajout, suppression, nom vide, trim).
- `test/waiting_room_widget_test.dart` : tests de widget (ajout, suppression, champ vide).

## Lancer

```bash
flutter pub get
flutter create . --project-name waiting_room_app --platforms=android,ios,web
flutter run
flutter test
```

## Livrables

- [x] Application interactive d'ajout / suppression de clients.
- [x] UI mise à jour dynamiquement via `setState`.
- [x] Tests unitaires du `WaitingRoomManager`.
- [x] Tests de widget des interactions.
- [x] CI (`flutter analyze` + `flutter test`).
