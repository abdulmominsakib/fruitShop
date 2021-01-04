class FruitItem {
  final String fruitName, price, weight, image;
  final int colorCode;
  FruitItem(
      {this.fruitName, this.price, this.colorCode, this.weight, this.image});
}

List<FruitItem> allFruits = [
  FruitItem(
    fruitName: 'Strawberry',
    price: '2.45',
    weight: '1 lb',
    image: 'strawberry',
    colorCode: 0xFFFFE3E5,
  ),
  FruitItem(
    fruitName: 'Pineapple',
    price: '1.52 each',
    weight: '',
    image: 'pineapple',
    colorCode: 0xFFFFFBD8,
  ),
  FruitItem(
    fruitName: 'Blueberries',
    price: '4.07',
    weight: '1 lb',
    image: 'blueberries',
    colorCode: 0xFFE4E4FE,
  ),
  FruitItem(
    fruitName: 'Dragon Fruit',
    price: '5.36',
    weight: 'Average 0.87 lb',
    image: 'dragon-fruit',
    colorCode: 0xFFFFEEFE,
  ),
  FruitItem(
    fruitName: 'Lychee',
    price: '8.22 per lb',
    weight: '1 lb',
    image: 'lychee',
    colorCode: 0xFFD8FFD0,
  ),
  FruitItem(
    fruitName: 'Mango',
    price: '1.01 each',
    weight: '',
    image: 'mango',
    colorCode: 0xFFFFE08E,
  ),
];
