class Seed {
  Seed({
    required this.seed,
    required this.expiresAt,
  });
  late final String seed;
  late final String expiresAt;

//Creates a new seed by mapping a json response from the server to a new seed object
  Seed.fromJson(Map<String, dynamic> json) {
    seed = json['seed'];
    expiresAt = json['expiresAt'];
  }
}
