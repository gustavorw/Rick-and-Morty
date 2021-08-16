class CharacterEntity {
  final String name;
  final String status;
  final String image;
  CharacterEntity(
    this.name,
    this.status,
    this.image,
  );

  CharacterEntity copyWith({
    String name,
    String status,
    String image,
  }) {
    return CharacterEntity(
      name ?? this.name,
      status ?? this.status,
      image ?? this.image,
    );
  }
}
