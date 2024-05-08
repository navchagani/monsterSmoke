import 'package:flutter/material.dart';
import 'package:monstersmoke/Decorations/Decorations.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';

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
    final list = [
      // const CartTile(
      //   productModel: ProductModel(),
      // ),
      // const CartTile(
      //   productModel: ProductModel(),
      // )
    ];

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
          padding: const EdgeInsets.all(15.0),
          child: Material(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.grey.shade100,
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
                  tileColor: Colors.redAccent.shade700,
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.redAccent.shade700)),
                  dense: true,
                  title: const Text(
                    '\$500',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: const Text(
                    'CheckOut',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CartTile extends StatelessWidget {
  final String? name, subSku, price, image, quantity;
  const CartTile({
    super.key,
    this.name,
    this.price,
    this.image,
    this.quantity,
    this.subSku,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade100,
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image(
                  image: NetworkImage(image.toString()),
                  errorBuilder: ((context, error, stackTrace) {
                    return const Image(
                        image: NetworkImage(
                            'https://monstersmokeoutlet.com/asset/img/place-holder.png'));
                  }),
                ),
              ),
            ),
            Decorations.width10,
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        name.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                  if (subSku != null)
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          subSku.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        )),
                      ],
                    ),
                  Row(
                    children: [
                      Expanded(child: Text(price.toString())),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                    child: Material(
                      // color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.add_circle_outline,
                            ),
                            onPressed: () {},
                            color: Colors.green.shade600,
                          ),
                          Decorations.width5,
                          Text(quantity.toString()),
                          Decorations.width5,
                          IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () {},
                              color: Colors.deepOrange.shade600)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),

            // Expanded(
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(horizontal: 15.0),
            //     // color: Colors.blue,
            //     width: 100,
            //     height: 100,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         const Row(
            //           children: [
            //             Expanded(
            //                 child: Text(
            //               'Light Rise | TB 18K Disposables | 18000 Puffs | Nic 5% | Pack of 5 | Banana Cake',
            //               maxLines: 2,
            //               overflow: TextOverflow.ellipsis,
            //             ))
            //           ],
            //         ),
            //         Decorations.height5,
            //         const Row(
            //           children: [Expanded(child: Text('Stock: 299'))],
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   // color: Colors.deepOrange,
            //   width: 100,
            //   height: 100,
            //   child: Center(
            //       child: Text(
            //     '\$3500',
            //     style: TextStyle(fontSize: 18),
            //   )),
            // ),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //   // color: Colors.deepPurple,
            //   width: 150,
            //   height: 100,
            //   child: Row(
            //     children: [
            //       IconButton(
            //           onPressed: onAddQuantity, icon: const Icon(Icons.add)),
            //       const Expanded(child: Center(child: Text('100'))),
            //       IconButton(
            //           onPressed: onRemoveQuantity, icon: const Icon(Icons.remove))
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   // color: Colors.green,
            //   width: 70,
            //   height: 100,
            //   child: IconButton(
            //       color: Colors.deepOrange,
            //       onPressed: onRemoveProduct,
            //       icon: const Icon(Icons.delete)),
            // ),
          ],
        ),
      ),
    );
  }

  void onRemoveProduct() {}

  void onAddQuantity() {}

  void onRemoveQuantity() {}
}
