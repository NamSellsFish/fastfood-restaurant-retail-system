import 'package:flutter/material.dart';
import '/src/presentation/widgets/home/single_image_offer.dart';

class Constants {
// COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      //Color(0xff84D8E3),
      //Color(0xffA6E6CE),
      Color(0xffFF8C00),
      Color(0xffFFA500),
    ],
    // stops: [0.5, 1.0],
  );
  static const addressBarGradient = LinearGradient(
    colors: [
      Color(0xffB6E8EF),
      Color(0xffCBF1E2),
    ],
    stops: [0.5, 1.0],
  );

  static const goldenGradient = LinearGradient(
      colors: [Color(0xffFFEDBB), Color(0xffFEDC71)], stops: [0.25, 1]);

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const yellowColor = Color(0xffFED813);
  static const backgroundColor = Colors.white;
  static const greenColor = Color(0xff057205);
  static const redColor = Color(0xffB22603);
  static const Color greyBackgroundColor = Color(0xffF6F6F6);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  // categories
  // static List<String> productCategories = [
  //   'Category',
  //   'Mobiles',
  //   'Fashion',
  //   'Electronics',
  //   'Home',
  //   'Beauty',
  //   'Appliances',
  //   'Grocery',
  //   'Books',
  //   'Essentials',
  // ];
  static List<String> productCategories = [
    'Category',
    'Chicken',
    'Hamburger',
    'Spaghetti',
    'Meal with Rice',
    'Pizza',
    'Drink',
    'Dessert',
    'Cuisine',
    'Snack',
  ];

  static OutlineInputBorder inputBorderStyle = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black38),
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
  );

  // category images
  // static const List<Map<String, String>> categoryImages = [
  //   {'title': 'Mobiles', 'image': 'assets/images/category_images/mobiles.jpeg'},
  //   {'title': 'Fashion', 'image': 'assets/images/category_images/fashion.jpeg'},
  //   {
  //     'title': 'Electronics',
  //     'image': 'assets/images/category_images/electronics.jpeg'
  //   },
  //   {'title': 'Home', 'image': 'assets/images/category_images/home.jpeg'},
  //   {'title': 'Beauty', 'image': 'assets/images/category_images/beauty.jpeg'},
  //   {
  //     'title': 'Appliances',
  //     'image': 'assets/images/category_images/appliances.jpeg'
  //   },
  //   {'title': 'Grocery', 'image': 'assets/images/category_images/grocery.jpeg'},
  //   {'title': 'Books', 'image': 'assets/images/category_images/books.jpeg'},
  //   {
  //     'title': 'Essentials',
  //     'image': 'assets/images/category_images/essentials.jpeg'
  //   },
  // ];
  static const List<Map<String, String>> categoryImages = [
    {'title': 'Chicken', 'image': 'assets/images/category_images/_mobiles.png'},
    {
      'title': 'Hamburger',
      'image': 'assets/images/category_images/_fashion.png'
    },
    {
      'title': 'Spaghetti',
      'image': 'assets/images/category_images/_electronics.png'
    },
    {
      'title': 'Meal with Rice',
      'image': 'assets/images/category_images/_home.png'
    },
    {'title': 'Pizza', 'image': 'assets/images/category_images/_beauty.png'},
    {
      'title': 'Snack',
      'image': 'assets/images/category_images/_appliances.png'
    },
    {'title': 'Drink', 'image': 'assets/images/category_images/_grocery.png'},
    {'title': 'Dessert', 'image': 'assets/images/category_images/_books.png'},
    {
      'title': 'Cuisine',
      'image': 'assets/images/category_images/_essentials.png'
    },
  ];

  // Carousel images
  // static const List<Map<String, String>> carouselImages = [
  //   {
  //     'category': 'Mobiles',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699265366/carousel_images/bg4c71tkghkwtnxkfx8r.jpg',
  //   },
  //   {
  //     'category': 'Fashion',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699265359/carousel_images/lynhzhgccpfb8pbdknyh.jpg',
  //   },
  //   {
  //     'category': 'Beauty',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699265354/carousel_images/ysdubrrkwbi5rqqcupg5.jpg',
  //   },
  //   {
  //     'category': 'Appliances',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699265359/carousel_images/lh9urah5mtrd8uolos2m.jpg',
  //   },
  //   {
  //     'category': 'Mobiles',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699265358/carousel_images/mvrwbxras7uig7woc5gj.jpg',
  //   },
  //   {
  //     'category': 'Mobiles',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699265355/carousel_images/josedcgjkzst3iqnpqgf.jpg',
  //   },
  //   {
  //     'category': 'Electronics',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699265357/carousel_images/nx2nmaq4pbqlebiexqup.jpg',
  //   },
  //   {
  //     'category': 'Electronics',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699265358/carousel_images/gvgwvhmodau81bwddsrh.jpg',
  //   },
  //   {
  //     'category': 'Mobiles',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699265354/carousel_images/tb0uzkote4twcczih8xj.jpg',
  //   },
  // ];

  static const List<Map<String, String>> carouselImages = [
    {
      'category': 'Chicken',
      'image':
          'https://gcs.tripi.vn/public-tripi/tripi-feed/img/474263TPe/cach-nhan-mien-phi-1-ga-ran-qua-ung-dung-lotteria-vn-05_1280x720-800-resize.jpg',
    },
    {
      'category': 'Hamburger',
      'image':
          'https://cdn.create.vista.com/downloads/26f12343-0276-4638-aacb-dd543b084a85_1024.jpeg',
    },
    {
      'category': 'Spaghetti',
      'image':
          'https://static.kfcvietnam.com.vn/images/content/home/carousel/lg/MiY.jpg',
    },
    {
      'category': 'Pizza',
      'image':
          'https://cdn.grabon.in/gograbon/images/web-images/uploads/1687424992778/pizza-hut-coupon-codes.jpg',
    },
    {
      'category': 'Dessert',
      'image':
          'https://hype.my/wp-content/uploads/2022/04/Screenshot-63-e1651138893519.jpg',
    },
    {
      'category': 'Drink',
      'image':
          'https://wsvn.com/wp-content/uploads/sites/2/2023/12/231206-Starbucks-unwraps-holiday-discounts-for-rewards-members.png',
    },
    {
      'category': 'Cuisine',
      'image':
          'https://viettelmoney.vn/wp-content/uploads/2023/05/voucher-Pho-24.jpg',
    },
  ];

  static List<Map<String, String>> shuffledCarouselImages(
      List<Map<String, String>> carouselImages) {
    carouselImages.shuffle();

    return carouselImages;
  }

  //Bottom offers amazon pay
  static const List<Map<String, String>> bottomOffersAmazonPay = [
    {
      'title': 'Amazon Pay',
      'image': 'assets/images/bottom_offers/amazon_pay.png'
    },
    {
      'title': 'Recharge',
      'image': 'assets/images/bottom_offers/amazon_recharge.png'
    },
    {
      'title': 'Rewards',
      'image': 'assets/images/bottom_offers/amazon_rewards.png'
    },
    {
      'title': 'Pay Bills',
      'image': 'assets/images/bottom_offers/amazon_bills.png'
    },
  ];

  //Bottom offer under price
  static const List<Map<String, String>> bottomOffersUnderPrice = [
    {
      'title': 'Budget Buys',
      'image': 'assets/images/bottom_offers/budgetBuys.png'
    },
    {'title': 'Best Buys', 'image': 'assets/images/bottom_offers/bestBuys.png'},
    {
      'title': 'Super Buys',
      'image': 'assets/images/bottom_offers/superBuys.png'
    },
    {'title': 'Top Picks', 'image': 'assets/images/bottom_offers/topPicks.png'},
  ];

  // Bottom offers images
  // static const List<Map<String, String>> bottomOfferImages = [
  //   {
  //     'category': 'AmazonPay',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699472117/bottom_offers/quvjt4q774dqkkqe0tb4.png',
  //   },
  //   {
  //     'category': 'Mobiles',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699264799/bottom_offers/kxymbalj4pmgeor4u6ug.jpg',
  //   },
  //   {
  //     'category': 'Mobiles',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699264799/bottom_offers/uthsphrtzpcfubvq9dwn.png',
  //   },
  //   {
  //     'category': 'Beauty',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699264800/bottom_offers/v3nc5x9boosqlkbz2nrj.png',
  //   },
  //   {
  //     'category': 'Mobiles',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699264798/bottom_offers/qctd1ju8kieb9oyuyfc2.jpg',
  //   },
  //   {
  //     'category': 'Essentials',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699264798/bottom_offers/e4omcec49lsdjedjvzl9.jpg',
  //   },
  //   {
  //     'category': 'Grocery',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699264799/bottom_offers/sjjbdzyowmgcznugrqsv.jpg',
  //   },
  //   {
  //     'category': 'Essentials',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699264798/bottom_offers/xohbxfozk55euqsprjmp.jpg',
  //   },
  //   {
  //     'category': 'Home',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699264798/bottom_offers/jerrpfgphdk76isd5c8s.jpg',
  //   },
  //   {
  //     'category': 'Fashion',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699264798/bottom_offers/iu5u3qvtxrriyb13eh5g.jpg',
  //   },
  //   {
  //     'category': 'Home',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699264799/bottom_offers/qlpctc3ljlkka4wqy6dr.jpg',
  //   },
  //   {
  //     'category': 'Fashion',
  //     'image':
  //         'https://res.cloudinary.com/dthljz11q/image/upload/v1699264799/bottom_offers/emqsyqzli078fguthilp.jpg',
  //   },
  // ];
  static const List<Map<String, String>> bottomOfferImages = [
    {
      'category': 'Momo',
      'image': 'https://upload.wikimedia.org/wikipedia/vi/f/fe/MoMo_Logo.png',
    },
    {
      'category': 'Chicken',
      'image': 'https://welovechicken.caterkfc.com/img/coupon-02.png',
    },
    {
      'category': 'Hamburger',
      'image':
          'https://mcdonalds.vn/uploads/2018/promotions/xbgday_whatsonM.jpg.pagespeed.ic.Yax4pEakXo.jpg',
    },
    {
      'category': 'Spaghetti',
      'image':
          'https://i.pinimg.com/736x/e8/f9/94/e8f99442254db9c938a0637e66b6ceb7.jpg',
    },
    {
      'category': 'Pizza',
      'image':
          'https://i.pinimg.com/originals/66/58/8e/66588ec33012547edbd1efff74c666cd.jpg',
    },
    {
      'category': 'Dessert',
      'image':
          'https://i.pinimg.com/736x/f8/05/a4/f805a447dc48ce6824dc492f330fd75d.jpg',
    },
    {
      'category': 'Drink',
      'image':
          'https://images.yummy.ph/yummy/uploads/2019/02/jollibee-creamy-caramel-floats-01.jpg',
    },
    {
      'category': 'Cuisine',
      'image':
          'https://www.allsgpromo.com/wp-content/uploads/Mrs-Pho-SAF-DAy-get-15-discount-on-all-menu-items_1688187134_original.jpg',
    },
    {
      'category': 'Meal with Rice',
      'image':
          'https://stc.shopiness.vn/deal/2019/06/11/c/1/e/4/1560226047886_540.jpg',
    },
    {
      'category': 'Snack',
      'image':
          'https://channel.mediacdn.vn/thumb_w/640/2020/11/10/photo-1-16050043829551303767071.jpg',
    },
  ];

  // Multiimage offers
  // mulit image offer 1
  static const List<Map<String, String>> multiImageOffer1 = [
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616716/multi_image_offers/multi_image_offer1/ixunkzn9ihxmq7sz5kbu.jpg',
      'offerTitle': 'Health & household'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616716/multi_image_offers/multi_image_offer1/qoluocxlfvfsm06aft7m.jpg',
      'offerTitle': 'Grocery essentials'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616716/multi_image_offers/multi_image_offer1/opop30gr9ko1rh31elnp.jpg',
      'offerTitle': 'Beauty products'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616716/multi_image_offers/multi_image_offer1/drlfqq5spc08gtpwoehi.jpg',
      'offerTitle': 'Visit store'
    },
  ];

  // Multi image offers 2
  static const List<Map<String, String>> multiImageOffer2 = [
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616730/multi_image_offers/multi_image_offer2/fy7cga8bnkhbwdczeojg.jpg',
      'offerTitle': 'Under ₹299 | Kitchen accessories'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616730/multi_image_offers/multi_image_offer2/vpvy0tubzfu5xb7rdowo.jpg',
      'offerTitle': 'Under ₹499 | Kitchen jars, containers & more'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616730/multi_image_offers/multi_image_offer2/ozc0y0aprcduz1k6mzbn.jpg',
      'offerTitle': '₹499 - ₹999 | Cookware sets'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616730/multi_image_offers/multi_image_offer2/f9zsqeaq2shwflttwfcu.jpg',
      'offerTitle': 'Min. 60% Off | Dinnerware'
    },
  ];

  // multi image offer 3
  static const List<Map<String, String>> multiImageOffer3 = [
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616731/multi_image_offers/multi_image_offer3/cxywqfuwdqdlmxfwhznh.jpg',
      'offerTitle': 'Redmi (32) 4K TV | Lowest ever prices'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616731/multi_image_offers/multi_image_offer3/jypnmwrxog1zhmgkn0mq.jpg',
      'offerTitle': 'OnePlus (50) 4K TV | Flat 43% off'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616731/multi_image_offers/multi_image_offer3/by0atjdadl3vdxvkwcxe.jpg',
      'offerTitle': 'Samsung (65) iSmart TV | Bestseller'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616732/multi_image_offers/multi_image_offer3/kdbran924rp1dcfxkc37.jpg',
      'offerTitle': 'Sony (55) 4K TV | Get 3 years warranty'
    },
  ];

  //muli image offer 4
  static const List<Map<String, String>> multiImageOffer4 = [
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616739/multi_image_offers/multi_image_offer4/sg6xeof7e8c6i8tdtn3a.png',
      'offerTitle': 'Starting ₹79 | Cycles, helmets & more'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616735/multi_image_offers/multi_image_offer4/gwknudygu8xkgbqwjhyh.png',
      'offerTitle': 'Starting ₹99 | Cricket'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616737/multi_image_offers/multi_image_offer4/ye374adnpqqw0g9rpdrh.png',
      'offerTitle': 'Starting ₹99 | Badminton'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616735/multi_image_offers/multi_image_offer4/j6qu404fobsayouau9et.png',
      'offerTitle': 'Starting ₹49 | Fitness accessories & more'
    },
  ];

  static const List<Map<String, String>> multiImageOffer5 = [
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616735/multi_image_offers/multi_image_offer5/jmowr6zekxwqa1eb9byb.png',
      'offerTitle': 'Cooking ingredients'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616736/multi_image_offers/multi_image_offer5/jl5sruf184umnwrhic3s.png',
      'offerTitle': 'Sweets'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616737/multi_image_offers/multi_image_offer5/jqdwbsu2f9zbribwyybs.png',
      'offerTitle': 'Cleaning supplies'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616740/multi_image_offers/multi_image_offer5/frqjrpvryuwsmga2ohay.png',
      'offerTitle': 'View all offers'
    },
  ];

  static const List<Map<String, String>> productQualityDetails = [
    {
      'iconName': 'replacement.png',
      'title': '7 days Service Centre Replacement'
    },
    {'iconName': 'free_delivery.png', 'title': 'Free Delivery'},
    {'iconName': 'warranty.png', 'title': '1 Year Warranty'},
    {'iconName': 'pay_on_delivery.png', 'title': 'Pay on Delivery'},
    {'iconName': 'top_brand.png', 'title': 'Top Brand'},
    {'iconName': 'delivered.png', 'title': 'Amazon Delivered'},
  ];

  static const List<Map<String, String>> menuScreenImages = [
    {
      'title': 'Chicken',
      'category': 'Chicken',
      'image': 'https://cdn-icons-png.flaticon.com/256/1046/1046824.png',
    },
    {
      'title': 'Hamburger',
      'category': 'Hamburger',
      'image':
          'https://www.shareicon.net/data/256x256/2016/04/11/747950_food_512x512.png'
    },
    {
      'title': 'Spaghetti',
      'category': 'Spaghetti',
      'image':
          'https://icons.veryicon.com/png/Food%20%26%20Drinks/3D%20Food/Dish%20Pasta%20Spaghetti.png'
    },
    {
      'title': 'Meal with Rice',
      'category': 'Meal with Rice',
      'image':
          'https://cdn.icon-icons.com/icons2/1556/PNG/512/3377056-cooking-food-fried-rice_107432.png'
    },
    {
      'title': 'Pizza',
      'category': 'Pizza',
      'image': 'https://cdn-icons-png.flaticon.com/256/7780/7780935.png'
    },
    {
      'title': 'Drink',
      'category': 'Drink',
      'image':
          'https://cdn.iconscout.com/icon/free/png-256/free-beverage-1602833-1359101.png'
    },
    {
      'title': 'Dessert',
      'category': 'Dessert',
      'image': 'https://cdn-icons-png.flaticon.com/256/450/450100.png'
    },
    {
      'title': 'Cuisine',
      'category': 'Cuisine',
      'image': 'https://cdn-icons-png.flaticon.com/256/7499/7499400.png'
    },
    {
      'title': 'Snack',
      'category': 'Snack',
      'image':
          'https://cdn3.iconfinder.com/data/icons/street-food-and-food-trucker-1/64/french-fries-snacks-fast-food-512.png'
    },
  ];
}

List<SingleImageOffer> singleImageOffers = const [
  SingleImageOffer(
    headTitle: 'Limited period offers on best-selling TVs | Starting ₹8,999',
    subTitle: 'Up to 18 months No Cost EMI',
    image:
        'https://res.cloudinary.com/dthljz11q/image/upload/v1699881799/single_image_offers/ulrpitq6hf4rocgo0m8w.jpg',
    productCategory: 'Electronics',
  ),
  SingleImageOffer(
    headTitle: 'Top deals on headsets',
    subTitle: 'Up to 80% off',
    image:
        'https://res.cloudinary.com/dthljz11q/image/upload/v1699881798/single_image_offers/x5gqgg5ynbjkslyvefpk.jpg',
    productCategory: 'Mobiles',
  ),
  SingleImageOffer(
    headTitle: 'Buy 2 Get 10% off, freebies & more offers',
    subTitle: 'See all offers',
    image:
        'https://res.cloudinary.com/dthljz11q/image/upload/v1699881798/single_image_offers/u0ozqtcnhnl1eqoht85j.jpg',
    productCategory: 'Home',
  ),
  SingleImageOffer(
    headTitle: 'Price crash | Amazon Brands & more',
    subTitle: 'Under ₹499 | T-shirts & shirts',
    image:
        'https://res.cloudinary.com/dthljz11q/image/upload/v1699881800/single_image_offers/kwfypkjyfqjsipniefav.png',
    productCategory: 'Fashion',
  ),
  SingleImageOffer(
    headTitle: 'Amazon coupons | Smartphones & accessories',
    subTitle: 'Extra up to ₹2000 off with coupons',
    image:
        'https://res.cloudinary.com/dthljz11q/image/upload/v1699881799/single_image_offers/rmtbk89pmenhd3mulcus.jpg',
    productCategory: 'Mobiles',
  ),
];
