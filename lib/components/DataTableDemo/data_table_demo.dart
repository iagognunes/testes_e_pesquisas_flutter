// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class User {
  String name;
  int cpf;
  double vTotal;
  String status;

  User(
      {required this.name,
      required this.cpf,
      required this.vTotal,
      required this.status});
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatefulWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  _MyStatelessWidgetState createState() => _MyStatelessWidgetState();
}

class _MyStatelessWidgetState extends State<MyStatelessWidget> {
  List<User> users = [
    User(
      name: "Isabela Cecília Almeida",
      cpf: 64830827203,
      vTotal: 12.57,
      status: "Aprovado",
    ),
    User(
      name: "Aurora Evelyn da Costa",
      cpf: 21404435433,
      vTotal: 214.04,
      status: "Aprovado",
    ),
    User(
      name: "Thales Renato dos Santos",
      cpf: 08564183587,
      vTotal: 17.34,
      status: "Aprovado",
    ),
    User(
      name: "Nathan Theo Moreira",
      cpf: 75645948025,
      vTotal: 47.69,
      status: "Aprovado",
    ),
    User(
      name: "Vitor Noah Pinto",
      cpf: 89303138848,
      vTotal: 20.04,
      status: "Aprovado",
    ),
    User(
      name: "Daniela Mariah Costa",
      cpf: 57133592983,
      vTotal: 44.68,
      status: "Em espera",
    ),
    User(
      name: "Bárbara Maya Fátima Lima",
      cpf: 65337615955,
      vTotal: 39.74,
      status: "Em espera",
    ),
    User(
      name: "Larissa Ayla Jéssica Campos",
      cpf: 93694853502,
      vTotal: 22.90,
      status: "Em espera",
    ),
    User(
      name: "Luan Jorge Almada",
      cpf: 86968274493,
      vTotal: 25.66,
      status: "Em espera",
    ),
    User(
      name: "Kamilly Fátima Mendes",
      cpf: 15155507456,
      vTotal: 20.68,
      status: "Em espera",
    ),
    User(
      name: "Sarah",
      cpf: 19,
      vTotal: 25.50,
      status: "Em espera",
    ),
    User(
      name: "Sarah",
      cpf: 19,
      vTotal: 25.50,
      status: "Em espera",
    ),
    User(
      name: "Sarah",
      cpf: 19,
      vTotal: 25.50,
      status: "Em espera",
    ),
    User(
      name: "Sarah",
      cpf: 19,
      vTotal: 25.50,
      status: "Em espera",
    ),
    User(
      name: "Sarah",
      cpf: 19,
      vTotal: 25.50,
      status: "Em espera",
    ),
    User(
      name: "Sarah",
      cpf: 19,
      vTotal: 25.50,
      status: "Em espera",
    ),
    User(
      name: "Sarah",
      cpf: 19,
      vTotal: 25.50,
      status: "Em espera",
    ),
    User(
      name: "Sarah",
      cpf: 19,
      vTotal: 25.50,
      status: "Em espera",
    ),
    User(
      name: "Sarah",
      cpf: 19,
      vTotal: 25.50,
      status: "Em espera",
    ),
    User(
      name: "Sarah",
      cpf: 19,
      vTotal: 25.50,
      status: "Em espera",
    ),
  ];
  List<User> usersFiltered = [];
  TextEditingController controller = TextEditingController();
  String _searchResult = '';

  @override
  void initState() {
    super.initState();
    usersFiltered = users;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 500,
              height: 60,
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.search),
                  title: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                          hintText: 'Pesquisar', border: InputBorder.none),
                      onChanged: (value) {
                        setState(() {
                          _searchResult = value;
                          usersFiltered = users
                              .where((user) =>
                                  user.name.contains(_searchResult) ||
                                  user.cpf.toString().contains(_searchResult) ||
                                  user.vTotal
                                      .toString()
                                      .contains(_searchResult) ||
                                  user.status.contains(_searchResult))
                              .toList();
                        });
                      }),
                  trailing: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        controller.clear();
                        _searchResult = '';
                        usersFiltered = users;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 1900,
          height: 500,
          child: SingleChildScrollView(
            child: DataTable(
              dataRowHeight: 70,
              showCheckboxColumn: false,
              dividerThickness: 2,
              columnSpacing: 5,
              headingRowColor: MaterialStateColor.resolveWith(
                  (states) => const Color(0xFFD50000)),
              decoration: const BoxDecoration(),
              sortAscending: true,
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Nome',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'CPF',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Valor Total',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Status',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              rows: List.generate(
                usersFiltered.length,
                (index) => DataRow(
                  onSelectChanged: (newValue) {
                    print('row 2 pressed');
                  },
                  color: MaterialStateColor.resolveWith((states) {
                    return usersFiltered[index].status == 'Em espera'
                        ? const Color(0xFFCBCBCB)
                        : const Color(0xFFF6F6F6); //make tha magic!
                  }),
                  cells: <DataCell>[
                    DataCell(
                      Text(usersFiltered[index].name),
                      onTap: () {
                        print('Clicou no ' + usersFiltered[index].name);
                      },
                    ),
                    DataCell(Text(usersFiltered[index].cpf.toString())),
                    DataCell(Text(usersFiltered[index].vTotal.toString())),
                    DataCell(
                      Column(
                        children: [
                          Text(usersFiltered[index].status),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      onPressed: () {
                                        print('Clicou para imprimir');
                                      },
                                      child: const Icon(
                                        Icons.local_print_shop,
                                        color: Colors.black,
                                      )),
                                  const Text('Imprimir'),
                                ],
                              ),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      onPressed: () {
                                        print('Clicou para Finalizar');
                                      },
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.black,
                                      )),
                                  const Text('Finalizar'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
