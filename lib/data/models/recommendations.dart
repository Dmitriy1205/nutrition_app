class Recommendations {
  final String phase;
  final String description;
  final String proteins;
  final String grains;
  final String fruitsAndVeggies;
  final String fats;
  final String other;

  Recommendations({
    required this.phase,
    required this.description,
    required this.proteins,
    required this.grains,
    required this.fruitsAndVeggies,
    required this.fats,
    required this.other,
  });
}

List<Recommendations> recommendationsList = [
  Recommendations(
    phase: 'Menstrual Phase',
    description:
        '''Take time for planning, journaling, and creating a stress-free environment to relax. Expect an energy boost as estrogen levels rise after the initial 2-3 days. Restore Iron levels in your body. Support absorption of non-heme Iron sources with Vitamin C rich foods.''',
    proteins: 'Chickpeas, Beef, Eggs, Sardines, Salmon, Liver, Lamb',
    grains: 'Brown Pasta, Brown rice, Whole Grain Bread, Quinoa',
    fruitsAndVeggies:
        'Kale, Arugula, Orange, Broccoli, Red Pepper, Grapes, Blueberries, Carrots, Sweet Potato, Spinach, Beet, Yellow Pepper',
    fats: 'Pumpkin Seeds, Ghee, Brazil Nuts',
    other: 'Dark Chocolate, Cocoa',
  ),
  Recommendations(
    phase: 'Follicular Phase',
    description:
        '''Your estrogen levels are rising as well as your mood and enegry. This is the time for meetings, communication, new desires, and achievements. On the hormonal rise, you are the rocket! Support your gut health with variety of fiber-rich veggies, fruits, grains and fermented foods. ''',
    proteins:
        'Chicken, Turkey, Tuna, Salmon, Trout, Eggs, Oysters, Lentils, Yogurt',
    grains: 'Whole Grain Bread, Quinoa, Wild Rice, Farro',
    fruitsAndVeggies:
        'Apple, Orange, Kiwi, Broccoli, Mango, Carrots, Eggplant, Sweet Potato, Cauliflower, Lentils, Pomegrante, Beet',
    fats: 'Almonds, Sesame Seeds, Olives, Avocado',
    other: 'Kimchi, Sauerkraut, Mushrooms',
  ),
  Recommendations(
    phase: 'Ovulatory Phase',
    description:
        '''Embrace your radiant energy and confidence. With estrogen enhancing your skin and hair's glow. Now is the ideal time for presentations, and a vibrant social life. Support your hormonal production with high-quality fats.''',
    proteins:
        'Salmon, Anchovies, Greek Yogurt, Chickpeas, Tuna, Sardines, Eggs, Mackerel, Tofu',
    grains: 'Oats, Barley, Spelt, Bulgur',
    fruitsAndVeggies:
        'Celery, Pineapple, Asparagus, Swiss Chard, Carrots, Kale, Raspberries, Bell Pepper, Brussels sprouts, Kiwis, Grapefruit',
    fats:
        'Avocado, Almonds, Olive oil, Hazelnuts, Coconut Oil, Sunflower Seeds, Butter',
    other: 'Mushrooms, Greens',
  ),
  Recommendations(
    phase: 'Luteal Phase',
    description:
        '''During hormonal shifts, you might experience PMS symptoms, lower energy, and reduced social inclination. It's an opportune time to review project processes and engage in focused work. Balance your energy levels by reducing caffeine and sugar intake. Magnesium and B Vitamins rich foods can promote better mood and lessen PMS symptoms. ''',
    proteins:
        'Beef, Liver, Chicken, Salmon, Lentils, Sardines, Tuna, Turkey, Shrimps, Cod, Kidney Beans',
    grains: 'Buckwheat, Chia seeds, Quinoa, Whole Wheat Pasta, Brown Rice',
    fruitsAndVeggies:
        'Sweet Potatoes, Pumpkin, Strawberries, Tomatoes, Bell Peppers, Kale, Oranges, Banana, Spinach, Broccoli',
    fats:
        'Flaxseeds, Brazil Nuts, Cashews, Ghee, Walnuts, Hemp seeds, Pistachios',
    other: 'Seaweed, Leafy Greens',
  ),
];
