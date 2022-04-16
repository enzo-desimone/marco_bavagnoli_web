import 'package:easy_localization/easy_localization.dart';

enum CategoryCard { android, blackBerry, flutterPlugins }

class PortfolioItem {
  String? _title;
  String? _description;
  String? _image;
  CategoryCard? _category;
  String? _link;

  PortfolioItem({title, description, image, category, link}) {
    _title = title;
    _description = description;
    _image = image;
    _category = category;
    _link = link;
  }

  @override
  String toString() {
    return '{$_title, $_description, $_image, $_category, $_link}';
  }

  String? get title => _title;

  set setTable(String value) {
    _title = value;
  }

  String? get description => _description;

  set setDescription(String value) {
    _description = value;
  }

  String? get image => _image;

  set setImage(String value) {
    _image = value;
  }

  String? get link => _link;

  set setLink(String value) {
    _link = value;
  }

  CategoryCard? get categoryCard => _category;

  set setCategory(CategoryCard value) {
    _category = value;
  }

  static getNameCategory(CategoryCard category) {
    if (category == CategoryCard.android) {
      return '_android'.tr();
    } else if (category == CategoryCard.blackBerry) {
      return '_blackBerry'.tr();
    } else {
      return '_flutterPlugins'.tr();
    }
  }
}
