var _index = 0;

class FidgetImage {
  const FidgetImage({required this.path});  

  final String path;

  factory FidgetImage.any()  {
    var path = 'assets/images/fashion';
    switch (_index++ % 4) {
      case 0: path = '${path}01.jpg';
      case 1: path = '${path}02.webp';
      case 2: path = '${path}03.jpg';
      case 3: path = '${path}04.webp';
    }
    return FidgetImage(path: path);    
  }
}




