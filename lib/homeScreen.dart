import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fruitshop/fruitData.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF303030),
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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading Title
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Fruits And Berries',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Search Box
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black87,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Search',
                          style:
                              TextStyle(color: Colors.black38.withOpacity(0.3)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Fruit List
                  Container(
                    height: 600,
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: allFruits.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FruitCard(fruitItem: allFruits[index]);
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FruitCard extends StatelessWidget {
  const FruitCard({
    Key key,
    @required this.fruitItem,
  }) : super(key: key);

  final FruitItem fruitItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Color(fruitItem.colorCode),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              fruitItem.fruitName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            child: Text('${fruitItem.weight}'),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
              child: Text(
                '\$${fruitItem.price}',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/${fruitItem.image}.png',
              fit: BoxFit.contain,
              width: 100,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(fruitItem.colorCode).withRed(5),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topLeft: Radius.circular(15))),
              height: 30,
              width: 50,
              child: Icon(
                Icons.check_rounded,
                color: Colors.black38,
              ),
            ),
          )
        ],
      ),
    );
  }
}
