class Seed {
  Seed({
    required this.seed,
    required this.expiresAt,
  });
  late final String seed;
  late final String expiresAt;

  Seed.fromJson(Map<String, dynamic> json) {
    seed = json['seed'];
    expiresAt = json['expiresAt'];
  }
}
