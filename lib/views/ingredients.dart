import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IngrediensVy extends StatefulWidget {
  @override
  _IngrediensVyState createState() => _IngrediensVyState();
}

class _IngrediensVyState extends State<IngrediensVy> {
  var api = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list";
  var res;
  var ingredients = [];
  bool check = false;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    res = await http.get(Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'));
    ingredients = jsonDecode(res.body)["drinks"];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/3.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                child: Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      title: const Center(
                        child: Text(
                          "Ingredienser",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      backgroundColor: Colors.black12.withOpacity(0.65),
                      elevation: 0.0,
                    ),
                    body: SizedBox(
                      height: 590,
                      child: Center(
                        child: ListView.builder(
                            itemCount: ingredients.length,
                            itemBuilder: (context, index) {
                              var ingredient = ingredients[index];
                              return SizedBox(
                                height: 60,
                                child: Card(
                                  color: Colors.black12.withOpacity(0.4),
                                  child: ListTile(
                                    leading: Text(
                                        "${ingredient["strIngredient1"]}",
                                        style: const TextStyle(
                                            fontSize: 24, color: Colors.white)),
                                    trailing: IconButton(
                                      icon: Icon(Icons.check_box_outline_blank),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    )),
              )))
    ]);
  }
}
