-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2021 at 09:33 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `adminId` int(11) NOT NULL,
  `adminName` varchar(255) NOT NULL,
  `adminUser` varchar(255) NOT NULL,
  `adminEmail` varchar(255) NOT NULL,
  `adminPass` varchar(32) NOT NULL,
  `level` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`adminId`, `adminName`, `adminUser`, `adminEmail`, `adminPass`, `level`) VALUES
(1, 'Rasel', 'admin', 'admin@gmail.com', '202cb962ac59075b964b07152d234b70', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brandId` int(11) NOT NULL,
  `brandName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brandId`, `brandName`) VALUES
(1, 'ACER'),
(2, 'SAMSUNG'),
(3, 'IPHONE'),
(4, 'CANON');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cartId` int(11) NOT NULL,
  `sId` varchar(255) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cart`
--

INSERT INTO `tbl_cart` (`cartId`, `sId`, `productId`, `productName`, `price`, `quantity`, `image`) VALUES
(1, 'rs97dr1n4cn3itmv58tl8emll8', 10, 'iphone x is here', 1025.00, 1, 'uploads/cdc4b31211.png'),
(2, 'o9n464ullm7esklpl83gu0diqj', 14, 'Canon camera', 456.00, 1, 'uploads/b6c467d266.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `catId` int(11) NOT NULL,
  `catName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`catId`, `catName`) VALUES
(1, 'Desktop'),
(2, 'Laptop'),
(3, 'Mobile Phones'),
(4, 'Accessories'),
(5, 'Software'),
(6, 'Sports &amp; Fitness'),
(7, 'Footwear'),
(8, 'Jewellery'),
(9, 'Clothing'),
(10, 'new');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_compare`
--

CREATE TABLE `tbl_compare` (
  `id` int(11) NOT NULL,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `zip` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`id`, `name`, `address`, `city`, `country`, `zip`, `phone`, `email`, `pass`) VALUES
(1, 'Delowar j Imran', 'Jatrabari,Dhaka', 'Dhaka', 'bangladesh', '1215', '01926091227', 'imran@gmail.com', '202cb962ac59075b964b07152d234b70'),
(2, 'RASEL RANA', 'Rowail,satihati,kalihati,tangail', 'Tangail', 'Bangladesh', '1900', '01686391286', 'raselrana500@gmail.com', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `cmrId`, `productId`, `productName`, `quantity`, `price`, `image`, `date`, `status`) VALUES
(31, 1, 10, 'iphone x is here', 1, 1025.00, 'uploads/cdc4b31211.png', '2018-03-01 23:25:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `catId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL,
  `body` text NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`productId`, `productName`, `catId`, `brandId`, `body`, `price`, `image`, `type`) VALUES
(1, 'Lorem Ipsum is simply', 5, 4, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempora, pariatur tenetur. Laudantium soluta blanditiis, ea molestias facilis quibusdam. Cumque tempora in vel accusamus quidem mollitia eligendi saepe officia voluptatum eveniet labore, neque, quibusdam sed animi aperiam ad aspernatur deleniti commodi atque repudiandae. Voluptatum atque repellat, aliquid odio adipisci facilis accusamus illo a qui rem minima nihil optio tenetur earum autem? Deserunt animi numquam unde nesciunt vel ut dolor ratione at laborum necessitatibus doloremque magni porro, possimus, enim aliquam voluptate suscipit. Ea quaerat, sit dolores laboriosam animi maxime distinctio natus eligendi laudantium. Omnis optio quae ad quas officiis fugit vitae sapiente aliquam molestiae nesciunt, nulla minus maiores ipsa iusto incidunt temporibus. Eos, modi, aut. Dicta nam autem quidem similique nobis quia quibusdam cupiditate numquam sit consequatur. Nam laboriosam officia quos cumque numquam consequatur. Quos sunt esse quia, libero ducimus, quibusdam vel, ea in dolor maiores ad quis sit aut quas voluptates laborum. Quisquam ullam temporibus esse repellat in, ratione aliquam eum voluptatem. Ipsa pariatur provident et laborum voluptatibus quis qui sint ad repudiandae? Molestias recusandae velit neque eveniet itaque provident id omnis nam quaerat ea, quo quisquam molestiae, quidem ipsam, voluptate dignissimos aut quia nulla reiciendis numquam animi dicta. Voluptatem, sapiente.', 505.22, 'uploads/2cbb1ecf0d.png', 0),
(2, 'Lorem Ipsum is simply', 7, 2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempora, pariatur tenetur. Laudantium soluta blanditiis, ea molestias facilis quibusdam. Cumque tempora in vel accusamus quidem mollitia eligendi saepe officia voluptatum eveniet labore, neque, quibusdam sed animi aperiam ad aspernatur deleniti commodi atque repudiandae. Voluptatum atque repellat, aliquid odio adipisci facilis accusamus illo a qui rem minima nihil optio tenetur earum autem? Deserunt animi numquam unde nesciunt vel ut dolor ratione at laborum necessitatibus doloremque magni porro, possimus, enim aliquam voluptate suscipit. Ea quaerat, sit dolores laboriosam animi maxime distinctio natus eligendi laudantium. Omnis optio quae ad quas officiis fugit vitae sapiente aliquam molestiae nesciunt, nulla minus maiores ipsa iusto incidunt temporibus. Eos, modi, aut. Dicta nam autem quidem similique nobis quia quibusdam cupiditate numquam sit consequatur. Nam laboriosam officia quos cumque numquam consequatur. Quos sunt esse quia, libero ducimus, quibusdam vel, ea in dolor maiores ad quis sit aut quas voluptates laborum. Quisquam ullam temporibus esse repellat in, ratione aliquam eum voluptatem. Ipsa pariatur provident et laborum voluptatibus quis qui sint ad repudiandae? Molestias recusandae velit neque eveniet itaque provident id omnis nam quaerat ea, quo quisquam molestiae, quidem ipsam, voluptate dignissimos aut quia nulla reiciendis numquam animi dicta. Voluptatem, sapiente.', 620.87, 'uploads/dd0053c2ce.jpg', 0),
(3, 'Lorem Ipsum is simply', 8, 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempora, pariatur tenetur. Laudantium soluta blanditiis, ea molestias facilis quibusdam. Cumque tempora in vel accusamus quidem mollitia eligendi saepe officia voluptatum eveniet labore, neque, quibusdam sed animi aperiam ad aspernatur deleniti commodi atque repudiandae. Voluptatum atque repellat, aliquid odio adipisci facilis accusamus illo a qui rem minima nihil optio tenetur earum autem? Deserunt animi numquam unde nesciunt vel ut dolor ratione at laborum necessitatibus doloremque magni porro, possimus, enim aliquam voluptate suscipit. Ea quaerat, sit dolores laboriosam animi maxime distinctio natus eligendi laudantium. Omnis optio quae ad quas officiis fugit vitae sapiente aliquam molestiae nesciunt, nulla minus maiores ipsa iusto incidunt temporibus. Eos, modi, aut. Dicta nam autem quidem similique nobis quia quibusdam cupiditate numquam sit consequatur. Nam laboriosam officia quos cumque numquam consequatur. Quos sunt esse quia, libero ducimus, quibusdam vel, ea in dolor maiores ad quis sit aut quas voluptates laborum. Quisquam ullam temporibus esse repellat in, ratione aliquam eum voluptatem. Ipsa pariatur provident et laborum voluptatibus quis qui sint ad repudiandae? Molestias recusandae velit neque eveniet itaque provident id omnis nam quaerat ea, quo quisquam molestiae, quidem ipsam, voluptate dignissimos aut quia nulla reiciendis numquam animi dicta. Voluptatem, sapiente.', 220.97, 'uploads/a5c5572e29.jpg', 0),
(5, 'General Product title will be go here', 6, 2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempora, pariatur tenetur. Laudantium soluta blanditiis, ea molestias facilis quibusdam. Cumque tempora in vel accusamus quidem mollitia eligendi saepe officia voluptatum eveniet labore, neque, quibusdam sed animi aperiam ad aspernatur deleniti commodi atque repudiandae. Voluptatum atque repellat, aliquid odio adipisci facilis accusamus illo a qui rem minima nihil optio tenetur earum autem? Deserunt animi numquam unde nesciunt vel ut dolor ratione at laborum necessitatibus doloremque magni porro, possimus, enim aliquam voluptate suscipit. Ea quaerat, sit dolores laboriosam animi maxime distinctio natus eligendi laudantium. Omnis optio quae ad quas officiis fugit vitae sapiente aliquam molestiae nesciunt, nulla minus maiores ipsa iusto incidunt temporibus. Eos, modi, aut. Dicta nam autem quidem similique nobis quia quibusdam cupiditate numquam sit consequatur. Nam laboriosam officia quos cumque numquam consequatur. Quos sunt esse quia, libero ducimus, quibusdam vel, ea in dolor maiores ad quis sit aut quas voluptates laborum. Quisquam ullam temporibus esse repellat in, ratione aliquam eum voluptatem. Ipsa pariatur provident et laborum voluptatibus quis qui sint ad repudiandae? Molestias recusandae velit neque eveniet itaque provident id omnis nam quaerat ea, quo quisquam molestiae, quidem ipsam, voluptate dignissimos aut quia nulla reiciendis numquam animi dicta. Voluptatem, sapiente.', 254.00, 'uploads/a06196dd8b.png', 1),
(6, 'General product title will be go here', 9, 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempora, pariatur tenetur. Laudantium soluta blanditiis, ea molestias facilis quibusdam. Cumque tempora in vel accusamus quidem mollitia eligendi saepe officia voluptatum eveniet labore, neque, quibusdam sed animi aperiam ad aspernatur deleniti commodi atque repudiandae. Voluptatum atque repellat, aliquid odio adipisci facilis accusamus illo a qui rem minima nihil optio tenetur earum autem? Deserunt animi numquam unde nesciunt vel ut dolor ratione at laborum necessitatibus doloremque magni porro, possimus, enim aliquam voluptate suscipit. Ea quaerat, sit dolores laboriosam animi maxime distinctio natus eligendi laudantium. Omnis optio quae ad quas officiis fugit vitae sapiente aliquam molestiae nesciunt, nulla minus maiores ipsa iusto incidunt temporibus. Eos, modi, aut. Dicta nam autem quidem similique nobis quia quibusdam cupiditate numquam sit consequatur. Nam laboriosam officia quos cumque numquam consequatur. Quos sunt esse quia, libero ducimus, quibusdam vel, ea in dolor maiores ad quis sit aut quas voluptates laborum. Quisquam ullam temporibus esse repellat in, ratione aliquam eum voluptatem. Ipsa pariatur provident et laborum voluptatibus quis qui sint ad repudiandae? Molestias recusandae velit neque eveniet itaque provident id omnis nam quaerat ea, quo quisquam molestiae, quidem ipsam, voluptate dignissimos aut quia nulla reiciendis numquam animi dicta. Voluptatem, sapiente.', 652.00, 'uploads/5319cab0b1.jpg', 1),
(7, 'General product title will be go here', 4, 4, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempora, pariatur tenetur. Laudantium soluta blanditiis, ea molestias facilis quibusdam. Cumque tempora in vel accusamus quidem mollitia eligendi saepe officia voluptatum eveniet labore, neque, quibusdam sed animi aperiam ad aspernatur deleniti commodi atque repudiandae. Voluptatum atque repellat, aliquid odio adipisci facilis accusamus illo a qui rem minima nihil optio tenetur earum autem? Deserunt animi numquam unde nesciunt vel ut dolor ratione at laborum necessitatibus doloremque magni porro, possimus, enim aliquam voluptate suscipit. Ea quaerat, sit dolores laboriosam animi maxime distinctio natus eligendi laudantium. Omnis optio quae ad quas officiis fugit vitae sapiente aliquam molestiae nesciunt, nulla minus maiores ipsa iusto incidunt temporibus. Eos, modi, aut. Dicta nam autem quidem similique nobis quia quibusdam cupiditate numquam sit consequatur. Nam laboriosam officia quos cumque numquam consequatur. Quos sunt esse quia, libero ducimus, quibusdam vel, ea in dolor maiores ad quis sit aut quas voluptates laborum. Quisquam ullam temporibus esse repellat in, ratione aliquam eum voluptatem. Ipsa pariatur provident et laborum voluptatibus quis qui sint ad repudiandae? Molestias recusandae velit neque eveniet itaque provident id omnis nam quaerat ea, quo quisquam molestiae, quidem ipsam, voluptate dignissimos aut quia nulla reiciendis numquam animi dicta. Voluptatem, sapiente.', 365.00, 'uploads/a148366701.jpg', 1),
(8, 'General product title will be go here', 7, 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempora, pariatur tenetur. Laudantium soluta blanditiis, ea molestias facilis quibusdam. Cumque tempora in vel accusamus quidem mollitia eligendi saepe officia voluptatum eveniet labore, neque, quibusdam sed animi aperiam ad aspernatur deleniti commodi atque repudiandae. Voluptatum atque repellat, aliquid odio adipisci facilis accusamus illo a qui rem minima nihil optio tenetur earum autem? Deserunt animi numquam unde nesciunt vel ut dolor ratione at laborum necessitatibus doloremque magni porro, possimus, enim aliquam voluptate suscipit. Ea quaerat, sit dolores laboriosam animi maxime distinctio natus eligendi laudantium. Omnis optio quae ad quas officiis fugit vitae sapiente aliquam molestiae nesciunt, nulla minus maiores ipsa iusto incidunt temporibus. Eos, modi, aut. Dicta nam autem quidem similique nobis quia quibusdam cupiditate numquam sit consequatur. Nam laboriosam officia quos cumque numquam consequatur. Quos sunt esse quia, libero ducimus, quibusdam vel, ea in dolor maiores ad quis sit aut quas voluptates laborum. Quisquam ullam temporibus esse repellat in, ratione aliquam eum voluptatem. Ipsa pariatur provident et laborum voluptatibus quis qui sint ad repudiandae? Molestias recusandae velit neque eveniet itaque provident id omnis nam quaerat ea, quo quisquam molestiae, quidem ipsam, voluptate dignissimos aut quia nulla reiciendis numquam animi dicta. Voluptatem, sapiente.', 132.00, 'uploads/915fdc4f8f.png', 1),
(9, 'General product title will be go here', 8, 2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempora, pariatur tenetur. Laudantium soluta blanditiis, ea molestias facilis quibusdam. Cumque tempora in vel accusamus quidem mollitia eligendi saepe officia voluptatum eveniet labore, neque, quibusdam sed animi aperiam ad aspernatur deleniti commodi atque repudiandae. Voluptatum atque repellat, aliquid odio adipisci facilis accusamus illo a qui rem minima nihil optio tenetur earum autem? Deserunt animi numquam unde nesciunt vel ut dolor ratione at laborum necessitatibus doloremque magni porro, possimus, enim aliquam voluptate suscipit. Ea quaerat, sit dolores laboriosam animi maxime distinctio natus eligendi laudantium. Omnis optio quae ad quas officiis fugit vitae sapiente aliquam molestiae nesciunt, nulla minus maiores ipsa iusto incidunt temporibus. Eos, modi, aut. Dicta nam autem quidem similique nobis quia quibusdam cupiditate numquam sit consequatur. Nam laboriosam officia quos cumque numquam consequatur. Quos sunt esse quia, libero ducimus, quibusdam vel, ea in dolor maiores ad quis sit aut quas voluptates laborum. Quisquam ullam temporibus esse repellat in, ratione aliquam eum voluptatem. Ipsa pariatur provident et laborum voluptatibus quis qui sint ad repudiandae? Molestias recusandae velit neque eveniet itaque provident id omnis nam quaerat ea, quo quisquam molestiae, quidem ipsam, voluptate dignissimos aut quia nulla reiciendis numquam animi dicta. Voluptatem, sapiente.', 856.00, 'uploads/f493d69013.png', 1),
(10, 'iphone x is here', 3, 3, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempora, pariatur tenetur. Laudantium soluta blanditiis, ea molestias facilis quibusdam. Cumque tempora in vel accusamus quidem mollitia eligendi saepe officia voluptatum eveniet labore, neque, quibusdam sed animi aperiam ad aspernatur deleniti commodi atque repudiandae. Voluptatum atque repellat, aliquid odio adipisci facilis accusamus illo a qui rem minima nihil optio tenetur earum autem? Deserunt animi numquam unde nesciunt vel ut dolor ratione at laborum necessitatibus doloremque magni porro, possimus, enim aliquam voluptate suscipit. Ea quaerat, sit dolores laboriosam animi maxime distinctio natus eligendi laudantium. Omnis optio quae ad quas officiis fugit vitae sapiente aliquam molestiae nesciunt, nulla minus maiores ipsa iusto incidunt temporibus. Eos, modi, aut. Dicta nam autem quidem similique nobis quia quibusdam cupiditate numquam sit consequatur. Nam laboriosam officia quos cumque numquam consequatur. Quos sunt esse quia, libero ducimus, quibusdam vel, ea in dolor maiores ad quis sit aut quas voluptates laborum. Quisquam ullam temporibus esse repellat in, ratione aliquam eum voluptatem. Ipsa pariatur provident et laborum voluptatibus quis qui sint ad repudiandae? Molestias recusandae velit neque eveniet itaque provident id omnis nam quaerat ea, quo quisquam molestiae, quidem ipsam, voluptate dignissimos aut quia nulla reiciendis numquam animi dicta. Voluptatem, sapiente.', 1025.00, 'uploads/cdc4b31211.png', 0),
(11, 'Samsung frieze title here', 6, 2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempora, pariatur tenetur. Laudantium soluta blanditiis, ea molestias facilis quibusdam. Cumque tempora in vel accusamus quidem mollitia eligendi saepe officia voluptatum eveniet labore, neque, quibusdam sed animi aperiam ad aspernatur deleniti commodi atque repudiandae. Voluptatum atque repellat, aliquid odio adipisci facilis accusamus illo a qui rem minima nihil optio tenetur earum autem? Deserunt animi numquam unde nesciunt vel ut dolor ratione at laborum necessitatibus doloremque magni porro, possimus, enim aliquam voluptate suscipit. Ea quaerat, sit dolores laboriosam animi maxime distinctio natus eligendi laudantium. Omnis optio quae ad quas officiis fugit vitae sapiente aliquam molestiae nesciunt, nulla minus maiores ipsa iusto incidunt temporibus. Eos, modi, aut. Dicta nam autem quidem similique nobis quia quibusdam cupiditate numquam sit consequatur. Nam laboriosam officia quos cumque numquam consequatur. Quos sunt esse quia, libero ducimus, quibusdam vel, ea in dolor maiores ad quis sit aut quas voluptates laborum. Quisquam ullam temporibus esse repellat in, ratione aliquam eum voluptatem. Ipsa pariatur provident et laborum voluptatibus quis qui sint ad repudiandae? Molestias recusandae velit neque eveniet itaque provident id omnis nam quaerat ea, quo quisquam molestiae, quidem ipsam, voluptate dignissimos aut quia nulla reiciendis numquam animi dicta. Voluptatem, sapiente.', 965.00, 'uploads/c9774d72f4.png', 0),
(12, 'Acer Monitor', 2, 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempora, pariatur tenetur. Laudantium soluta blanditiis, ea molestias facilis quibusdam. Cumque tempora in vel accusamus quidem mollitia eligendi saepe officia voluptatum eveniet labore, neque, quibusdam sed animi aperiam ad aspernatur deleniti commodi atque repudiandae. Voluptatum atque repellat, aliquid odio adipisci facilis accusamus illo a qui rem minima nihil optio tenetur earum autem? Deserunt animi numquam unde nesciunt vel ut dolor ratione at laborum necessitatibus doloremque magni porro, possimus, enim aliquam voluptate suscipit. Ea quaerat, sit dolores laboriosam animi maxime distinctio natus eligendi laudantium. Omnis optio quae ad quas officiis fugit vitae sapiente aliquam molestiae nesciunt, nulla minus maiores ipsa iusto incidunt temporibus. Eos, modi, aut. Dicta nam autem quidem similique nobis quia quibusdam cupiditate numquam sit consequatur. Nam laboriosam officia quos cumque numquam consequatur. Quos sunt esse quia, libero ducimus, quibusdam vel, ea in dolor maiores ad quis sit aut quas voluptates laborum. Quisquam ullam temporibus esse repellat in, ratione aliquam eum voluptatem. Ipsa pariatur provident et laborum voluptatibus quis qui sint ad repudiandae? Molestias recusandae velit neque eveniet itaque provident id omnis nam quaerat ea, quo quisquam molestiae, quidem ipsam, voluptate dignissimos aut quia nulla reiciendis numquam animi dicta. Voluptatem, sapiente.', 653.00, 'uploads/a9cb6e7af2.jpg', 0),
(14, 'Canon camera', 4, 4, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempora, pariatur tenetur. Laudantium soluta blanditiis, ea molestias facilis quibusdam. Cumque tempora in vel accusamus quidem mollitia eligendi saepe officia voluptatum eveniet labore, neque, quibusdam sed animi aperiam ad aspernatur deleniti commodi atque repudiandae. Voluptatum atque repellat, aliquid odio adipisci facilis accusamus illo a qui rem minima nihil optio tenetur earum autem? Deserunt animi numquam unde nesciunt vel ut dolor ratione at laborum necessitatibus doloremque magni porro, possimus, enim aliquam voluptate suscipit. Ea quaerat, sit dolores laboriosam animi maxime distinctio natus eligendi laudantium. Omnis optio quae ad quas officiis fugit vitae sapiente aliquam molestiae nesciunt, nulla minus maiores ipsa iusto incidunt temporibus. Eos, modi, aut. Dicta nam autem quidem similique nobis quia quibusdam cupiditate numquam sit consequatur. Nam laboriosam officia quos cumque numquam consequatur. Quos sunt esse quia, libero ducimus, quibusdam vel, ea in dolor maiores ad quis sit aut quas voluptates laborum. Quisquam ullam temporibus esse repellat in, ratione aliquam eum voluptatem. Ipsa pariatur provident et laborum voluptatibus quis qui sint ad repudiandae? Molestias recusandae velit neque eveniet itaque provident id omnis nam quaerat ea, quo quisquam molestiae, quidem ipsam, voluptate dignissimos aut quia nulla reiciendis numquam animi dicta. Voluptatem, sapiente.', 456.00, 'uploads/b6c467d266.png', 1),
(15, 'Galaxy', 3, 2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempora, pariatur tenetur. Laudantium soluta blanditiis, ea molestias facilis quibusdam. Cumque tempora in vel accusamus quidem mollitia eligendi saepe officia voluptatum eveniet labore, neque, quibusdam sed animi aperiam ad aspernatur deleniti commodi atque repudiandae. Voluptatum atque repellat, aliquid odio adipisci facilis accusamus illo a qui rem minima nihil optio tenetur earum autem? Deserunt animi numquam unde nesciunt vel ut dolor ratione at laborum necessitatibus doloremque magni porro, possimus, enim aliquam voluptate suscipit. Ea quaerat, sit dolores laboriosam animi maxime distinctio natus eligendi laudantium. Omnis optio quae ad quas officiis fugit vitae sapiente aliquam molestiae nesciunt, nulla minus maiores ipsa iusto incidunt temporibus. Eos, modi, aut. Dicta nam autem quidem similique nobis quia quibusdam cupiditate numquam sit consequatur. Nam laboriosam officia quos cumque numquam consequatur. Quos sunt esse quia, libero ducimus, quibusdam vel, ea in dolor maiores ad quis sit aut quas voluptates laborum. Quisquam ullam temporibus esse repellat in, ratione aliquam eum voluptatem. Ipsa pariatur provident et laborum voluptatibus quis qui sint ad repudiandae? Molestias recusandae velit neque eveniet itaque provident id omnis nam quaerat ea, quo quisquam molestiae, quidem ipsam, voluptate dignissimos aut quia nulla reiciendis numquam animi dicta. Voluptatem, sapiente.', 500.00, 'uploads/ebe95bffbf.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wlist`
--

CREATE TABLE `tbl_wlist` (
  `id` int(11) NOT NULL,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_wlist`
--

INSERT INTO `tbl_wlist` (`id`, `cmrId`, `productId`, `productName`, `price`, `image`) VALUES
(1, 1, 10, 'iphone x is here', 1025.00, 'uploads/cdc4b31211.png'),
(3, 1, 11, 'Samsung frieze title here', 965.00, 'uploads/c9774d72f4.png'),
(4, 1, 12, 'Acer Monitor', 653.00, 'uploads/a9cb6e7af2.jpg'),
(5, 1, 14, 'Canon camera', 456.00, 'uploads/b6c467d266.png'),
(6, 2, 11, 'Samsung frieze title here', 965.00, 'uploads/c9774d72f4.png'),
(7, 2, 12, 'Acer Monitor', 653.00, 'uploads/a9cb6e7af2.jpg'),
(8, 2, 3, 'Lorem Ipsum is simply', 220.97, 'uploads/a5c5572e29.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brandId`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`catId`);

--
-- Indexes for table `tbl_compare`
--
ALTER TABLE `tbl_compare`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`productId`);

--
-- Indexes for table `tbl_wlist`
--
ALTER TABLE `tbl_wlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_compare`
--
ALTER TABLE `tbl_compare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_wlist`
--
ALTER TABLE `tbl_wlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
