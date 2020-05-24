import 'package:ecommerceapp/model/ProductData.dart';
import 'package:ecommerceapp/widgets/all_products_unless.dart';
import 'package:ecommerceapp/widgets/sub_title.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final ProductData item;
  ProductDetails({this.item});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.redAccent,
        title: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(context);
            },
            child: Text("E-Commerce")),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.item.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '\$${widget.item.newPrice.toString()}',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 19,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '\$${widget.item.oldPrice.toString()}',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              child: Image.asset(
                widget.item.image,
                height: 300,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              OptionsDropdownButton(optionName: 'Size'),
              OptionsDropdownButton(optionName: 'Color'),
              OptionsDropdownButton(optionName: 'Qty'),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    'Buy Now',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_shopping_cart),
                color: Colors.redAccent,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border),
                color: Colors.redAccent,
              ),
            ],
          ),
          Divider(),
          SubTitle(
            title: 'Product Details',
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          ProductSection(
            sectionName: 'Name',
            sectionValue: widget.item.name,
          ),
          ProductSection(
            sectionName: 'Brand',
            sectionValue: 'Brand X',
          ),
          ProductSection(
            sectionName: 'Condition',
            sectionValue: 'Conditon X',
          ),
          SubTitle(
            title: 'Other Products',
          ),
          AllProductsUnless(
            item: widget.item,
          ),
        ],
      ),
    );
  }
}

class ProductSection extends StatelessWidget {
  final String sectionName;
  final String sectionValue;

  ProductSection({this.sectionName, this.sectionValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Product $sectionName : ',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          ),
        ),
        Text(sectionValue, style: TextStyle(fontSize: 15)),
      ],
    );
  }
}

class OptionsDropdownButton extends StatelessWidget {
  final String optionName;
  OptionsDropdownButton({this.optionName});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(optionName),
                  content: Text('Choose $optionName'),
                  actions: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              });
        },
        child: Row(
          children: <Widget>[
            Expanded(child: Text(optionName)),
            Expanded(child: Icon(Icons.arrow_drop_down)),
          ],
        ),
      ),
    );
  }
}
