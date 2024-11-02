import 'package:lorem_ipsum/lorem_ipsum.dart';


class Product {
  int id;
  String name;
  String imageThumbnail;
  String price;
  String status;
  double rating;
  List<String>imageUrls;
  String nameCharacter;
  String nameSeries;
  int totalReviews;
  int totalSold;
  String textDescription;

  Product({
    required this.id,
    required this.name,
    required this.imageThumbnail,
    required this.price,
    required this.status,
    required this.rating,
    required this.imageUrls,
    required this.nameCharacter,
    required this.nameSeries,
    required this.totalReviews,
    required this.totalSold,
    required this.textDescription
});
}

var productList = [
  Product(
    id: 1,
    name: "[Momiji SALE] Coreful Figure Elaina - Wedding Dress Ver. Majo no Tabitabi (19cm)",
    imageThumbnail: 'images/elaina-wedding.webp',
    price: "269,000",
    status: "Ready",
    rating: 5.0,
    imageUrls: [
      "https://cdn.kyou.id/items/261180-coreful-figure-elaina-dress-ver-majo-no-tabitabi.jpg.webp",
      "https://cdn.kyou.id/items/261942-coreful-figure-elaina-dress-ver-majo-no-tabitabi.jpg.webp",
      "https://cdn.kyou.id/items/261181-coreful-figure-elaina-dress-ver-majo-no-tabitabi.jpg.webp",
      "https://cdn.kyou.id/items/261182-coreful-figure-elaina-dress-ver-majo-no-tabitabi.jpg.webp",
      "https://cdn.kyou.id/items/261183-coreful-figure-elaina-dress-ver-majo-no-tabitabi.jpg.webp"
    ],
    nameCharacter: "Elaina / Mileina Cerestria",
    nameSeries: "Majo no Tabitabi",
    totalReviews: 123,
    totalSold: 213,
    textDescription: loremIpsum(paragraphs: 5, words: 500),
  ),
  Product(
    id:2,
    name: "[Momiji SALE] Coreful Figure Elaina - Kimono / Wasou Ver. Majo no Tabitabi",
    imageThumbnail: 'images/elaina-kimono.webp',
    price: "389,000",
    status: "Sold Out",
    rating: 4.9,
    imageUrls: [
      "https://cdn.kyou.id/items/100334-coreful-figure-elaina-majo-no-tabitabi.jpg.webp",
      "https://cdn.kyou.id/items/98758-coreful-figure-elaina-majo-no-tabitabi.jpg.webp",
      "https://cdn.kyou.id/items/98757-coreful-figure-elaina-majo-no-tabitabi.jpg.webp",
      "https://cdn.kyou.id/items/92789-coreful-figure-elaina-majo-no-tabitabi.jpg.webp",
      "https://cdn.kyou.id/items/98759-coreful-figure-elaina-majo-no-tabitabi.jpg.webp"
    ],
    nameCharacter: "Elaina / Mileina Cerestria",
    nameSeries: "Majo no Tabitabi",
    totalReviews: 123,
    totalSold: 213,
    textDescription: loremIpsum(paragraphs: 2, words: 100),
  ),
  Product(
    id: 3,
    name: "[Momiji SALE] Coreful Figure Elaina - Budomimi no Otome Ver. (18cm)",
    imageThumbnail: 'images/elaina-red.webp',
    price: "309,000",
    status: "Pre-order",
    rating: 4.8,
    imageUrls: [
      "https://cdn.kyou.id/items/169205-coreful-figure-elaina-budomimi-no-otome-ver-18cm.jpg.webp",
      "https://cdn.kyou.id/items/169212-coreful-figure-elaina-budomimi-no-otome-ver-18cm.jpg.webp",
      "https://cdn.kyou.id/items/169213-coreful-figure-elaina-budomimi-no-otome-ver-18cm.jpg.webp",
      "https://cdn.kyou.id/items/169214-coreful-figure-elaina-budomimi-no-otome-ver-18cm.jpg.webp",
      "https://cdn.kyou.id/items/169215-coreful-figure-elaina-budomimi-no-otome-ver-18cm.jpg.webp",
      "https://cdn.kyou.id/items/169216-coreful-figure-elaina-budomimi-no-otome-ver-18cm.jpg.webp",
    ],
    nameCharacter: "Elaina / Mileina Cerestria",
    nameSeries: "Majo no Tabitabi",
    totalReviews: 856,
    totalSold: 345,
    textDescription: loremIpsum(paragraphs: 2, words: 100),
  ),

  // Alya
  Product(
    id: 4,
    name: "Premium Chokonose Figure Alya / Alisa Mikhailovna Kujou - Pajamas Ver. Alya Sometimes Hides Her Feelings in Russian / Tokidoki Bosotto Russia-go de Dereru Tonari no Alya-san (14cm)",
    imageThumbnail: 'images/alya-pajamas.webp',
    price: "320,000",
    status: "Ready",
    rating: 5.0,
    imageUrls: [
      "https://cdn.kyou.id/items/324058-premium-chokonose-figure-alya-alisa-mikhailovna-kujou-pajamas-ver-alya-sometimes-hides-her-feelings-in-russian-tokidoki-bosotto-russia-go-de-dereru-tonari-no-alya-san-14cm.jpg.webp",
      "https://cdn.kyou.id/items/324060-premium-chokonose-figure-alya-alisa-mikhailovna-kujou-pajamas-ver-alya-sometimes-hides-her-feelings-in-russian-tokidoki-bosotto-russia-go-de-dereru-tonari-no-alya-san-14cm.jpg.webp",
      "https://cdn.kyou.id/items/324061-premium-chokonose-figure-alya-alisa-mikhailovna-kujou-pajamas-ver-alya-sometimes-hides-her-feelings-in-russian-tokidoki-bosotto-russia-go-de-dereru-tonari-no-alya-san-14cm.jpg.webp",
      "https://cdn.kyou.id/items/324062-premium-chokonose-figure-alya-alisa-mikhailovna-kujou-pajamas-ver-alya-sometimes-hides-her-feelings-in-russian-tokidoki-bosotto-russia-go-de-dereru-tonari-no-alya-san-14cm.jpg.webp",
    ],
    nameCharacter: "Alisa Mikhailovna Kujou",
    nameSeries: "Tokidoki Bosotto Russia-go de Dederu Tonari no Alya-san",
    totalReviews: 256,
    totalSold: 457,
    textDescription: loremIpsum(paragraphs: 2, words: 100),
  ),
  Product(
    id: 5,
    name: "Alya Sometimes Hides Her Feelings in Russian Alya Big Acrylic Stand with Parts",
    imageThumbnail: 'images/alya-casual.webp',
    price: "270,000",
    status: "Sold Out",
    rating: 4.9,
    imageUrls: [
      "https://cdn.kyou.id/items/340384-alya-sometimes-hides-her-feelings-in-russian-alya-big-acrylic-stand-with-parts.jpg.webp"
    ],
    nameCharacter: "Alisa Mikhailovna Kujou",
    nameSeries: "Tokidoki Bosotto Russia-go de Dederu Tonari no Alya-san",
    totalReviews: 457,
    totalSold: 643,
    textDescription: loremIpsum(paragraphs: 2, words: 100),
  ),
  Product(
    id: 6,
    name: "Alya Sometimes Hides Her Feelings in Russian Acrylic Chara Stand Alya Valentine Ver.",
    imageThumbnail: 'images/alya-uniform.webp',
    price: "290,000",
    status: "Pre-order",
    rating: 4.8,
    imageUrls: [
      "https://cdn.kyou.id/items/336384-alya-sometimes-hides-her-feelings-in-russian-acrylic-chara-stand-alya-valentine-ver.jpg.webp",
    ],
    nameCharacter: "Alisa Mikhailovna Kujou",
    nameSeries: "Tokidoki Bosotto Russia-go de Dederu Tonari no Alya-san",
    totalReviews: 634,
    totalSold: 643,
    textDescription: loremIpsum(paragraphs: 2, words: 100),
  ),

  // Kurumi
  Product(
    id: 7,
    name: "[Momiji SALE] Coreful Figure Kurumi Tokisaki - Plain Clothes Ver. (18cm)",
    imageThumbnail: 'images/kurumi-casual.webp',
    price: "519,000",
    status: "Ready",
    rating: 5.0,
    imageUrls: [
      "https://cdn.kyou.id/items/136477-coreful-figure-kurumi-tokisaki-plain-clothes-ver-18cm.jpg.webp",
      "https://cdn.kyou.id/items/136478-coreful-figure-kurumi-tokisaki-plain-clothes-ver-18cm.jpg.webp",
      "https://cdn.kyou.id/items/136479-coreful-figure-kurumi-tokisaki-plain-clothes-ver-18cm.jpg.webp",
      "https://cdn.kyou.id/items/136480-coreful-figure-kurumi-tokisaki-plain-clothes-ver-18cm.jpg.webp",
      "https://cdn.kyou.id/items/136481-coreful-figure-kurumi-tokisaki-plain-clothes-ver-18cm.jpg.webp",
    ],
    nameCharacter: "Tokisaki Kurumi",
    nameSeries: "Date A Live",
    totalReviews: 111,
    totalSold: 260,
    textDescription: loremIpsum(paragraphs: 2, words: 100),
  ),
  Product(
    id: 8,
    name: "[Momiji SALE] figma Kurumi Tokisaki - Date A Live",
    imageThumbnail: 'images/kurumi-pistol.webp',
    price: "1,399,000",
    status: "Sold Out",
    rating: 4.9,
    imageUrls: [
      "https://cdn.kyou.id/items/148199-figma-kurumi-tokisaki-date-a-live.jpg.webp",
      "https://cdn.kyou.id/items/148325-figma-kurumi-tokisaki-date-a-live.jpg.webp",
      "https://cdn.kyou.id/items/148326-figma-kurumi-tokisaki-date-a-live.jpg.webp",
      "https://cdn.kyou.id/items/148327-figma-kurumi-tokisaki-date-a-live.jpg.webp",
      "https://cdn.kyou.id/items/148328-figma-kurumi-tokisaki-date-a-live.jpg.webp",
      "https://cdn.kyou.id/items/148329-figma-kurumi-tokisaki-date-a-live.jpg.webp",
      "https://cdn.kyou.id/items/148330-figma-kurumi-tokisaki-date-a-live.jpg.webp",
      "https://cdn.kyou.id/items/148331-figma-kurumi-tokisaki-date-a-live.jpg.webp",
      "https://cdn.kyou.id/items/148332-figma-kurumi-tokisaki-date-a-live.jpg.webp",
      "https://cdn.kyou.id/items/148333-figma-kurumi-tokisaki-date-a-live.jpg.webp"
    ],
    nameCharacter: "Tokisaki Kurumi",
    nameSeries: "Date A Live",
    totalReviews: 423,
    totalSold: 245,
    textDescription: loremIpsum(paragraphs: 2, words: 100),
  ),
  Product(
    id: 9,
    name: "Date A Live IV Tokisaki Kurumi Extra Large Acrylic Stand",
    imageThumbnail: 'images/kurumi-acrylic.webp',
    price: "440,000",
    status: "Pre-order",
    rating: 4.8,
    imageUrls: [
      "https://cdn.kyou.id/items/232627-date-a-live-iv-tokisaki-kurumi-extra-large-acrylic-stand.jpg.webp",
    ],
    nameCharacter: "Tokisaki Kurumi",
    nameSeries: "Date A Live",
    totalReviews: 865,
    totalSold: 275,
    textDescription: loremIpsum(paragraphs: 2, words: 100),
  ),

  // ushio noa
  Product(
    id: 10,
    name: "Ushio Noa Acrylic Stand - Blue Archive Get Set, Go! Kivotos Halo Games (16cm)",
    imageThumbnail: 'images/noa-acrylic.webp',
    price: "220,000",
    status: "Ready",
    rating: 5.0,
    imageUrls: [
      "https://cdn.kyou.id/items/319507-ushio-noa-acrylic-stand-blue-archive-get-set-go-kivotos-halo-games-16cm.jpg.webp",
    ],
    nameCharacter: "Ushio Noa",
    nameSeries: "Blue Archive",
    totalReviews: 865,
    totalSold: 745,
    textDescription: loremIpsum(paragraphs: 2, words: 100),
  ),
  Product(
    id: 11,
    name: "[FLASH PO] Nendoroid Ushio Noa - Blue Archive",
    imageThumbnail: 'images/noa.webp',
    price: "700,000",
    status: "Sold Out",
    rating: 4.9,
    imageUrls: [
      "https://cdn.kyou.id/items/272478-nendoroid-ushio-noa-blue-archive-411109136.jpg.webp",
      "https://cdn.kyou.id/items/284437-nendoroid-ushio-noa-blue-archive.jpg.webp",
      "https://cdn.kyou.id/items/284438-nendoroid-ushio-noa-blue-archive.jpg.webp",
      "https://cdn.kyou.id/items/284439-nendoroid-ushio-noa-blue-archive.jpg.webp",
      "https://cdn.kyou.id/items/284440-nendoroid-ushio-noa-blue-archive.jpg.webp",
      "https://cdn.kyou.id/items/284441-nendoroid-ushio-noa-blue-archive.jpg.webp",
      "https://cdn.kyou.id/items/284442-nendoroid-ushio-noa-blue-archive.jpg.webp",
    ],
    nameCharacter: "Ushio Noa",
    nameSeries: "Blue Archive",
    totalReviews: 234,
    totalSold: 264,
    textDescription: loremIpsum(paragraphs: 2, words: 100),
  ),
  Product(
    id: 12,
    name: "Ushio Noa Shikisihi - Blue Archive Get Set, Go! Kivotos Halo Games (21x14cm)",
    imageThumbnail: 'images/noa-shikisihi.webp',
    price: "130,000",
    status: "Pre-order",
    rating: 4.8,
    imageUrls: [
      "https://cdn.kyou.id/items/232627-date-a-live-iv-tokisaki-kurumi-extra-large-acrylic-stand.jpg.webp",
    ],
    nameCharacter: "Ushio Noa",
    nameSeries: "Blue Archive",
    totalReviews: 151,
    totalSold: 325,
    textDescription: loremIpsum(paragraphs: 2, words: 100),
  ),

  // shiroko
  Product(
    id: 13,
    name: "Sunaookami Shiroko Terror Ver. Acrylic Stand - Blue Archive (17cm)",
    imageThumbnail: 'images/shiroko-terror.webp',
    price: "370,000",
    status: "Ready",
    rating: 5.0,
    imageUrls: [
      "https://cdn.kyou.id/items/316511-sunaookami-shiroko-terror-ver-cycling-ver-acrylic-stand-blue-archive-17cm.jpg.webp",
    ],
    nameCharacter: "Sunaookami Shiroko",
    nameSeries: "Blue Archive",
    totalReviews: 745,
    totalSold: 234,
    textDescription: loremIpsum(paragraphs: 2, words: 100),
  ),

  // sakurako
  Product(
    id: 14,
    name: "Utazumi Sakurako Acrylic Stand - Blue Archive (18cm)",
    imageThumbnail: 'images/sakurako.webp',
    price: "350,000",
    status: "Ready",
    rating: 5.0,
    imageUrls: [
      "https://cdn.kyou.id/items/219445-utazumi-sakurako-acrylic-stand-18cm-blue-archive.jpg.webp",
    ],
    nameCharacter: "Utazumi Sakurako",
    nameSeries: "Blue Archive",
    totalReviews: 126,
    totalSold: 124,
    textDescription: loremIpsum(paragraphs: 2, words: 100),
  ),

  // ruan mei
  Product(
    id: 15,
    name: "[Momiji SALE] Ruan Mei Cosmic Candy House Acrylic Ornament - Honkai: Star Rail (10cm)",
    imageThumbnail: 'images/ruan-mei.webp',
    price: "189,000",
    status: "Ready",
    rating: 5.0,
    imageUrls: [
      "https://cdn.kyou.id/items/342874-ruan-mei-cosmic-candy-house-acrylic-ornament-honkai-star-rail-10cm.jpg.webp",
      "https://cdn.kyou.id/items/298478-ruan-mei-cosmic-candy-house-acrylic-ornament-honkai-star-rail-10cm.jpg.webp"
    ],
    nameCharacter: "Ruan Mei",
    nameSeries: "Honkai Star Rail",
    totalReviews: 574,
    totalSold: 568,
    textDescription: loremIpsum(paragraphs: 2, words: 100),
  ),

];