import 'package:flutt_airbnb/utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  final List<String> textsOfChips = [
    "Fazendo checkout (1)",
    "Chegando em breve (1)",
    "Programados (1)",
    "Análise pendente (1)",
    "Hóspedes no momento (1)"
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  List<bool> statesOfChips = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.grey[200],
          foregroundColor: Colors.purple[900],
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_outlined))
          ],
        ),
        bottomNavigationBar: NavigationBar(
          elevation: 1,
          indicatorColor: Colors.grey[300],
          backgroundColor: Colors.grey[100],
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(
                Icons.today,
              ),
              label: 'Hoje',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month),
              label: 'Calendário',
            ),
            NavigationDestination(
              icon: Icon(Icons.home_work_outlined),
              label: 'Anúncios',
            ),
            NavigationDestination(
              icon: Icon(Icons.messenger_outline),
              label: 'Mensagens',
            ),
            NavigationDestination(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
          ],
        ),
        body: [
          todayTab,
          calendarTab,
          advertisingTab,
          messagesTab,
          menuTab,
        ][currentPageIndex]);
  }

  get todayTab => Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          insidePadding(
              const Text("É um prazer ter você aqui de novo, Ricardo"),
              bottomPadding: 64),
          insidePadding(const Text("Suas reservas")),
          Container(
            margin: const EdgeInsets.only(bottom: 24.0),
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 10,
                ),
                buildChoice(1),
                const SizedBox(
                  width: 10,
                ),
                buildChoice(2),
                const SizedBox(
                  width: 10,
                ),
                buildChoice(3),
                const SizedBox(
                  width: 10,
                ),
                buildChoice(4),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          insidePadding(Container(
            margin: const EdgeInsets.only(bottom: 48.0),
            width: double.maxFinite,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 48.0),
                        child: Text("Checkout amanhã"),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Michael"),
                                Text("25 - 26 de jan."),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/avatar.png"),
                            radius: 24,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Enviar mensagem"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Ligar"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
          insidePadding(const Text("Todas as reservas")),
        ],
      ));
  get calendarTab => const Center(child: Text("Calendário"));
  get advertisingTab => const Center(child: Text("Anúncio"));
  get messagesTab => const Center(child: Text("Mensagens"));
  get menuTab => const Center(child: Text("Menu"));

  Widget buildChoice(int index) => ActionChip(
        label: Text(
          widget.textsOfChips[index],
        ),
        onPressed: () {
          setState(() {
            statesOfChips[index] = !statesOfChips[index];
          });
        },
      );
}
