import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fruitshop/detailsScreen.dart';
import 'package:fruitshop/fruitData.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              /* <--------------- Appbar ---------------> */
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xFF303030),
                          size: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.menu,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

              /* <--------------- Title ---------------> */
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
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    /* <--------------- Search Box ---------------> */
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
                            style: TextStyle(
                                color: Colors.black38.withOpacity(0.3)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              /* <--------------- Fruit List ---------------> */
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: allFruits.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FruitCard(
                        fruitItem: allFruits[index],
                        heroTag: 'Item $index}',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FruitDetails(
                                        fruitItem: allFruits[index],
                                        index: index,
                                      )));
                        },
                      );
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
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

class FruitCard extends StatelessWidget {
  const FruitCard({
    Key key,
    @required this.fruitItem,
    @required this.onTap,
    @required this.heroTag,
  }) : super(key: key);

  final FruitItem fruitItem;
  final Function onTap;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
            fruitItem.weight == ''
                ? SizedBox()
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Text(fruitItem.weight),
                  ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                child: Text(
                  '\$${fruitItem.price}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            Align(
              alignment: Alignment.center,
              child: Hero(
                tag: heroTag,
                child: Image.asset(
                  'assets/images/${fruitItem.image}.png',
                  fit: BoxFit.contain,
                  width: 100,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.15),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(15))),
                height: 30,
                width: 50,
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
