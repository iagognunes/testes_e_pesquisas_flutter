// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// The file was extracted from GitHub: https://github.com/flutter/gallery
// Changes and modifications by Maxim Saplin, 2021

class RestorableDessertSelections extends RestorableProperty<Set<int>> {
  Set<int> _dessertSelections = {};

  /// Returns whether or not a dessert row is selected by index.
  bool isSelected(int index) => _dessertSelections.contains(index);

  /// Takes a list of [Dessert]s and saves the row indices of selected rows
  /// into a [Set].
  void setDessertSelections(List<Dessert> desserts) {
    final updatedSet = <int>{};
    for (var i = 0; i < desserts.length; i += 1) {
      var dessert = desserts[i];
      if (dessert.selected) {
        updatedSet.add(i);
      }
    }
    _dessertSelections = updatedSet;
    notifyListeners();
  }

  @override
  Set<int> createDefaultValue() => _dessertSelections;

  @override
  Set<int> fromPrimitives(Object? data) {
    final selectedItemIndices = data as List<dynamic>;
    _dessertSelections = {
      ...selectedItemIndices.map<int>((dynamic id) => id as int),
    };
    return _dessertSelections;
  }

  @override
  void initWithValue(Set<int> value) {
    _dessertSelections = value;
  }

  @override
  Object toPrimitives() => _dessertSelections.toList();
}

class Dessert {
  Dessert(
    this.name,
    this.cpf,
    this.valorTotal,
    this.status,
  );

  final String name;
  final int cpf;
  final double valorTotal;
  final int status;
  bool selected = false;
}

class DessertDataSource extends DataTableSource {
  DessertDataSource.empty(this.context) {
    desserts = [];
  }

  DessertDataSource(this.context) {
    desserts = <Dessert>[
      Dessert(
        'Daniela Mariah Costa',
        57133592983,
        44.68,
        1,
      ),
      Dessert(
        'Isabela Cecília Almeida',
        64830827203,
        12.57,
        2,
      ),
      Dessert(
        'Bárbara Maya Fátima Lima',
        65337615955,
        39.74,
        3,
      ),
      Dessert(
        'Aurora Evelyn da Costa',
        21404435433,
        21404435433,
        4,
      ),
      Dessert(
        'Larissa Ayla Jéssica Campos',
        93694853502,
        22.90,
        5,
      ),
      Dessert(
        'Thales Renato dos Santos',
        08564183587,
        17.34,
        6,
      ),
      Dessert(
        'Luan Jorge Almada',
        86968274493,
        25.66,
        7,
      ),
      Dessert(
        'Nathan Theo Moreira',
        75645948025,
        47.69,
        8,
      ),
      Dessert(
        'Kamilly Fátima Mendes',
        15155507456,
        20.68,
        9,
      ),
      Dessert(
        'Vitor Noah Pinto',
        89303138848,
        20.04,
        10,
      ),
      Dessert(
        'Honeycomb',
        408,
        3.2,
        87,
      ),
      Dessert(
        'Honeycomb',
        408,
        3.2,
        87,
      ),
      Dessert(
        'Honeycomb',
        408,
        3.2,
        87,
      ),
      Dessert(
        'Honeycomb',
        408,
        3.2,
        87,
      ),
      Dessert(
        'Honeycomb',
        408,
        3.2,
        87,
      ),
      Dessert(
        'Honeycomb',
        408,
        3.2,
        87,
      ),
      Dessert(
        'Honeycomb',
        408,
        3.2,
        87,
      ),
      Dessert(
        'Honeycomb',
        408,
        3.2,
        87,
      ),
      Dessert(
        'Honeycomb',
        408,
        3.2,
        87,
      ),
      Dessert(
        'Honeycomb',
        408,
        3.2,
        87,
      ),
      Dessert(
        'Honeycomb',
        408,
        3.2,
        87,
      ),
      Dessert(
        'Honeycomb',
        408,
        3.2,
        87,
      ),
      Dessert(
        'Honeycomb',
        408,
        3.2,
        87,
      ),
      Dessert(
        'Honeycomb',
        408,
        3.2,
        87,
      ),
    ];
  }

  final BuildContext context;
  late List<Dessert> desserts;

  void sort<T>(Comparable<T> Function(Dessert d) getField, bool ascending) {
    desserts.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  int _selectedCount = 0;
  void updateSelectedDesserts(RestorableDessertSelections selectedRows) {
    _selectedCount = 0;
    for (var i = 0; i < desserts.length; i += 1) {
      var dessert = desserts[i];
      if (selectedRows.isSelected(i)) {
        dessert.selected = true;
        _selectedCount += 1;
      } else {
        dessert.selected = false;
      }
    }
    notifyListeners();
  }

  void updateSelectedDessertsFromSet(Set<int> selectedRows) {
    _selectedCount = 0;
    for (var i = 0; i < desserts.length; i += 1) {
      var dessert = desserts[i];
      if (selectedRows.contains(i)) {
        dessert.selected = true;
        _selectedCount += 1;
      } else {
        dessert.selected = false;
      }
    }
    notifyListeners();
  }

  @override
  DataRow getRow(int index) {
    final format = NumberFormat.decimalPercentPattern(
      locale: 'en',
      decimalDigits: 0,
    );
    assert(index >= 0);
    if (index >= desserts.length) throw 'index > _desserts.length';
    final dessert = desserts[index];
    return DataRow.byIndex(
      index: index,
      selected: dessert.selected,
      onSelectChanged: (value) {
        if (dessert.selected != value) {
          _selectedCount += value! ? 1 : -1;
          assert(_selectedCount >= 0);
          dessert.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text(dessert.name)),
        DataCell(Text('${dessert.cpf}')),
        DataCell(Text(dessert.valorTotal.toStringAsFixed(2))),
        DataCell(Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        )),
      ],
    );
  }

  @override
  int get rowCount => desserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void selectAll(bool? checked) {
    for (final dessert in desserts) {
      dessert.selected = checked ?? false;
    }
    _selectedCount = (checked ?? false) ? desserts.length : 0;
    notifyListeners();
  }
}
