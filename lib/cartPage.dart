import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  AppBar appBar() => AppBar(
        toolbarHeight: 100,
        title: const Text('Shopping Cart'),
      );

  Widget body() {
    final list = [const CartTile(), const CartTile()];

    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(25.0),
          itemBuilder: (BuildContext context, int index) {
            return list[index];
          },
          separatorBuilder: (BuildContext context, int index) {
            return Decorations.height10;
          },
          itemCount: list.length,
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Material(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  const ListTile(
                    dense: true,
                    title: Text('Total Cart Quantity'),
                    trailing: Text('200'),
                  ),
                  const ListTile(
                    dense: true,
                    title: Text('Cart SubTotal'),
                    trailing: Text('\$200'),
                  ),
                  const ListTile(
                    dense: true,
                    title: Text('Cart Discount'),
                    trailing: Text('200'),
                  ),
                  const Divider(),
                  const ListTile(
                    title: Text('Total Cart Price'),
                    dense: true,
                    trailing: Text('\$200'),
                  ),
                  ListTile(
                    onTap: () {},
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.redAccent.shade700)),
                    dense: true,
                    title: const Text('\$500'),
                    trailing: const Text('CheckOut'),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CartTile extends StatelessWidget {
  const CartTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape:
          const RoundedRectangleBorder(side: BorderSide(color: Colors.black26)),
      child: Row(
        children: [
          const SizedBox(
            // color: Colors.amber,
            width: 100,
            height: 100,
            child: Image(
                image: NetworkImage(
                    "https://farm8.staticflickr.com/7377/9359257263_81b080a039_z_d.jpg")),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              // color: Colors.blue,
              width: 100,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Light Rise | TB 18K Disposables | 18000 Puffs | Nic 5% | Pack of 5 | Banana Cake',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ))
                    ],
                  ),
                  Decorations.height5,
                  const Row(
                    children: [Expanded(child: Text('Stock: 299'))],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            // color: Colors.deepOrange,
            width: 100,
            height: 100,
            child: Center(
                child: Text(
              '\$3500',
              style: TextStyle(fontSize: 18),
            )),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            // color: Colors.deepPurple,
            width: 150,
            height: 100,
            child: Row(
              children: [
                IconButton(
                    onPressed: onAddQuantity, icon: const Icon(Icons.add)),
                const Expanded(child: Center(child: Text('100'))),
                IconButton(
                    onPressed: onRemoveQuantity, icon: const Icon(Icons.remove))
              ],
            ),
          ),
          SizedBox(
            // color: Colors.green,
            width: 70,
            height: 100,
            child: IconButton(
                color: Colors.deepOrange,
                onPressed: onRemoveProduct,
                icon: const Icon(Icons.delete)),
          ),
        ],
      ),
    );
  }

  void onRemoveProduct() {}

  void onAddQuantity() {}

  void onRemoveQuantity() {}
}
