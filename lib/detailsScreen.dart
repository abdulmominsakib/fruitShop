import 'package:flutter/material.dart';
import 'package:fruitshop/fruitData.dart';

class FruitDetails extends StatelessWidget {
  final FruitItem fruitItem;
  final int index;

  const FruitDetails({Key key, @required this.fruitItem, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(fruitItem.colorCode),
      /* <--------------- A Example of Transparent Appbar ---------------> */
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF303030),
              size: 15,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.menu,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          /* <--------------- Image Of the Fruit ---------------> */
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Hero(
                tag: 'Item $index}',
                child: Image.asset('assets/images/${fruitItem.image}.png')),
          ),
          /* <--------------- Details of Fruit ---------------> */
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 30, left: 30, right: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    fruitItem.fruitName,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  fruitItem.weight == ''
                      ? SizedBox()
                      : Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            fruitItem.weight,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                        ),
                  SizedBox(height: 20),
                  /* <--------------- Quantity ---------------> */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF8F8F8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.remove),
                            Text('1'),
                            Icon(Icons.add),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '\$ ${fruitItem.price}',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Product Description',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                        '''Mangos are the national pastime in the Caribbean. Each village passionately claims they grow the best mango and that every man, women and child has their own favorite. The locals hold the mango in reverence as if it where the key to the universe.
                    '''),
                  ),
                  /* <-----------------------> 
                              Button
                   <-----------------------> */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(fruitItem.colorCode),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Color(fruitItem.colorCode),
                          size: 40,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 15),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Color(fruitItem.colorCode),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            'Add To Cart',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
