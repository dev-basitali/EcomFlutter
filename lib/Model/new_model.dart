class ProductDetail {
  int id;
  String image;
  String name;
  double price;
  double oldPrice;
  double rate;
  String deliveryTime;
  String description;

  ProductDetail({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.rate,
    required this.deliveryTime,
    required this.description,
  });
}

List<ProductDetail> storeItems = [
  ProductDetail(
    id: 1,
    image:
    'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    name: 'Camera',
    price: 120,
    rate: 4.5,
    deliveryTime: '36H',
    description:
    "This avocado salad is a delicious combination of ripe avocados, sweet onions, fresh tomatoes, and cilantro. This recipe is so easy to make and very colorful — I think you'll like it! This avocado salad recipe is full of bold, fresh flavor and color.",
    oldPrice: 200,
  ),
  ProductDetail(
      id: 2,
      image:
      'https://c8.alamy.com/comp/F2F1E4/royal-hamburger-isolated-F2F1E4.jpg',
      name: 'Royal Burger',
      price: 20,
      rate: 5.0,
      deliveryTime: '1D',
      description:
      "A Royal burger is a patty of ground beef grilled and placed between two halves of a bun. Slices of raw onion, lettuce, bacon, mayonnaise, and other ingredients add flavor. Burgers are considered an American food but are popular around the world.",
      oldPrice: 25),
  ProductDetail(
    id: 3,
    image:
    'https://www.modernhoney.com/wp-content/uploads/2023/05/Fruit-Salad-10.jpg',
    name: 'Fruit Salad',
    price: 12,
    rate: 4.6,
    deliveryTime: '2D',
    description:
    "Fruit salad is a dish consisting of various kinds of fruit, sometimes served in a liquid, either their juices or a syrup. In different forms, fruit salad can be served as an appetizer or a side as a salad. A fruit salad is sometimes known as a fruit cocktail, or fruit cup.",
    oldPrice: 18,
  ),
  ProductDetail(
    id: 4,
    image:
    'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/the-health-benefits-of-nuts-main-image-700-350-bb95ac2.jpg?resize=768,574',
    name: 'Mix Nut',
    price: 30,
    rate: 5.0,
    deliveryTime: '12H',
    description:
    "Mixed nuts are a snack food consisting of any mixture of mechanically or manually combined nuts. Common constituents are peanuts, almonds, walnuts, Brazil nuts, cashews, hazelnuts, and pecans. Mixed nuts may be salted, roasted, cooked, or blanched.",
    oldPrice: 45,
  ),
  ProductDetail(
    id: 5,
    image:
    "https://www.eatingbirdfood.com/wp-content/uploads/2023/02/strawberry-protein-shake-hero-new-cropped.jpg",
    name: 'Protein Shake',
    price: 50,
    rate: 4.8,
    deliveryTime: '5D',
    description:
    "This strawberry protein shake is creamy, easy to whip up and tastes like a milkshake, but is made",
    oldPrice: 75,
  ),
  ProductDetail(
    id: 1,
    image: "https://m.media-amazon.com/images/I/61LojzJ+PuL._SL1000_.jpg",
    name: 'Dairy Milk',
    price: 05,
    rate: 5.0,
    deliveryTime: '7D',
    description:
    "Shop Cadbury Dairy Milk Silk Chocolate Bar, 150g Pack of 3 online at a best price in Nepal. Get special offers, deals, discounts & fast delivery ...",
    oldPrice: 10,
  ),
];