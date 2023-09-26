class People{
  final String name, image;
  final bool isActive;

  People({
    this.name = '',
    this.image = '',
    this.isActive = false
  });
}

List<dynamic> peoles = [
  ['Sam', 'assets/images/girl1.jpg'],
  ['Ro', 'assets/images/girl2.jpg'],
  ['Tuan', 'assets/images/girl1.jpg'],
  ['Ro', 'assets/images/girl2.jpg'],
  ['Tuan', 'assets/images/girl3.jpg'],
];
List<People> dataPeoles = [
  People(
    name: 'Emma',
    image: 'assets/images/girl1.jpg',
    isActive: true,
  ),
  People(
    name: 'David',
    image: 'assets/images/girl3.jpg',
    isActive: false,
  ),
  People(
    name: 'Join',
    image: 'assets/images/human3.jpg',
    isActive: true,
  ),
  People(
    name: 'Harry',
    image: 'assets/images/human2.jpg',
    isActive: false,
  ),
  People(
    name: 'Tony',
    image: 'assets/images/human1.jpg',
    isActive: false,
  ),

];
