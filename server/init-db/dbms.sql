-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: localhost    Database: dbms
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) NOT NULL,
  `cuisine_type` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `is_veg` tinyint(1) DEFAULT '0',
  `restaurant_name` varchar(255) NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `image` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (17,'Momo Mia Pizza-Veg','Pizza, Fast Food',459.05,0,'Pizza Hut',1,'https://api.pizzahut.io/v1/content/en-in/in-1/images/pizza/momo-mia-veg.4e51f4733bea47a514c107c9fd2341e3.1.jpg?width=600','2024-12-26 11:48:46','2024-12-26 11:48:46');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'prathi','gowdapratheek91@gmail.com','finally done','2024-02-25 19:38:22','2024-02-25 19:38:22'),(2,'pratheek gowda','gowdapratheek91@gmail.com','ahhhhhhhhhhhhhhh!\n','2024-02-26 13:53:47','2024-02-26 13:53:47'),(3,'Amith Subodh','amithsubodh@gmail.com','hii','2024-12-17 10:20:16','2024-12-17 10:20:16'),(4,'Amith Subodh','amithsubodh99@gmail.com','njh','2024-12-24 05:56:14','2024-12-24 05:56:14'),(5,'Amith Subodh','amithsubodh@gmail.com','dghg','2024-12-24 10:37:53','2024-12-24 10:37:53');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitems`
--

DROP TABLE IF EXISTS `menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `imageURL` json NOT NULL,
  `speciality` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `openingHours` varchar(255) NOT NULL,
  `menu` json NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `RestaurantId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `RestaurantId` (`RestaurantId`),
  CONSTRAINT `menuitems_ibfk_1` FOREIGN KEY (`RestaurantId`) REFERENCES `restaurants` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitems`
--

LOCK TABLES `menuitems` WRITE;
/*!40000 ALTER TABLE `menuitems` DISABLE KEYS */;
INSERT INTO `menuitems` VALUES (1,'KFC','[\"https://b.zmtcdn.com/data/pictures/chains/9/65279/52b42b0206d1989d5e89c0b854fa8183_featured_v2.jpg?fit=around|771.75:416.25&crop=771.75:416.25;*,*\", \"https://b.zmtcdn.com/data/pictures/chains/9/65279/ab7dc239625ef34124d8a38b57a22e3a.jpg?fit=around|300:273&crop=300:273;*,*\", \"https://b.zmtcdn.com/data/pictures/chains/9/65279/0e79614ea14113b8b3d4b48574293d00.jpg?fit=around|300:273&crop=300:273;*,*\"]','Fried Chicken, Fast Food, Beverages','Park Town, Hassan','Open now 11am - 11pm (Today)','[{\"name\": \"Zinger Tandoori Box\", \"image\": \"https://orderserv-kfc-assets.yum.com/15895bb59f7b4bb588ee933f8cd5344a/images/items/xl/D-PR00001003.jpg?ver=55.63\", \"price\": \"459.05\", \"description\": \"A deal for Tandoori lovers : Get 1 Tandoori Zinger, 2 Hot Wings, 1 Veg Patty & 1 Pepsi 475ml\"}, {\"name\": \"Mexican Zinger Pro Burger & Popcorn Meal\", \"image\": \"https://orderserv-kfc-assets.yum.com/15895bb59f7b4bb588ee933f8cd5344a/images/items/xl/D-K696.jpg?ver=55.63\", \"price\": \"628.57\", \"description\": \"New Zinger Pro burger with Medium Popcorn & Pepsi 475ml at a deal price\"}, {\"name\": \"Bucket for Two\", \"image\": \"https://orderserv-kfc-assets.yum.com/15895bb59f7b4bb588ee933f8cd5344a/images/items/xl/D-PR00000892.jpg?ver=55.63\", \"price\": \"468.57\", \"description\": \"Flat Rs. 115 off on combo of 2pc Hot & Crispy, 2 pc Smoky Red Chicken & Large Popcorn\"}]','2024-02-25 18:09:30','2024-02-25 18:09:30',3),(2,'Pizza Hut','[\"https://b.zmtcdn.com/data/pictures/chains/6/65456/4b16336b06df38a18362be00bf81d2e5_o2_featured_v2.jpg?output-format=webp&fit=around|771.75:416.25&crop=771.75:416.25;*,*\", \"https://b.zmtcdn.com/data/pictures/chains/6/65456/4f4440d6f4e39151f92a850c27ac13f7.jpg?output-format=webp&fit=around|300:273&crop=300:273;*,*\", \"https://b.zmtcdn.com/data/pictures/chains/6/65456/6d4d04396c5d7f59c760fceeaed5693f.jpg?output-format=webp&fit=around|300:273&crop=300:273;*,*\"]','Pizza, Fast Food','Park Town, Hassan','Open now 11am - 11pm (Today)','[{\"name\": \"Momo Mia Pizza-Veg\", \"image\": \"https://api.pizzahut.io/v1/content/en-in/in-1/images/pizza/momo-mia-veg.4e51f4733bea47a514c107c9fd2341e3.1.jpg?width=600\", \"price\": \"459.05\", \"description\": \"Veg Momo Pizza: Juicy momos, spicy Schezwan sauce, and melty cheese baked to perfection. \"}, {\"name\": \"Momo Mia Pizza-Non Veg\", \"image\": \"https://api.pizzahut.io/v1/content/en-in/in-1/images/pizza/momo-mia-non-veg.379d4c86ba9551f194bfc68ad9d77bc5.1.jpg?width=600\", \"price\": \"628.57\", \"description\": \"Non Veg Momo Pizza: Juicy chicken momos, spicy Schezwan sauce, and melty cheese baked to perfection.\"}, {\"name\": \"Schezwan Margherita\", \"image\": \"https://api.pizzahut.io/v1/content/en-in/in-1/images/pizza/schezwan-margherita.4371d9483546db47a97c5503ccad0c2f.1.jpg?width=600\", \"price\": \"468.57\", \"description\": \"Schezwan Margherita Pizza: Spicy Schezwan sauce, and mozzarella cheese baked to perfection.\"}]','2024-02-25 18:11:26','2024-02-25 18:11:26',1),(3,'Dominos','[\"https://b.zmtcdn.com/data/pictures/chains/5/65155/42692f651081811b6507c408edf90373.jpg?fit=around|771.75:416.25&crop=771.75:416.25;*,*\", \"https://b.zmtcdn.com/data/pictures/chains/5/65155/a3f876979c7b1a123ff8d0548d774cb1.jpg?fit=around|300:273&crop=300:273;*,*\", \"https://b.zmtcdn.com/data/pictures/chains/5/65155/c751805b5927046d340926f870a95f5e.jpg?fit=around|300:273&crop=300:273;*,*\"]','Pizza, Fast Food','Park Town, Hassan','Open now 11am - 11pm (Today)','[{\"name\": \"Farmhouse\", \"image\": \"https://images.dominos.co.in/nextgen-catalog/media/prod/Dominos/WebHomeProductV1/d6ef0e48-39e8-4b1f-908a-284f3ffd4808_farmhouse_side.webp?ver=V0.0.1\", \"price\": \"459.05\", \"description\": \"Delightful combination of onion, capsicum, tomato & grilled mushroom\"}, {\"name\": \"Peppy Panner\", \"image\": \"https://images.dominos.co.in/nextgen-catalog/media/prod/Dominos/WebHomeProductV1/fd8071f1-06a9-4b6e-8a1f-1e674be0a338_peppy_paneer_side.webp?ver=V0.0.1\", \"price\": \"628.57\", \"description\": \"Flavorful trio of juicy paneer, crisp capsicum with spicy red paprika\"}, {\"name\": \"Chicken Dominator\", \"image\": \"https://images.dominos.co.in/nextgen-catalog/media/prod/Dominos/HomeProductV1/c57ca706-ab1e-43fd-ac2b-667c093dceee_chickendominatorsidejpgFull2x2702.jpg?ver=V0.0.1\", \"price\": \"468.57\", \"description\": \"Loaded with double pepper barbecue chicken, peri-peri chicken, chicken tikka & grilled chicken rashers\"}]','2024-02-25 18:12:37','2024-02-25 18:12:37',2),(4,'Raama','[\"https://r1imghtlak.mmtcdn.com/f064657a5feb11e79bee025f77df004f.jpg\"]','Briyani, Fast Food, Beverages','Near SDM, Hassan','Open now 11am - 11pm (Today)','[{\"name\": \"Baby-Corn Manchurian\", \"image\": \"https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,h_600/FOOD_CATALOG/IMAGES/CMS/2024/7/30/bb8609c3-4100-43c8-b3cf-e6f104dc58fb_b402a0ff-82e0-4cb3-85d3-4c4e0592fafc.jpg\", \"price\": \"200.05\", \"description\": \"Baby Corn Manchurian is a crispy, spicy Indo-Chinese starter made with fried baby corn in a tangy garlic-chili sauce.\"}, {\"name\": \"Chicken Kabab\", \"image\": \"https://bonmasala.com/wp-content/uploads/2022/06/Chicken-65-recipe.webp\", \"price\": \"220.00\", \"description\": \"Chicken Kabab: Juicy, marinated chicken skewers grilled to perfection, offering a burst of smoky, spiced flavors in every bite.\"}, {\"name\": \"Veg Schezwan Fried Rice\", \"image\": \"https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,h_600/FOOD_CATALOG/IMAGES/CMS/2024/8/7/4407afce-c58b-497c-955b-e2da006873b9_f9e034f2-1b43-4027-904d-43323f171ca0.jpg\", \"price\": \"221.57\", \"description\": \"Veg Schezwan Fried Rice is a spicy Indo-Chinese dish made with stir-fried vegetables, rice, and a bold Schezwan sauce, known for its tangy, fiery flavor.\"}]','2024-02-26 20:22:27','2024-02-26 20:22:27',7),(5,'Hotel Udupi','[\"https://r2imghtlak.mmtcdn.com/r2-mmt-htl-image/htl-imgs/201301291420123624-f3f29429-7e4a-485f-a0a3-6bd93837d9d1.jpg\"]','Veg, Chinese','Ring Road, Hassan','Open now 11am - 11pm (Today)','[{\"name\": \"Baby-Corn Manchurian\", \"image\": \"https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,h_600/FOOD_CATALOG/IMAGES/CMS/2024/7/30/bb8609c3-4100-43c8-b3cf-e6f104dc58fb_b402a0ff-82e0-4cb3-85d3-4c4e0592fafc.jpg\", \"price\": \"200.05\", \"description\": \"Baby Corn Manchurian is a crispy, spicy Indo-Chinese starter made with fried baby corn in a tangy garlic-chili sauce.\"}, {\"name\": \"Panner Butter Masala\", \"image\": \"https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,h_600/mkgy63t7sy2fbk40x4mu\", \"price\": \"220.00\", \"description\": \"Paneer Butter Masala is a popular North Indian dish made with paneer simmered in a rich, creamy tomato-based gravy, flavored with spices and butter.\"}, {\"name\": \"Veg Schezwan Fried Rice\", \"image\": \"https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,h_600/FOOD_CATALOG/IMAGES/CMS/2024/8/7/4407afce-c58b-497c-955b-e2da006873b9_f9e034f2-1b43-4027-904d-43323f171ca0.jpg\", \"price\": \"221.57\", \"description\": \"Veg Schezwan Fried Rice is a spicy Indo-Chinese dish made with stir-fried vegetables, rice, and a bold Schezwan sauce, known for its tangy, fiery flavor.\"}]','2024-02-26 20:22:27','2024-02-26 20:22:27',8),(6,'Beijing Bites','[\"https://www.beijingbites.com/Old%20Websote%20images/Old%20Websote%20images/1508754964_BeijingBitesS2.jpg\"]','Chinese','MG Road, Hassan','Open now 11am - 11pm (Today)','[{\"name\": \"Chicken Wanton Soup\", \"image\": \"https://daysofjay.com/wp-content/uploads/2023/12/Chicken-Wonton-Soup-1.jpg\", \"price\": \"180.05\", \"description\": \"Chicken wonton soup is a comforting Asian dish featuring delicate wontons filled with savory chicken filling, served in a flavorful broth with vegetables.\"}, {\"name\": \"Chicken Koithio\", \"image\": \"https://i.pinimg.com/736x/cd/6b/02/cd6b024147145a5af386603f10210b0e.jpg\", \"price\": \"220.00\", \"description\": \"Chicken Koithio soup is a comforting Malaysian dish featuring tender chicken, flat rice noodles, and vegetables in a flavorful broth.\"}, {\"name\": \"Chicken Schezwan Fried Rice\", \"image\": \"https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,h_600/FOOD_CATALOG/IMAGES/CMS/2024/8/7/4407afce-c58b-497c-955b-e2da006873b9_f9e034f2-1b43-4027-904d-43323f171ca0.jpg\", \"price\": \"221.57\", \"description\": \"Chicken Schezwan Fried Rice is a spicy Chinese dish made with stir-fried vegetables, chicken, rice, and a bold Schezwan sauce, known for its tangy, fiery flavor.\"}]','2024-02-26 20:22:27','2024-02-26 20:22:27',4),(7,'Burger King','[\"https://cdn.sanity.io/images/czqk28jt/prod_bk_us/e2a1bc86a3e6c68b00317b529c83b3f586338dd0-2000x1000.png?w=1300&q=80&fit=max&auto=format\"]','Fast Food, Burgers','NH-75, Hassan','Open now 11am - 11pm (Today)','[{\"name\": \"Chicken Whopper\", \"image\": \"https://d1rgpf387mknul.cloudfront.net/products/PLP/web/2x_web_20240919141618171931_482x264jpg\", \"price\": \"199.05\", \"description\": \"Our signature Whopper with 7 layers between the buns. Flame-Grilled chicken patty, fresh onions, crispy lettuce, juicy tomatoes , tangy gherkins, creamy and smoky sauces with new premium glazed buns. Swaad Aisa, India Jaisa.\"}, {\"name\": \"Crunchy Chicken Taco Meal\", \"image\": \"https://d1rgpf387mknul.cloudfront.net/products/PLP/web/2x_web_20240924043816555995_482x264jpg\", \"price\": \"220.00\", \"description\": \"Crunchy Taco Shell With Chicken Patty, Veggies And Spicy Sauce Served With Crispy Fries & Coke.\"}, {\"name\": \"Mutton Whopper\", \"image\": \"https://d1rgpf387mknul.cloudfront.net/products/PLP/web/2x_web_20240304094627191516_482x264jpg\", \"price\": \"309.57\", \"description\": \"Our signature Whopper with 7 layers between the buns. Flame-Grilled mutton patty, fresh onions, crispy lettuce, juicy tomatoes, tangy gherkins, creamy and smoky sauces with new glazed buns. Swaad Aisa, India Jaisa.\"}]','2024-02-26 20:22:27','2024-02-26 20:22:27',5),(8,'Absolute Shwarma','[\"https://www.absoluteshawarma.com/wp-content/uploads/2023/10/website-png-3-compressed.jpg\"]','Fast Food, Shawrmas','Vivekanagar, Hassan','Open now 11am - 11pm (Today)','[{\"name\": \"Chicken Classic Tikki Burger\", \"image\": \"https://www.absoluteshawarma.com/wp-content/uploads/2023/09/Chicken-Crunchy-Maharaja-Burger.jpg\", \"price\": \"59.05\", \"description\": \"A Chicken Classic Tikki Burger features a crispy chicken patty, layered with fresh vegetables and sauces, all sandwiched between soft burger buns.\"}, {\"name\": \"Chicken Plate Shawarma\", \"image\": \"https://www.absoluteshawarma.com/wp-content/uploads/2023/09/Peri-Peri-Plate-Shawarma-Without-Fries.jpg\", \"price\": \"180.00\", \"description\": \"Peri Peri Chicken Plate Shawarma is a spicy and flavorful dish featuring grilled chicken marinated in a fiery Peri Peri sauce, served with warm pita bread, hummus, and other accompaniments.\"}, {\"name\": \"Tandoori Pizza\", \"image\": \"https://www.absoluteshawarma.com/wp-content/uploads/2023/09/Non-Veg-Mexican-Pizza.jpg\", \"price\": \"149.57\", \"description\": \"Tandoori Pizza is a unique fusion dish that combines the flavors of Indian tandoor cooking with classic pizza toppings, resulting in a smoky, flavorful treat.\"}]','2024-02-26 20:22:27','2024-02-26 20:22:27',6);
/*!40000 ALTER TABLE `menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  `speciality` varchar(255) NOT NULL,
  `rating` float NOT NULL,
  `price` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'Pizza Hut','https://b.zmtcdn.com/data/pictures/chains/6/65456/4f4440d6f4e39151f92a850c27ac13f7.jpg?fit=around|300:273&crop=300:273;*,*','Pan Pizzas, Fast Food, Beverages',3.4,500,'2024-02-25 13:15:24','2024-02-25 13:15:24'),(2,'Domino\'s','https://images.unsplash.com/photo-1615719413546-198b25453f85?crop=entropy&cs=srgb&fm=jpg&ixid=MnwxNDU4OXwwfDF8cmFuZG9tfHx8fHx8fHx8MTYzMDQwMjkwNA&ixlib=rb-1.2.1&q=85','Italian, Fast Food, Beverages',4.6,200,'2024-02-25 13:15:24','2024-02-25 13:15:24'),(3,'KFC','https://b.zmtcdn.com/data/pictures/chains/9/65279/52b42b0206d1989d5e89c0b854fa8183_featured_v2.jpg?fit=around|771.75:416.25&crop=771.75:416.25;*,*','Fried Chicken, Fast Food, Beverages',3.6,500,'2024-02-25 13:15:24','2024-02-25 13:15:24'),(4,'Beijing Bites','https://beijingbites.com/Old%20Websote%20images/Old%20Websote%20images/beijing_bites_fe1_PRAWNS_NOODLES.jpg','Chinese , Fast Food, Beverages',4.5,200,'2024-02-25 13:15:24','2024-02-25 13:15:24'),(5,'Burger King','https://b.zmtcdn.com/data/pictures/chains/0/18225860/7c8d1e6d9612e5bee0d54a39188e95a4.jpg?fit=around|771.75:416.25&crop=771.75:416.25;*,*','Burger, Fast Food, Beverages',3.6,300,'2024-02-25 13:15:24','2024-02-25 13:15:24'),(6,'Absolute Shwarma','https://b.zmtcdn.com/data/pictures/chains/3/18528753/ff00d1f16f23bdf6e0378bec29da7573_o2_featured_v2.jpg','Swarma, Fast Food, Beverages',4.2,100,'2024-02-25 13:15:24','2024-02-25 13:15:24'),(7,'Hotel Raama','https://r1imghtlak.mmtcdn.com/6b1332dc1fee11e5a613daf4768ad8d9.jfif','Veg and Non veg',4.8,300,'2024-02-25 13:15:24','2024-02-25 13:15:24'),(8,'Hotel Udupi','https://r1imghtlak.mmtcdn.com/f00487be81eb11e78ba70a4cef95d023.jpg?&output-quality=75&downsize=520:350&crop=520:350;2,0&output-format=jpg&downsize=480:336&crop=480:336','Veg ',4.8,300,'2024-02-25 13:15:24','2024-02-25 13:15:24');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (9,'amith','amith','2024-12-24 06:07:41','2024-12-24 06:07:41'),(10,'amiths','amiths23','2024-12-24 06:18:26','2024-12-24 06:18:26'),(11,'ananya','ananya23','2024-12-24 06:18:55','2024-12-24 06:18:55'),(12,'anana','qhhqh1h','2024-12-24 10:36:21','2024-12-24 10:36:21'),(13,'amith subodh','amimaith@2004','2024-12-26 11:48:14','2024-12-26 11:48:14'),(14,'aaaaaaaa','122344566','2025-03-01 07:12:26','2025-03-01 07:12:26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-13 13:08:48
