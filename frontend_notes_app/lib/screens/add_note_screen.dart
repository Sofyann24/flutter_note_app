import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

const List<String> listDropdown = ['All', 'Daily', 'Monthly', 'Annual'];

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  String dropdownValue = listDropdown.first;
  final valueListenable = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
        backgroundColor: const Color.fromARGB(255, 222, 234, 64),
        elevation: 2,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.picture_as_pdf)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text('Select Item'),
                      items: listDropdown
                          .map(
                            (String item) => DropdownItem<String>(
                              value: item,
                              child: Padding(
                                padding: const EdgeInsetsGeometry.symmetric(
                                  horizontal: 8,
                                ),
                                child: Text(item),
                              ),
                            ),
                          )
                          .toList(),
                      valueListenable: valueListenable,
                      onChanged: (value) {
                        valueListenable.value = value;
                      },
                      dropdownStyleData: const DropdownStyleData(
                        maxHeight: 200,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                    ),
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter your notes',
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(255, 222, 234, 64),
                  ),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 35,
                  child: Text('Tambah', style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
