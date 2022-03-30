import 'package:artistcommerce/services/firebase_services.dart';

import '../models/product.dart';

class Utils {
  Utils();
  static List<Product> cartData = [];
  static bool checkUser() {
    final user = FirebaseService.auth.currentUser;
    return user != null ? true : false;
  }

  static List<Map<String, dynamic>> product = [
    {
      "id": 1,
      "name": "Sunset Scenery",
      "imageURL":
          "https://i.pinimg.com/736x/cb/c6/62/cbc662299bd35357e519fe867444b86c.jpg",
      "brand": "Jagmohan Rai",
      "price": 20
    },
    {
      "id": 8,
      "name": "music dolls",
      "imageURL":
          "https://assets.entrepreneur.com/content/3x2/2000/20170525060201-bright-1866717-1920.jpeg",
      "brand": "Rishabh kumar",
      "price": 10
    },
    {
      "id": 2,
      "name": "Moon Light",
      "imageURL": "https://i.ytimg.com/vi/MRfIkTwUxIw/maxresdefault.jpg",
      "brand": "Rishabh Kumar",
      "price": 29
    },
    {
      "id": 3,
      "name": "Master Piece",
      "imageURL": "https://m.media-amazon.com/images/I/81N+c2GkhuL._SX569_.jpg",
      "brand": "Satyajeet sen",
      "price": 19
    },
    {
      "id": 4,
      "name": "Wall Painting",
      "imageURL":
          "https://cdn.shopify.com/s/files/1/1306/4195/products/wallmantra-big-painting-night-and-day-fantasy-scenery-canvas-painting-30133331820710.jpg?v=1628505522",
      "brand": "Neetu Garg",
      "price": 23
    },
    {
      "id": 5,
      "name": "Wall hanger",
      "imageURL":
          "https://www.indune.com/image/cache/catalog/l01ihb/ihb/IHB041004d-550x550.jpg",
      "brand": "Jagmohan Rai",
      "price": 45
    },
    {
      "id": 9,
      "name": "Necklace",
      "imageURL":
          "https://cdn.shopclues.com/images1/thumbnails/114882/320/320/152584354-114882836-1627845611.jpg",
      "brand": "Rishabh kumar",
      "price": 40
    },
    {
      "id": 6,
      "name": "Wall lamp",
      "imageURL":
          "https://ii1.pepperfry.com/media/catalog/product/h/a/800x880/handicraft-kottage-handmade-antique-decorative-wall-lamp-handicraft-kottage-handmade-antique-decorat-xlb5h5.jpg",
      "brand": "Jagmohan ",
      "price": 90
    },
    {
      "id": 7,
      "name": "Antic Piece",
      "imageURL":
          "https://cdn.shopify.com/s/files/1/0532/2453/8267/products/il_fullxfull.3539976418_gjx0_1445x.jpg?v=1647039330",
      "brand": "Jagmohan",
      "price": 50
    },
  ];
}
