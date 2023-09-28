class InterestProfile{
  final String name;
  bool isSelect;
  
  InterestProfile({
    required this.name,
    required this.isSelect
   });
}

List<InterestProfile> interestprofile = [
  InterestProfile(name: 'Travelling', isSelect: false),
  InterestProfile(name: 'Books', isSelect: false),
  InterestProfile(name: 'Music', isSelect: false),
  InterestProfile(name: 'Dancing', isSelect: false),
  InterestProfile(name: 'Modeling', isSelect: false),
];