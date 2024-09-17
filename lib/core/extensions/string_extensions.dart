extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension StringParser on String {
  String getMediaType() => split('/').last.split('.').last;

  String getMediaName() => split('/').last.split('.').first;
}
