class ExtendsItem {
  final String key;
  final String value;

  ExtendsItem({ this.key, this.value });
}

class ModelShare {
  final String id;
  final String createdAt;
  final String updatedAt;
  final List<ExtendsItem> exts;

  ModelShare(this.id, this.createdAt, this.updatedAt, this.exts);
}

class Setting extends ModelShare {
  Map<String, Object> site;

  Setting(String id, String createdAt, String updatedAt, List<ExtendsItem> exts, {
    this.site
  }) : super(id, createdAt, updatedAt, exts);
}

class Category extends ModelShare {
  final String name;
  final String description;
  
  Category(String id, String createdAt, String updatedAt, List<ExtendsItem> exts, {
    this.name,
    this.description,
  }) : super(id, createdAt, updatedAt, exts);
}
