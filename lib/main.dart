import 'package:flutter/material.dart';
import 'package:waiting_room_app/waiting_room_manager.dart';

void main() {
  runApp(const WaitingRoomApp());
}

class WaitingRoomApp extends StatelessWidget {
  const WaitingRoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Waiting Room',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const WaitingRoomScreen(),
    );
  }
}

class WaitingRoomScreen extends StatefulWidget {
  const WaitingRoomScreen({super.key});

  @override
  State<WaitingRoomScreen> createState() => _WaitingRoomScreenState();
}

class _WaitingRoomScreenState extends State<WaitingRoomScreen> {
  final WaitingRoomManager _manager = WaitingRoomManager();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addClient() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _manager.addClient(_controller.text);
      _controller.clear();
    });
  }

  void _removeClient(String name) {
    setState(() {
      _manager.removeClient(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    final clients = _manager.clients;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Waiting Room'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Client Name',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _addClient(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addClient,
                  child: const Text('Add'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Clients in Queue: ${clients.length}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: clients.isEmpty
                  ? const Center(child: Text('The waiting room is empty.'))
                  : ListView.builder(
                      itemCount: clients.length,
                      itemBuilder: (context, index) {
                        final clientName = clients[index];
                        return Card(
                          child: ListTile(
                            leading: const CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                            title: Text(clientName),
                            trailing: IconButton(
                              tooltip: 'Remove $clientName',
                              icon: const Icon(Icons.delete),
                              onPressed: () => _removeClient(clientName),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
