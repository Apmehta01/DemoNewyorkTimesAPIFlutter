class TopStoriesData {
  String? status;
  String? copyright;
  String? section;
  String? lastUpdated;
  int? numResults;
  List<Results>? results;

  TopStoriesData(
      {this.status,
        this.copyright,
        this.section,
        this.lastUpdated,
        this.numResults,
        this.results});

  TopStoriesData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    copyright = json['copyright'];
    section = json['section'];
    lastUpdated = json['last_updated'];
    numResults = json['num_results'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['copyright'] = copyright;
    data['section'] = section;
    data['last_updated'] = lastUpdated;
    data['num_results'] = numResults;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? section;
  String? subsection;
  String? title;
  String? abstract;
  String? url;
  String? uri;
  String? byline;
  String? itemType;
  String? updatedDate;
  String? createdDate;
  String? publishedDate;
  String? materialTypeFacet;
  String? kicker;
  List<String>? desFacet;
  List<String>? orgFacet;
  List<String>? perFacet;
  List<String>? geoFacet;
  List<Multimedia>? multimedia;
  String? shortUrl;

  Results(
      {this.section,
        this.subsection,
        this.title,
        this.abstract,
        this.url,
        this.uri,
        this.byline,
        this.itemType,
        this.updatedDate,
        this.createdDate,
        this.publishedDate,
        this.materialTypeFacet,
        this.kicker,
        this.desFacet,
        this.orgFacet,
        this.perFacet,
        this.geoFacet,
        this.multimedia,
        this.shortUrl});

  Results.fromJson(Map<String, dynamic> json) {
    section = json['section'];
    subsection = json['subsection'];
    title = json['title'];
    abstract = json['abstract'];
    url = json['url'];
    uri = json['uri'];
    byline = json['byline'];
    itemType = json['item_type'];
    updatedDate = json['updated_date'];
    createdDate = json['created_date'];
    publishedDate = json['published_date'];
    materialTypeFacet = json['material_type_facet'];
    kicker = json['kicker'];
    desFacet = json['des_facet'].cast<String>();
    orgFacet = json['org_facet'].cast<String>();
    perFacet = json['per_facet'].cast<String>();
    geoFacet = json['geo_facet'].cast<String>();
    if (json['multimedia'] != null) {
      multimedia = <Multimedia>[];
      json['multimedia'].forEach((v) {
        multimedia!.add(Multimedia.fromJson(v));
      });
    }
    shortUrl = json['short_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['section'] = section;
    data['subsection'] = subsection;
    data['title'] = title;
    data['abstract'] = abstract;
    data['url'] = url;
    data['uri'] = uri;
    data['byline'] = byline;
    data['item_type'] = itemType;
    data['updated_date'] = updatedDate;
    data['created_date'] = createdDate;
    data['published_date'] = publishedDate;
    data['material_type_facet'] = materialTypeFacet;
    data['kicker'] = kicker;
    data['des_facet'] = desFacet;
    data['org_facet'] = orgFacet;
    data['per_facet'] = perFacet;
    data['geo_facet'] = geoFacet;
    if (multimedia != null) {
      data['multimedia'] = multimedia!.map((v) => v.toJson()).toList();
    }
    data['short_url'] = shortUrl;
    return data;
  }
}

class Multimedia {
  String? url;
  String? format;
  int? height;
  int? width;
  String? type;
  String? subtype;
  String? caption;
  String? copyright;

  Multimedia(
      {this.url,
        this.format,
        this.height,
        this.width,
        this.type,
        this.subtype,
        this.caption,
        this.copyright});

  Multimedia.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    format = json['format'];
    height = json['height'];
    width = json['width'];
    type = json['type'];
    subtype = json['subtype'];
    caption = json['caption'];
    copyright = json['copyright'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['format'] = format;
    data['height'] = height;
    data['width'] = width;
    data['type'] = type;
    data['subtype'] = subtype;
    data['caption'] = caption;
    data['copyright'] = copyright;
    return data;
  }
}
