class Player {
  final String id;
  final String name;
  int health;
  int score;

  Player({required this.id, required this.name, this.health = 100, this.score = 0});

  void updateScore(int points) {
    score += points;
  }

  void receiveDamage(int damage) {
    health -= damage;
  }
}
