import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/Products.dart';
import 'package:shopapp/providers/ProductsProvider.dart';

class add_product_screen extends StatefulWidget {
  static String Route_Name = "/add_product_screen";

  @override
  _add_product_screenState createState() => _add_product_screenState();
}

class _add_product_screenState extends State<add_product_screen> {
  late String? initialproductid;
  late Products initialproduct;
  final imgurlcontroller = TextEditingController();
  final titlecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();

  final pricecontroller = TextEditingController();
  var isinit = true;

  final _form = GlobalKey<FormState>();
  Products product =
      Products(id: '', title: '', price: 0, imageUrl: '', description: '');

  void _saveForm(BuildContext context) {
    bool? isvalid = _form.currentState?.validate();
    if (!isvalid!) {
      return;
    }
    if(product.id=='')
      {

        _form.currentState?.save();
        Provider.of<ProductsProvider>(context, listen: false).addproduct(product);
      }
    else{

      Provider.of<ProductsProvider>(context, listen: false).updateProduct(product.id, product);
    }

    Navigator.of(context).pop();
  }

  void reset() {
    titlecontroller.clear();
    imgurlcontroller.clear();
    descriptioncontroller.clear();
    pricecontroller.clear();
  }

  @override
  void didChangeDependencies() {
    if (isinit) {
      initialproductid = ModalRoute.of(context)?.settings.arguments as String?;
      if(initialproductid!=null)
        {
          initialproduct=Provider.of<ProductsProvider>(context, listen: false).findById(initialproductid!);
          product=initialproduct;
          imgurlcontroller.text=(initialproduct.imageUrl);
          titlecontroller.text=(initialproduct.title);
          pricecontroller.text=(initialproduct.price.toString());
          descriptioncontroller.text=(initialproduct.description);
        }

    }
    isinit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                reset();
              },
              icon: const Icon(Icons.clear)),
          IconButton(
              onPressed: () {
                _saveForm(context);
              },
              icon: const Icon(Icons.save)),
        ],
        title: const Text("Add Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 13),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    label: Text("Title"),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple))),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                controller: titlecontroller,
                onSaved: (value) {
                  product = Products(
                      id: product.id,
                      title: value!,
                      description: product.description,
                      price: product.price,
                      imageUrl: product.imageUrl);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a Title";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    label: Text("Price"),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple))),
                textInputAction: TextInputAction.next,
                controller: pricecontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a Price";
                  }
                  if (double.tryParse(value) == null) {
                    return "Please enter a valid Price";
                  }
                  if (double.parse(value) <= 0) {
                    return "Please enter a price greater than 0";
                  }
                  return null;
                },
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSaved: (value) {
                  product = Products(
                      id: product.id,
                      title: product.title,
                      description: product.description,
                      price: double.parse(value!),
                      imageUrl: product.imageUrl);
                },
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    label: Text("Description"),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple))),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                controller: descriptioncontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a description";
                  }
                  return null;
                },
                maxLines: 3,
                onSaved: (value) {
                  product = Products(
                      id: product.id,
                      title: product.title,
                      description: value!,
                      price: product.price,
                      imageUrl: product.imageUrl);
                },
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(4)),
                    child: imgurlcontroller.text.isEmpty
                        ? const Text(
                            "Enter a URL",
                            // textAlign: TextAlign.center,
                          )
                        : FittedBox(
                            child: Image.network(
                            imgurlcontroller.text,
                            fit: BoxFit.contain,
                          )),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Enter Image URL"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple))),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.url,
                      controller: imgurlcontroller,
                      onEditingComplete: () => setState(() {}),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a URL";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        product = Products(
                            id: product.id,
                            title: product.title,
                            description: product.description,
                            price: product.price,
                            imageUrl: value!);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
