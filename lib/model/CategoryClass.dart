class CategoryClass {
  CategoryClass({
    required this.name,
    required this.icon,
    required this.height,
  });
  String name;
  String icon;
  final double height;
}

List<CategoryClass> category = [
  CategoryClass(
      name: 'Health Food & Drinks', icon: 'images/horlicks.png', height: 150),
  CategoryClass(name: 'Covid Essentials', icon: 'images/mask.png', height: 80),
  CategoryClass(
      name: 'Baby & Mom Care', icon: 'images/babylotion.png', height: 130),
  CategoryClass(name: 'Women Care', icon: 'images/fairlovely.png', height: 150),
  CategoryClass(
      name: 'LifeStyle Ailments', icon: 'images/nicotex.png', height: 100),
  CategoryClass(name: 'Ortho Care', icon: 'images/vicks.png', height: 100),
];
