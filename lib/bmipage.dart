import 'dart:ffi';

import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _text3 = TextEditingController();

  String isRadio = "";
  bool isCheck = false;

  List<Fruit> fruits = [];

  final List<ListItem> _dropdownltems = [
    ListItem(1, 'ม่วง'),
    ListItem(2, 'ฟ้า'),
    ListItem(3, 'เทา'),
    ListItem(4, 'เขียว'),
    ListItem(5, 'ส้ม'),
    ListItem(6, 'แดง'),
    ListItem(7, 'ชมพู'),
    ListItem(8, 'น้ำตาล'),
  ];

  late List<DropdownMenuItem<ListItem>> _dropdownMenultems;
  ListItem? _selectedltem;

  @override
  void initState() {
    super.initState();
    fruits = Fruit.getFruit();
    print(fruits[0].engName);

    _dropdownMenultems = buildDropdownMenuItem(_dropdownltems);
    _selectedltem = _dropdownMenultems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropdownMenuItem(
      List<ListItem> dropdownItems) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem listltem in dropdownItems) {
      items.add(DropdownMenuItem(
        child: Text(listltem.name),
        value: listltem,
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    var child2 = null;
    // ignore: dead_code
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculation"),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _weight,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter weight";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(suffixText: "kg", labelText: "น้ำหนัก"),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              TextFormField(
                controller: _height,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter height";
                  }
                  return null;
                }),
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(suffixText: "cm", labelText: "ส่วนสูง"),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              TextFormField(
                controller: _weight,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onChanged: (value) {
                  setState(() {});
                },
              ),
              Center(child: Text("\nTextFormField #3")),
              TextFormField(
                controller: _text3,
                keyboardType: TextInputType.url,
                obscureText: true,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.green,
                  ),
                  hintText: 'This is label text',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.green, width: 3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.blue, width: 3),
                  ),
                ),
              ),
              Center(child: Text("\nSex")),
              RadioListTile(
                  title: Text("Male"),
                  value: "Male",
                  groupValue: isRadio,
                  onChanged: ((value) {
                    setState(() {
                      isRadio = value!;
                    });
                  })),
              RadioListTile(
                  title: Text("Female"),
                  value: "Female",
                  groupValue: isRadio,
                  onChanged: ((value) {
                    setState(() {
                      isRadio = value!;
                    });
                  })),
              RadioListTile(
                  title: Text("Other(LGBT+)"),
                  value: "Not",
                  groupValue: isRadio,
                  onChanged: ((value) {
                    setState(() {
                      isRadio = value!;
                    });
                  })),
              Column(
                children: createFruitCheckbox(),
              ),
            ],
          ),
        ));
  }

  List<Widget> createFruitCheckbox() {
    List<Widget> myfruit = [];

    for (Fruit fruit in fruits) {
      print(fruit.thName);
      myfruit.add(CheckboxListTile(
          title: Text(fruit.thName),
          value: fruit.isCheck,
          onChanged: ((value) {
            setState(() {
              fruit.isCheck = value!;
            });
          })));
    }
    return myfruit;
  }
}

class Fruit {
  String engName;
  String thName;
  bool isCheck;

  Fruit(this.engName, this.thName, this.isCheck);

  static List<Fruit> getFruit() {
    return <Fruit>[
      Fruit("1", "กล้วย", false),
      Fruit("2", "ส้ม", false),
      Fruit("3", "แอปเปิ้ล", false),
      Fruit("4", "มะละกอ", false),
      Fruit("5", "มะพร้าว", false),
    ];
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
