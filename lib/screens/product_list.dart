import 'package:flutter/material.dart';
import 'package:absolute_ballin/models/product_entry.dart';
import 'package:absolute_ballin/widgets/left_drawer.dart';
import 'package:absolute_ballin/screens/product_detail.dart';
import 'package:absolute_ballin/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';


class ProductListPage extends StatefulWidget {
  final bool showOnlyMine;

  const ProductListPage({
    Key? key,
    this.showOnlyMine = false,
  }) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  Future<List<ProductEntry>> fetchNews(CookieRequest request) async {
    
    final response = await request.get('https://randuichi-touya-absoluteballin.pbp.cs.ui.ac.id/json/');
    
    // Decode response to json format
    var data = response;

    // Prepare current user info for filtering
    String? currentUsername;
    int? currentUserId;

    if (widget.showOnlyMine) {
      final jsonData = request.jsonData;
      // Get id
      final idValue = jsonData['id'];
      currentUserId = idValue;

      // Get Username
      final uname = jsonData['username'];
      currentUsername = uname;
    }
    
    // Convert json data to ProductEntry objects
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        final product = ProductEntry.fromJson(d);

        if (!widget.showOnlyMine) {
          listProduct.add(product);
          continue;
        }

        // filter by user
        if (currentUserId != null && product.userId == currentUserId) {
          listProduct.add(product);
        } else if (currentUsername != null && product.user.username == currentUsername) {
          listProduct.add(product);  
        }
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchNews(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'No ball.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two Columns
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  final product = snapshot.data![index];
                  return ProductEntryCard(
                    prod: product,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                            prod: product,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}