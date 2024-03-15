import 'package:flutt_airbnb/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        navigationBarTheme: NavigationBarThemeData(
            backgroundColor: Colors.white,
            elevation: 5,
            indicatorColor: Colors.white,
            labelTextStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return const TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 13);
              }
              return const TextStyle(color: Colors.black);
            }),
            iconTheme: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return const IconThemeData(color: Colors.redAccent, opacity: 1);
              }
              return const IconThemeData(color: Colors.black, opacity: 0.4);
            })),
        chipTheme: ChipThemeData(
          disabledColor: Colors.white,
          selectedColor: Colors.white,
          secondarySelectedColor: Colors.black,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(
              width: 0.5,
            ),
          ),
        ),
        textTheme: TextTheme(
          headlineMedium: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.black),
        ),
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black), color: Colors.white),
      ),
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
          toolbarHeight: 80,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark),
          elevation: 0,
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none_outlined)),
              ],
            )
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

  get todayTab => SingleChildScrollView(
      child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              insidePadding(
                  Text(
                    "É um prazer ter você aqui de novo, Roberto",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  bottomPadding: 64),
              insidePadding(Text("Suas reservas",
                  style: Theme.of(context).textTheme.titleLarge)),
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
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black26,
                      style: BorderStyle.solid,
                      width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 48.0),
                            child: Text("Checkout amanhã",
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Michael",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge),
                                    Text("25 - 26 de jan.",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge),
                                  ],
                                ),
                              ),
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/avatar.png"),
                                radius: 24,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.black26,
                      height: 1,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              style: const ButtonStyle(
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Enviar mensagem",
                                    style:
                                        Theme.of(context).textTheme.labelLarge),
                              ),
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.black26,
                            width: 1,
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Ligar",
                                    style:
                                        Theme.of(context).textTheme.labelLarge),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
              insidePadding(Text("Todas as reservas",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(decoration: TextDecoration.underline))),
            ],
          )));
  get calendarTab => const Center(child: Text("Calendário"));
  get advertisingTab => const Center(child: Text("Anúncio"));
  get messagesTab => const Center(child: Text("Mensagens"));
  get menuTab => const Center(child: Text("Menu"));

  Widget buildChoice(int index) => ActionChip(
        label: Text(
          widget.textsOfChips[index],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            width: statesOfChips[index] ? 2.0 : 0.5,
          ),
        ),
        onPressed: () {
          setState(() {
            statesOfChips[index] = !statesOfChips[index];
          });
        },
      );
}
