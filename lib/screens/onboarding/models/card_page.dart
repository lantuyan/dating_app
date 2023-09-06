class CardPage{
  final int id;
  final String title;
  final String image;
  final String description;

  CardPage({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
  });
}

List<CardPage> cardpages = [
  CardPage(
      id: 1,
      title: 'Matches',
      image: 'assets/images/girl1.jpg',
      description: 'We match you with people that have a large array of similar interests'
  ),
  CardPage(
      id: 2,
      title: 'Algorithm',
      image: 'assets/images/girl2.jpg',
      description: 'Users going through a vetting process to ensure you never match with bots'
  ),
  CardPage(
      id: 3,
      title: 'Premium',
      image: 'assets/images/girl3.jpg',
      description: 'Sign up today and enjoy the first month of premium benefits on us.'

  )
];
