import 'package:intl/intl.dart';
class StringFormat {
  static final _priceFormat = NumberFormat("#,##0", "en_US");

  static String decimal(int value) {
    return _priceFormat.format(value);
  }

  static String date(String? date) {
    if (date == null) {
      return "";
    }
    var dateFormat = DateFormat('dd MMM yyyy');
    return dateFormat.format(DateTime.parse(date));
  }

  static String dateWithTime(String? date) {
    if (date == null) {
      return "";
    }
    var dateFormat = DateFormat('dd MMM yyyy, H:m');
    return dateFormat.format(DateTime.parse(date));
  }

  static String dateSlashSeparator(String? date) {
    if (date == null) {
      return "";
    }
    var dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(DateTime.parse(date));
  }

  static String dateSeparators(String? date) {
    if (date == null) {
      return "";
    }
    var dateFormat = DateFormat('yyyy-MM-dd');
    return dateFormat.format(DateTime.parse(date));
  }

  static String dateMMMMYYYY(String? date) {
    if (date == null) {
      return "";
    }
    var dateFormat = DateFormat('MMMM yyyy');
    return dateFormat.format(DateTime.parse(date));
  }

  static String dataYyyyMMddTHHmmssSSSZ(String? date) {
    if (date == null) {
      return "";
    }
    String format = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
    var dateFormat = DateFormat(format);
    return dateFormat.format(DateTime.parse(date));
  }
  
  static String snackCaseToNormal(String? value) {
    String out = "";
    if (value == null) {
      return out;
    }

    //out = value.replaceAll("_", " ");
    value.split("_").forEach((e) {
      String firstUp = "${e[0].toUpperCase()}${e.substring(1)} ";
      out = out + firstUp;
    });
    return out;
  }

  static String emptyStringOnNull(String? value) {
    if (value == null) {
      return '';
    }
    return value;
  }

  static String dashOnNull(String? value) {
    if (value == null) {
      return '-';
    }
    return value;
  }

  static List<String> transformToList(String value, {String delimitter = ','}) {
    List<String> transformed = value.split(delimitter);
    return transformed.map((e) => e.trim()).toList();
  }
}
