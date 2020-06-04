class RickAndMorty {
  Info info;
  List<Character> characters;

  RickAndMorty({this.info, this.characters});

  RickAndMorty.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    if (json['results'] != null) {
      characters = new List<Character>();
      json['results'].forEach((v) {
        characters.add(new Character.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    if (this.characters != null) {
      data['results'] = this.characters.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  int count;
  int pages;
  String next;
  String prev;

  Info({this.count, this.pages, this.next, this.prev});

  Info.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = json['prev'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['pages'] = this.pages;
    data['next'] = this.next;
    data['prev'] = this.prev;
    return data;
  }
}

class Character {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Origin origin;
  Origin location;
  String image;
  List<String> episode;
  String url;
  String created;

  Character(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created});

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'] == null? "unknown": json['id'];
    name = json['name'] == null? 'unknown': json['name'];
    status = json['status'] == null? "unknown": json['status'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;    
    data['image'] = this.image;

    return data;
  }
}

class Origin {
  String name;
  String url;

  Origin({this.name, this.url});

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'] == null? "unknown": json['name'];
    url = json['url'] == null ? "unknown": json['url'] ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name == null ? "unknown":data['name'];
    data['url'] = this.url == null ? "unknown": data['url']; 
    return data;
  }
}