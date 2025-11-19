import 'package:flutter/material.dart';
import 'package:absolute_ballin/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:absolute_ballin/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
    const ProductFormPage({super.key});

    @override
    State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _productName = "";
  String _productDesc = "";
  int _productPrice = 0;
  int _productStock = 0;
  String _category = "equipment"; 
  String _thumbnail = "";
  String _player = "";
  String _club = "";
  bool _isFeatured = false; 

  final List<String> _categories = [
    'equipment',
    'supplement',
    'misc',
    'merch',
    'player',
  ];
  
  int _countWords(String s) {
    final t = s.trim();
    if (t.isEmpty) return 0;
    return t.split(RegExp(r'\s+')).length;
  }

  @override
  Widget build(BuildContext context) {
      final request = context.watch<CookieRequest>();
      return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Add a Product',
            ),
          ),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        drawer: LeftDrawer(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                // === Name ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Product Name",
                      labelText: "Product Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _productName = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Cannot be empty!";
                      }
                      final words = _countWords(value);
                      if (words > 20){
                        return "Max 20 words, you have $words";
                      }
                      return null;
                    },
                  ),
                ),

                // === Price ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Input price in dollars",
                      labelText: "Product Price",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String? value) {
                      setState(() {
                        _productPrice = int.tryParse(value ?? "") ?? 0;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the price!";
                      }
                      final parsed = int.tryParse(value);
                      if (parsed == null) {
                        return "Price must be an integer!";
                      }
                      if (parsed <= 0) {
                        return "Price must be above 0!";
                      }
                      return null;
                    },
                  ),
                ),

                // === Stock ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Input your available stock",
                      labelText: "Product Stock",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String? value) {
                      setState(() {
                        _productStock = int.tryParse(value ?? "") ?? 0;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Stock!";
                      }
                      final parsed = int.tryParse(value);
                      if (parsed == null) {
                        return "Stock must be an integer!";
                      }
                      if (parsed <= 0) {
                        return "Stock must be above 0!";
                      }
                      return null;
                    },
                  ),
                ),


                // === Description ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "What is the product?",
                      labelText: "Product Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _productDesc = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a description!";
                      }
                      final words = _countWords(value);
                      if (words > 500){
                        return "Max 500 words, you have $words";
                      }
                      return null;
                    },
                  ),
                ),

                // === Category ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Kategori",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    value: _category,
                    items: _categories
                        .map((cat) => DropdownMenuItem(
                              value: cat,
                              child: Text(
                                cat[0].toUpperCase() + cat.substring(1)),
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _category = newValue!;
                      });
                    },
                  ),
                ),

                // === Thumbnail URL ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "URL Thumbnail (opsional)",
                      labelText: "URL Thumbnail",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _thumbnail = value!;
                      });
                    },
                  ),
                ),

                // === Player ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Player (opsional)",
                      labelText: "Player",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _player = value!;
                      });
                    },
                  ),
                ),

                // === Club ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Club (opsional)",
                      labelText: "Club",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _club = value!;
                      });
                    },
                  ),
                ),

                // === Is Featured ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    title: const Text("Is this a special item?"),
                    value: _isFeatured,
                    onChanged: (bool value) {
                      setState(() {
                        _isFeatured = value;
                      });
                    },
                  ),
                ),

                // === Tombol Simpan ===
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          
                          final response = await request.postJson(
                            "https://randuichi-touya-absoluteballin.pbp.cs.ui.ac.id/create-flutter/",
                            jsonEncode({
                              "name": _productName,
                              "price": _productPrice,
                              "stock": _productStock,
                              "description": _productDesc,
                              "thumbnail": _thumbnail,
                              "category": _category,
                              "player": _player,
                              "club": _club,
                              "is_featured": _isFeatured,
                            }),
                          );
                          if (context.mounted) {
                            if (response['status'] == 'success') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("product successfully saved!"),
                              ));
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                              );
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Something went wrong, please try again."),
                              ));
                            }
                          }
                        }
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
          ),
        ),
      ),
    );
  }
}