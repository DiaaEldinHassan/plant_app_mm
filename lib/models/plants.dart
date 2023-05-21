class Plant {
  final int plantId;
  final int price;
  final String size;
  final double rating;
  final int humidity;
  final String temperature;
  final String category;
  final String plantName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Plant(
      {required this.plantId,
      required this.price,
      required this.category,
      required this.plantName,
      required this.size,
      required this.rating,
      required this.humidity,
      required this.temperature,
      required this.imageURL,
      required this.isFavorated,
      required this.decription,
      required this.isSelected});

  //List of Plants data
  static List<Plant> plantList = [
    Plant(
        plantId: 0,
        price: 22,
        category: 'Indoor',
        plantName: 'Sanseviera',
        size: 'Small',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        imageURL: 'assets/images/plant-one.png',
        isFavorated: true,
        decription:
            'Sansevieria, also known as snake plant or mother-in-law\'s tongue, is a genus of flowering plants in the family Asparagaceae. '
            'It is native to tropical regions of Africa and Asia and is a popular houseplant due to its easy maintenance and unique appearance. The plant has long, upright leaves that are often variegated with yellow or white stripes, and it produces tall spikes of small, white or greenish-white flowers. Sansevieria is known for its air-purifying properties, as it is able to remove toxins such as benzene, formaldehyde, and trichloroethylene from the air. It is also considered to be a symbol of good luck in some cultures.',
        isSelected: false),
    Plant(
        plantId: 1,
        price: 11,
        category: 'Outdoor',
        plantName: 'Philodendron',
        size: 'Medium',
        rating: 4.8,
        humidity: 56,
        temperature: '19 - 22',
        imageURL: 'assets/images/plant-two.png',
        isFavorated: false,
        decription:
            'Philodendron is a genus of tropical plants in the family Araceae. There are over 500 species of Philodendron, many of which are popular as houseplants due to their attractive foliage and ease of care.'
            'The leaves of Philodendron plants are typically large and glossy, and they come in a variety of shapes and colors, from heart-shaped leaves to long, narrow ones. Some species of Philodendron are climbers, using aerial roots to cling to trees or other surfaces in their natural habitat, while others are more compact and grow well in pots.',
        isSelected: false),
    Plant(
        plantId: 2,
        price: 18,
        category: 'Indoor',
        plantName: 'Beach Daisy',
        size: 'Large',
        rating: 4.7,
        humidity: 34,
        temperature: '22 - 25',
        imageURL: 'assets/images/plant-three.png',
        isFavorated: false,
        decription:
            'Beach Daisy, also known as Argyranthemum frutescens or Marguerite Daisy, is a perennial plant native to the Canary Islands and Madeira. It is a popular ornamental plant, prized for its profuse and colorful blooms, which resemble those of the common daisy.',
        isSelected: false),
    Plant(
        plantId: 3,
        price: 30,
        category: 'Outdoor',
        plantName: 'Big Bluestem',
        size: 'Small',
        rating: 4.5,
        humidity: 35,
        temperature: '23 - 28',
        imageURL: 'assets/images/plant-one.png',
        isFavorated: false,
        decription:
            'Big Bluestem, also known as Andropogon gerardii, is a tall, warm-season perennial grass native to North America. It is one of the dominant grasses of the tallgrass prairie ecosystem, and it is also sometimes referred to as Turkeyfoot or just Bluestem. Big Bluestem plants can grow to a height of 4 to 8 feet (1.2 to 2.4 meters), with leaves that can be up to 2 feet (60 cm) long. The plant is typically blue-green in color, with three-parted seedheads that turn a purplish-bronze color in the fall. The roots of the plant can extend up to 10 feet (3 meters) deep, making it a valuable plant for soil stabilization and erosion control.',
        isSelected: false),
    Plant(
        plantId: 4,
        price: 24,
        category: 'Recommended',
        plantName: 'Big Bluestem',
        size: 'Large',
        rating: 4.1,
        humidity: 66,
        temperature: '12 - 16',
        imageURL: 'assets/images/plant-four.png',
        isFavorated: true,
        decription:
            'Big Bluestem, also known as Andropogon gerardii, is a tall, warm-season perennial grass native to North America. It is one of the dominant grasses of the tallgrass prairie ecosystem, and it is also sometimes referred to as Turkeyfoot or just Bluestem. Big Bluestem plants can grow to a height of 4 to 8 feet (1.2 to 2.4 meters), with leaves that can be up to 2 feet (60 cm) long. The plant is typically blue-green in color, with three-parted seedheads that turn a purplish-bronze color in the fall. The roots of the plant can extend up to 10 feet (3 meters) deep, making it a valuable plant for soil stabilization and erosion control.',
        isSelected: false),
    Plant(
        plantId: 5,
        price: 24,
        category: 'Outdoor',
        plantName: 'Meadow Sage',
        size: 'Medium',
        rating: 4.4,
        humidity: 36,
        temperature: '15 - 18',
        imageURL: 'assets/images/plant-five.png',
        isFavorated: false,
        decription:
            'Meadow Sage, also known as Salvia pratensis, is a herbaceous perennial plant native to Europe and Asia. It is a member of the mint family and is related to other plants in the Salvia genus, such as culinary sage. Meadow Sage plants typically grow to a height of 1 to 3 feet (30 to 90 cm) and have blue to violet-purple flowers that bloom from late spring to midsummer. The flowers are arranged in whorls on spikes above the foliage, and they attract bees, butterflies, and other pollinators. The leaves of the plant are green and elongated, with a slightly fuzzy texture.',
        isSelected: false),
    Plant(
        plantId: 6,
        price: 19,
        category: 'Garden',
        plantName: 'Plumbago',
        size: 'Small',
        rating: 4.2,
        humidity: 46,
        temperature: '23 - 26',
        imageURL: 'assets/images/plant-six.png',
        isFavorated: false,
        decription:
            'Plumbago is a genus of flowering plants, which includes around 10-20 species of shrubs and climbers. The most commonly cultivated species is Plumbago auriculata, which is also known as Cape Leadwort, Skyflower or Blue Plumbago. Plumbago plants are native to South Africa, and they are widely cultivated as ornamental plants in many parts of the world. They typically have blue or white flowers, which are borne in clusters at the end of the stems. The leaves are usually glossy green and ovate to lanceolate in shape.',
        isSelected: false),
    Plant(
        plantId: 7,
        price: 23,
        category: 'Garden',
        plantName: 'Tritonia',
        size: 'Medium',
        rating: 4.5,
        humidity: 34,
        temperature: '21 - 24',
        imageURL: 'assets/images/plant-seven.png',
        isFavorated: false,
        decription:
            'Tritonia is a genus of flowering plants in the family Iridaceae, native to southern Africa. The genus includes around 18-20 species of herbaceous perennials that are often cultivated as ornamental plants for their showy, trumpet-shaped flowers. Tritonia plants typically have narrow, sword-shaped leaves and bear spikes or racemes of brightly colored flowers, usually in shades of yellow, orange, red, or pink. The flowers have six petals, with one petal often being marked with a contrasting color or pattern. The flowers bloom in spring or summer, depending on the species, and are highly attractive to pollinators such as bees and butterflies.',
        isSelected: false),
    Plant(
        plantId: 8,
        price: 46,
        category: 'Recommended',
        plantName: 'Tritonia',
        size: 'Medium',
        rating: 4.7,
        humidity: 46,
        temperature: '21 - 25',
        imageURL: 'assets/images/plant-eight.png',
        isFavorated: false,
        decription:
            'Tritonia is a genus of flowering plants in the family Iridaceae, native to southern Africa. The genus includes around 18-20 species of herbaceous perennials that are often cultivated as ornamental plants for their showy, trumpet-shaped flowers. Tritonia plants typically have narrow, sword-shaped leaves and bear spikes or racemes of brightly colored flowers, usually in shades of yellow, orange, red, or pink. The flowers have six petals, with one petal often being marked with a contrasting color or pattern. The flowers bloom in spring or summer, depending on the species, and are highly attractive to pollinators such as bees and butterflies.',
        isSelected: false),
  ];

  //Get the favorated items
  static List<Plant> getFavoritedPlants() {
    List<Plant> _travelList = Plant.plantList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  static List<Plant> addedToCartPlants() {
    List<Plant> _selectedPlants = Plant.plantList;
    return _selectedPlants
        .where((element) => element.isSelected == true)
        .toList();
  }
}
