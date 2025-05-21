import 'package:autobazzaar/models/product.dart';
import 'package:autobazzaar/models/vehicle_category.dart';

final Map<String, List<Product>> carcategory1 = {
  "Auto Spare Parts": [
    Product(
      title: "Air Filters",
      description: "Neque porro quisquam est qui dolorem ipsum quia",
      image: "assets/images/products/air_filter.png",
      price: 2000,
      isPremium: true,
    ),
    Product(
      title: "Air Filters",
      description: "Neque porro quisquam est qui dolorem ipsum quia",
      image: "assets/images/products/air_filter.png",
      price: 2000,
      isPremium: true,
    ),
    Product(
      title: "Air Filters",
      description: "Neque porro quisquam est qui dolorem ipsum quia",
      image: "assets/images/products/air_filter.png",
      price: 2000,
      isPremium: true,
    ),
    Product(
      title: "Nut Bolts",
      description: "Neque porro quisquam est qui dolorem ipsum quia",
      image: "assets/images/products/nut_bolts.png",
      price: 2000,
        isPremium: true,
    ),
  ],
  "Auto Accessories": [
    Product(
      title: "Floor Mats",
      description: "Comfortable and durable car mats.",
      image: "assets/images/products/floor_mats.png",
      price: 1500,
        isPremium: true,
    ),
  ],
  "Auto Body Parts": [
    Product(
      title: "Bumper",
      description: "High-quality front bumper.",
      image: "assets/images/products/bumper.png",
      price: 5000,
      isPremium: true,
    ),
  ],
};
final Map<String, List<Product>> motorbikeCategory = {
  "Bike Spare Parts": [
    Product(
      title: "Brake Pads",
      description: "Durable and high-performance brake pads.",
      image: "assets/images/products/bike_brake_pads.png",
      price: 1200,
        isPremium: true,
    ),
  ],
  "Bike Accessories": [
    Product(
      title: "Helmet",
      description: "Stylish and safe helmet.",
      image: "assets/images/products/helmet.png",
      price: 2500,
        isPremium: true,
    ),
  ],
  "Bike Body Panels": [
    Product(
      title: "Side Panels",
      description: "Strong and aerodynamic body panels.",
      image: "assets/images/products/bike_panels.png",
      price: 1800,
        isPremium: true,
    ),
  ],
};

final Map<String, List<Product>> threeWheelerCategory = {
  "Rickshaw Mechanical Parts": [
    Product(
      title: "Rickshaw Engine",
      description: "Reliable 3-wheeler engine.",
      image: "assets/images/products/rikshaw_engine.png",
      price: 8000,
        isPremium: true,
    ),
  ],
  "Interior Accessories": [
    Product(
      title: "Seat Covers",
      description: "Comfortable interior seat covers.",
      image: "assets/images/products/seat_covers.png",
      price: 1000,
        isPremium: true,
    ),
  ],
  "Body Frames & Panels": [
    Product(
      title: "Side Frame",
      description: "Strong rickshaw side frame.",
      image: "assets/images/products/rikshaw_frame.png",
      price: 3000,
        isPremium: true,
    ),
  ],
};

final Map<String, List<Product>> vanCategory = {
  "Van Spare Parts": [
    Product(
      title: "Oil Filter",
      description: "Premium van oil filter.",
      image: "assets/images/products/oil_filter.png",
      price: 1100,
        isPremium: true,
    ),
  ],
  "Van Interior Kits": [
    Product(
      title: "Van Interior Light",
      description: "LED lighting for interior.",
      image: "assets/images/products/van_lights.png",
      price: 900,
        isPremium: true,
    ),
  ],
  "Van Body Components": [
    Product(
      title: "Rear Door",
      description: "Durable van rear door.",
      image: "assets/images/products/rear_door.png",
      price: 7000,
        isPremium: true,
    ),
  ],
};

final Map<String, List<Product>> taxiCategory = {
  "Engine & Suspension Parts": [
    Product(
      title: "Taxi Suspension Kit",
      description: "Smooth ride guaranteed.",
      image: "assets/images/products/taxi_suspension.png",
      price: 4000,
        isPremium: true,
    ),
  ],
  "Taxi Gadgets & Meters": [
    Product(
      title: "Digital Meter",
      description: "Accurate and easy to read.",
      image: "assets/images/products/taxi_meter.png",
      price: 2500,
        isPremium: true,
    ),
  ],
  "Body Maintenance Parts": [
    Product(
      title: "Taxi Paint Kit",
      description: "Touch-up paint kit.",
      image: "assets/images/products/paint_kit.png",
      price: 1800,
        isPremium: true,
    ),
  ],
};

final Map<String, List<Product>> busCategory = {
  "Bus Mechanical Parts": [
    Product(
      title: "Brake System",
      description: "Complete brake system for buses.",
      image: "assets/images/products/bus_brakes.png",
      price: 6000,
        isPremium: true,
    ),
  ],
  "Passenger Comfort Accessories": [
    Product(
      title: "Seat Cushion",
      description: "Extra comfort for passengers.",
      image: "assets/images/products/seat_cushion.png",
      price: 2000,
        isPremium: true,
    ),
  ],
  "Bus Body Panels": [
    Product(
      title: "Front Panel",
      description: "Reinforced bus front panel.",
      image: "assets/images/products/bus_front_panel.png",
      price: 8500,
        isPremium: true,
    ),
  ],
};

final Map<String, List<Product>> truckCategory = {
  "Heavy-Duty Engine Parts": [
    Product(
      title: "Diesel Engine Block",
      description: "Built for heavy loads.",
      image: "assets/images/products/diesel_block.png",
      price: 15000,
        isPremium: true,
    ),
  ],
  "Truck Cabin Accessories": [
    Product(
      title: "Cabin Fan",
      description: "Cooling fan for cabin.",
      image: "assets/images/products/cabin_fan.png",
      price: 1300,
        isPremium: true,
    ),
  ],
  "Truck Body Panels & Bumpers": [
    Product(
      title: "Steel Bumper",
      description: "Heavy-duty front bumper.",
      image: "assets/images/products/truck_bumper.png",
      price: 5500,
        isPremium: true,
    ),
  ],
};

final Map<String, List<Product>> atvCategory = {
  "ATV Suspension & Drivetrain": [
    Product(
      title: "Shock Absorbers",
      description: "Handle any terrain with ease.",
      image: "assets/images/products/shocks.png",
      price: 3000,
        isPremium: true,
    ),
  ],
  "Off-road Accessories": [
    Product(
      title: "LED Light Bar",
      description: "Visibility for night off-roading.",
      image: "assets/images/products/light_bar.png",
      price: 2200,
        isPremium: true,
    ),
  ],
  "Protective Body Covers": [
    Product(
      title: "ATV Cover",
      description: "Weatherproof ATV cover.",
      image: "assets/images/products/atv_cover.png",
      price: 1500,
        isPremium: true,
    ),
  ],
};

final Map<String, List<Product>> camperCategory = {
  "RV Electrical & Plumbing Parts": [
    Product(
      title: "Water Pump",
      description: "Efficient plumbing pump.",
      image: "assets/images/products/water_pump.png",
      price: 3400,
        isPremium: true,
    ),
  ],
  "Camping Accessories": [
    Product(
      title: "Outdoor Chair",
      description: "Folding chair for comfort.",
      image: "assets/images/products/chair.png",
      price: 800,
        isPremium: true,
    ),
  ],
  "Exterior Body Fittings": [
    Product(
      title: "Awning Kit",
      description: "Extendable shade awning.",
      image: "assets/images/products/awning.png",
      price: 4200,
        isPremium: true,
    ),
  ],
};
final Map<String, List<Product>> waterCraftCategory = {
  "Marine Engine Parts": [
    Product(
      title: "Propeller",
      description: "Durable stainless steel propeller.",
      image: "assets/images/products/propeller.png",
      price: 7500,
        isPremium: true,
    ),
    Product(
      title: "Marine Battery",
      description: "High-capacity deep-cycle battery.",
      image: "assets/images/products/marine_battery.png",
      price: 4200,
        isPremium: true,
    ),
  ],
  "Navigation Accessories": [
    Product(
      title: "GPS Fish Finder",
      description: "Track fish and navigate with ease.",
      image: "assets/images/products/fish_finder.png",
      price: 5600,
        isPremium: true,
    ),
  ],
  "Boat Body Components": [
    Product(
      title: "Boat Cover",
      description: "Weather-resistant cover for watercraft.",
      image: "assets/images/products/boat_cover.png",
      price: 2800,
        isPremium: true,
    ),
  ],
};






List<VehicleCategory> carCategories = [
  // VehicleCategory(
  //   name: "🚗 Car",
  //   imagePath: "assets/images/vehicle_category/car.png",
  // ),
  VehicleCategory(name: "Auto Spare Parts", imagePath: "assets/images/auto_parts/spare_part.jpeg"),
  VehicleCategory(name: "Auto Accessories", imagePath: "assets/images/auto_parts/auto_accessories.jpeg"),
  VehicleCategory(name: "Auto Body Parts", imagePath: "assets/images/auto_parts/auto_body.jpg"),
];

List<VehicleCategory> motorbikeCategories = [
  // VehicleCategory(
  //   name: "🏍️ Motorbike",
  //   imagePath: "assets/images/vehicle_category/bike.png",
  // ),
  VehicleCategory(name: "Bike Spare Parts", imagePath: "assets/images/auto_parts/bike_spare.png"),
  VehicleCategory(name: "Bike Accessories", imagePath: "assets/images/auto_parts/bike_accessories.png"),
  VehicleCategory(name: "Bike Body Panels", imagePath: "assets/images/auto_parts/body_panel.jpg"),
];

List<VehicleCategory> threeWheelerCategories = [
  // VehicleCategory(
  //   name: "🛺 Three-Wheeler",
  //   imagePath: "assets/images/vehicle_category/rikshaw.png",
  // ),
  VehicleCategory(name: "Rickshaw Mechanical Parts", imagePath: "assets/images/auto_parts/3mechanical_part.jpg"),
  VehicleCategory(name: "Interior Accessories", imagePath: "assets/images/auto_parts/3wheeler_accessories.webp"),
  VehicleCategory(name: "Body Frames & Panels", imagePath: "assets/images/auto_parts/3wheeler_body_frame.jpg"),
];

List<VehicleCategory> vanCategories = [
  // VehicleCategory(
  //   name: "🚐 Van",
  //   imagePath: "assets/images/vehicle_category/van.png",
  // ),
  VehicleCategory(name: "Van Spare Parts", imagePath: "assets/images/auto_parts/spare_part.jpeg"),
  VehicleCategory(name: "Van Interior Kits", imagePath: "assets/images/auto_parts/van_interior_kit.webp"),
  VehicleCategory(name: "Van Body Components", imagePath: "assets/images/auto_parts/van_body_component.avif"),
];

List<VehicleCategory> taxiCategories = [
  // VehicleCategory(
  //   name: "🚖 Taxi",
  //   imagePath: "assets/images/vehicle_category/taxi.png",
  // ),
  VehicleCategory(name: "Engine & Suspension Parts", imagePath: "assets/images/auto_parts/engine.jpg"),
  VehicleCategory(name: "Taxi Gadgets & Meters", imagePath: "assets/images/auto_parts/taxi_gadget.jpg"),
  VehicleCategory(name: "Body Maintenance Parts", imagePath: "assets/images/auto_parts/spare_part.jpg"),
];

List<VehicleCategory> busCategories = [
  // VehicleCategory(
  //   name: "🚌 Bus",
  //   imagePath: "assets/images/vehicle_category/bus.png",
  // ),
  VehicleCategory(name: "Bus Mechanical Parts", imagePath: "assets/images/auto_parts/heavy_duty.jpg"),
  VehicleCategory(name: "Passenger Comfort Accessories", imagePath: "assets/images/auto_parts/passenger_comfort.webp"),
  VehicleCategory(name: "Bus Body Panels", imagePath: "assets/images/auto_parts/bus_body.jpg"),
];

List<VehicleCategory> lorryCategories = [
  // VehicleCategory(
  //   name: "🚛 Lorry / Truck",
  //   imagePath: "assets/images/vehicle_category/lorry.png",
  // ),
  VehicleCategory(name: "Heavy-Duty Engine Parts", imagePath: "assets/images/auto_parts/heavy_duty.jpg"),
  VehicleCategory(name: "Truck Cabin Accessories", imagePath: "assets/images/auto_parts/truck_cabin.jpg"),
  VehicleCategory(name: "Truck Body Panels & Bumpers", imagePath: "assets/images/auto_parts/truck_body_pannel.avif"),
];

List<VehicleCategory> quadCategories = [
  // VehicleCategory(
  //   name: "🛻 Quad / ATV",
  //   imagePath: "assets/images/vehicle_category/buggy.png",
  // ),
  VehicleCategory(name: "ATV Suspension & Drivetrain", imagePath: "assets/images/auto_parts/auto_accessories.jpeg"),
  VehicleCategory(name: "Off-road Accessories", imagePath: "assets/images/auto_parts/atv.jpg"),
  VehicleCategory(name: "Protective Body Covers", imagePath: "assets/images/auto_parts/atv_cover.jpg"),
];

List<VehicleCategory> camperVanCategories = [
  // VehicleCategory(
  //   name: "🚐 Camper Van / RV",
  //   imagePath: "assets/images/vehicle_category/campervan.png",
  // ),
  VehicleCategory(name: "RV Electrical & Plumbing Parts", imagePath: "assets/images/auto_parts/rv_water_system.jpeg"),
  VehicleCategory(name: "Camping Accessories", imagePath: "assets/images/auto_parts/camping_accessories.jpg"),
  VehicleCategory(name: "Exterior Body Fittings", imagePath: "assets/images/auto_parts/spare_part.jpeg"),
];

List<VehicleCategory> waterCraftCategories = [
  // VehicleCategory(
  //   name: "Water Crafts",
  //   imagePath: "assets/images/vehicle_category/water_craft.png",
  // ),
    VehicleCategory(name: "Marine Engine Parts", imagePath: "assets/images/auto_parts/engine.jpg"),
  VehicleCategory(name: "Navigation Accessories", imagePath: "assets/images/auto_parts/water_craft_accessories.webp"),
  VehicleCategory(name: "Boat Body Components", imagePath: "assets/images/auto_parts/boat_body.png"),
  // You can add parts here later if needed
];
