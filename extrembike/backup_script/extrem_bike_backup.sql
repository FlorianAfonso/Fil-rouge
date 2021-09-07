-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 07 sep. 2021 à 12:49
-- Version du serveur : 5.7.33
-- Version de PHP : 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `extrem_bike`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `cat_id` smallint(6) NOT NULL,
  `cat_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`) VALUES
(1, 'bmc'),
(2, 'cube'),
(3, 'giant'),
(4, 'ktm'),
(5, 'scott');

-- --------------------------------------------------------

--
-- Structure de la table `contain`
--

CREATE TABLE `contain` (
  `pro_id` int(11) NOT NULL,
  `ord_id` int(11) NOT NULL,
  `ord_pro_quantity` smallint(6) NOT NULL,
  `ord_pro_discount` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

CREATE TABLE `customers` (
  `cus_id` int(11) NOT NULL,
  `cus_login` varchar(30) NOT NULL,
  `cus_password` varchar(60) NOT NULL,
  `cus_lastname` varchar(30) NOT NULL,
  `cus_firstname` varchar(30) NOT NULL,
  `cus_date_birth` date NOT NULL,
  `cus_email` varchar(320) NOT NULL,
  `cus_phone_number` char(10) DEFAULT NULL,
  `cus_address` varchar(255) DEFAULT NULL,
  `cus_city` varchar(30) DEFAULT NULL,
  `cus_zipcode` int(5) DEFAULT NULL,
  `cus_country` varchar(30) DEFAULT NULL,
  `cus_date_created` datetime NOT NULL,
  `cus_date_updated` datetime DEFAULT NULL,
  `cus_role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`cus_id`, `cus_login`, `cus_password`, `cus_lastname`, `cus_firstname`, `cus_date_birth`, `cus_email`, `cus_phone_number`, `cus_address`, `cus_city`, `cus_zipcode`, `cus_country`, `cus_date_created`, `cus_date_updated`, `cus_role`) VALUES
(2, 'Horiyoshi', '$2y$10$4xlNjpD3CYa73.e24v/9xer4kdH0o3aB/zUv6tMS31GVDxeslcNoa', 'Florian', 'Florian', '1990-09-21', 'florianafonso1990@gmail.com', '0645011315', '43 rue saint martin', 'Soissons', 2200, 'France', '2021-09-01 10:04:20', '2021-09-07 14:18:59', 'Big Boss'),
(3, 'flo', '$2y$10$q46.LUx75K24AKS6jKYyo.BLZpoN4dnQqJNetdtrGCEzwTreIo8zW', 'flo', 'flo', '2011-11-11', 'floaxis1@gmail.com', '1111111111', '19 rue Enleval', 'Barisis-aux-Bois', 2700, 'France', '2021-09-01 11:45:21', '2021-09-01 14:03:11', NULL),
(4, 'AliBaBa', '$2y$10$Zo4ksZKhxY4rjuuSyUCZk.PFxD7Tj5LIC39zsZO.3AUvBhd1p3TRC', 'Baba', 'Baba', '1995-05-31', 'alibaba@gmail.com', '0625031217', '19 rue du souck', 'Abidjan', 36152, 'Ukraine', '2021-09-01 16:03:20', '2021-09-01 16:13:38', 'fakir');

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `ord_id` int(11) NOT NULL,
  `ord_date_payment` datetime NOT NULL,
  `ord_date_delivery` datetime DEFAULT NULL,
  `ord_date_reception` datetime NOT NULL,
  `cus_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(30) NOT NULL,
  `pro_price` int(11) NOT NULL,
  `pro_reference` varchar(15) NOT NULL,
  `pro_stock` int(11) NOT NULL,
  `pro_alert_stock` int(11) DEFAULT NULL,
  `pro_color` varchar(50) DEFAULT NULL,
  `pro_description` text NOT NULL,
  `pro_date_created` datetime NOT NULL,
  `pro_date_updated` datetime DEFAULT NULL,
  `sup_id` int(11) DEFAULT NULL,
  `sub_id` smallint(6) DEFAULT NULL,
  `pro_cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`pro_id`, `pro_name`, `pro_price`, `pro_reference`, `pro_stock`, `pro_alert_stock`, `pro_color`, `pro_description`, `pro_date_created`, `pro_date_updated`, `sup_id`, `sub_id`, `pro_cat_id`) VALUES
(1, 'BMC Twostroke ', 3999, 'BMC1', 10, 2, 'Orange', 'Cadre : Twostroke 01 Premium Carbon, Fully Guided Internal Cable Routing, Integrated Fork stopper, Integrated Chain Guide, PF86 bottom bracket, Post Mount Disc, 12x148mm thru-axle\r\nFourche : Rock Shox Sid Select, 100mm\r\nVitesses : 1x12\r\nPédalier : SRAM X1 Eagle Carbon 34T\r\nCassette : SRAM GX Eagle 10-52T\r\nChaine : SRAM GX Eagle\r\nDérailleur arrière : SRAM X01 Eagle\r\nManettes : SRAM GX Eagle\r\nFreins : SRAM Level TLM / SRAM Centerline Rotors (160/160 S-M, 180/160 L-XL)\r\nGuidon : BMC MFB01 Carbon 760mm\r\nSTEM : BMC MSM01\r\nTige de selle : 01 Premium Carbon D-Shape Seatpost, 0mm offset\r\nSelle : Fizik Antares R7\r\nMoyeux : DT Swiss XR 1700\r\nJantes : DT Swiss XR 1700, 25mm\r\nPneus : Vittoria Barzo 2.25\r\nPoids : 9.5kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 1, 1, 1),
(2, 'BMC Fourstroke', 5999, 'BMC2', 10, 2, 'Blanc', 'Cadre : Fourstroke 01 Premium Carbon, 120mm Travel, Advanced Pivot System Suspension, Fully Guided Internal Cable Routing, Integrated Fork stopper\r\nFourche : Fox Float 34 SC - Performance Grip, Remote, 120mm\r\nAmortisseur arrière : Fox Float DPS - Performance Elite, Evol, Remote\r\nVitesses : 1x12\r\nPédalier : SRAM X1 Eagle Carbon 34T\r\nCassette : Sram GX Eagle 10-52T\r\nChaine : SRAM GX Eagle\r\nDérailleur arrière : SRAM GX Eagle\r\nManettes : SRAM GX Eagle\r\nFreins : Shimano Deore SLX / Shimano SM-RT66 Rotors (180/160)\r\nGuidon : BMC MFB01 Carbon 760mm\r\nSTEM : BMC MSM01\r\nTige de selle : BMC RAD, Integrated Dropper Seatpost, 80mm drop\r\nSelle : Fizik Antares R7\r\nMoyeux : DT Swiss M1900\r\nJantes : DT Swiss M1900, 30mm\r\nPneus : Maxxix Rekon 2.4\" WT, TR, EXO\r\nPoids : 12.1kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 1, 1, 1),
(3, 'BMC Speedfox ONE', 1999, 'BMC3', 10, 2, 'Vert aluminium', 'Cadre : Speedfox Premium Aluminium, 120mm Travel, Advanced Pivot System Suspension, Internal Cable Routing\r\nFourche : X-Fusion RC32, 130mm\r\nAmortisseur arrière : X Fusion 02 RL\r\nVitesses : 1x12\r\nPédalier : Shimano FC-MT510 30T\r\nCassette : Shimano Deore CS-M6100-12\r\nChaine : Shimano Deore 12 spd\r\nDérailleur arrière : Shimano Deore 12 spd\r\nManettes : Shimano Deore 12 spd\r\nFreins : Shimano BR-MT200 / Shimano SM-RT30 Rotors (180/180)\r\nGuidon : BMC MRB03 Alloy 760mm\r\nSTEM : BMC AMSM02\r\nTige de selle : X-Fusion RC32, 130mm\r\nSelle : WTB Silverado Comp\r\nMoyeux : Shimano HB-MT400-B/FH-MT410-B\r\nJantes : Alex MD30, 30mm\r\nPneus : Maxxis Forekaster 29x2.35 TR, EXO\r\nPoids : 15kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 1, 1, 1),
(4, 'BMC Speedfox TWO', 3699, 'BMC4', 10, 2, 'Noir', 'Cadre : Speedfox Premium Carbon (front), Premium Aluminium (rear), 120mm Travel, Advanced Pivot System Suspension, Internal Cable Routing\r\nFourche : Fox Float 34 Rhythm Grip, Remote, 130mm\r\nAmortisseur arrière : Fox Float DPS - Performance Elite, Evol, RemoteX-Fusion Manic dropper 125/150mm , 31,6mm\r\nVitesses : 1x12\r\nPédalier : SRAM X1 Eagle 1000 34T\r\nCassette : SRAM NX Eagle 11-50T\r\nChaine : SRAM SX Eagle\r\nDérailleur arrière : SRAM NX Eagle\r\nManettes : SRAM SX Eagle\r\nFreins : Shimano Deore / Shimano SM-RT54 \r\nGuidon : BMC MFB02 Alloy 750mm\r\nTige de selle : X-Fusion Manic dropper\r\nSelle : WTB Silverado Comp\r\nMoyeux : Shimano HB-MT400-B/FH-MT400-B\r\nJantes : Alex MD25, 25mm\r\nPneus : Maxxis Forekaster 29x2.35 TR, EXO\r\nPoids : 14.1kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 1, 1, 1),
(5, 'Cube Stereo 150 C:62 TM', 4599, 'CUBE1', 10, 2, 'Olive/gris', 'Cadre : C:62 Monocoque Advanced Twin Mold Technology, ATG, ETC 4-Link, ISCG Mount, Boost 148, AXH\r\nFourche : Fox 36 Float Factory FIT GRIP2, Tapered, 15x110mm, 160mm, Kashima Coated\r\nAmortisseur : Fox Float X2 Factory, 185x55mm, High/Low Speed Rebound & Compression w/ 2-Position Lever, Kashima Coated\r\nEntretoises d’amortisseur : Top: 54mm Trunnion Mount, Bottom: 22x8mm\r\nFrein : Magura MT7, Hydr. Disc Brake (203/180)\r\nDérailleur arrière : Sram GX Eagle™, 12-Speed\r\nLeviers : Sram GX Eagle™ Trigger\r\nPlateau : Sram X1 Eagle™ Carbon DUB 32T, 170mm\r\nGuide de chaîne : MRP SXg Chain Guide\r\nCassette : Sram XG-1275 Eagle™, 10-52T\r\nChaîne : Sram SX Eagle™\r\nRoues : Newmen Evolution SL A.30, 28/28 Spokes, 15x110mm/12x148mm, Tubeless Ready\r\nPneu avant : Maxxis Assegai, MaxxGrip/EXO+, Tubeless Ready, 2.5 WT\r\nPneu arrière : Maxxis Minion DHR II, MaxxTerra/EXO+, Tubeless Ready, 2.4 WT\r\nPotence : Race Face Turbine R 35\r\nCintre : Race Face Turbine R 35, 800mm\r\nPoignées : SDG Thrice\r\nTige de selle : Fox Transfer Factory 31.6mm, Kashima Coated (S: 125mm, M/L: 150mm, XL: 175mm)\r\nCollier de selle : CUBE Screwlock, 34.9mm\r\nSelle : SDG Bel Air V3\r\nJeu de direction : VP Integrated, Top 1 1/8\", Bottom 1 1/2\"\r\nPoids : 13.8kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 2, 1, 2),
(6, 'Cube Stereo 150 C:62 SL', 4099, 'CUBE2', 10, 2, 'Bleu/gris', 'Cadre : C:62 Monocoque Advanced Twin Mold Technology, ATG, ETC 4-Link, ISCG Mount, Boost 148, AXH\r\nFourche : Fox 36 Float Factory FIT GRIP2, Tapered, 15x110mm, 160mm, Kashima Coated\r\nAmortisseur : Fox Float X Factory, 185x55mm, Trunnion Mount, Adjustable LSC w/ 2-Pos. Lever, Kashima Coated\r\nEntretoises d’amortisseur : Top: 54mm Trunnion Mount, Bottom: 22x8mm\r\nFrein : Shimano XT BR-M8120/M8100, Hydr. Disc Brake (203/180)\r\nDérailleur arrière : Shimano XT RD-M8100-SGS, ShadowPlus, 12-Speed\r\nLeviers : Shimano XT SL-M8100-IR, Direct Attach\r\nPlateau : Shimano XT FC-M8100, 32T, Boost, 170mm\r\nGuide de chaîne : MRP 1X Chain Guide\r\nCassette : Shimano Deore CS-M6100, 10-51T\r\nChaîne : Shimano CN-M6100\r\nRoues : Newmen Evolution SL A.30, 28/28 Spokes, 15x110mm/12x148mm, Tubeless Ready\r\nPneu avant : Schwalbe Magic Mary, Super Trail, Addix Soft, Kevlar, 2.4\r\nPneu arrière : Schwalbe Big Betty, Super Trail, Addix Soft, Kevlar, 2.4\r\nPotence : Race Face Aeffect R 35\r\nCintre : Race Face Chester 35, 780mm\r\nPoignées : ACID Disrupt, Soft Compound\r\nTige de selle : Fox Transfer Factory 31.6mm, Kashima Coated (S: 125mm, M/L: 150mm, XL: 175mm)\r\nCollier de selle : CUBE Screwlock, 34.9mm\r\nSelle : Natural Fit Nuance Lite\r\nJeu de direction : VP Integrated, Top 1 1/8\", Bottom 1 1/2\"\r\nPoids : 14.5kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 2, 1, 2),
(7, 'Cube Stereo 120 HPC SLT', 4549, 'CUBE3', 10, 2, 'Gris paillete', 'Cadre : HPC Carbon Monocoque Advanced Twin Mold Technology, Aluminum 6061 T6 Rear Triangle, ATG, ETC 4-Link, Boost 148, AXH\r\nFourche : Fox 34 Float Factory FIT4, Open(Adjustable)/Medium/Firm Mode, Tapered, 15x110mm, 130mm, Kashima Coated\r\nAmortisseur : Fox Float DPS Factory, 190x45mm, Open(Adjustable)/Medium/Firm Mode, Kashima Coated\r\nEntretoises d’amortisseur : Top: 40x8mm, Bottom: 22x8mm\r\nFrein : Shimano XT BR-M8100, Hydr. Disc Brake (180/180)\r\nDérailleur arrière : Shimano XT RD-M8100-SGS, ShadowPlus, 12-Speed\r\nLeviers : Shimano XT SL-M8100-IR, Direct Attach\r\nPlateau : e*thirteen TRS Race Carbon, 30T, Boost, 175mm (170mm for S)\r\nCassette : Shimano XT CS-M8100, 10-51T\r\nChaîne : Shimano CN-M6100\r\nRoues : Newmen Advanced SL X.A.30 Carbon, 28/28 Spokes, 15x110mm/12x148mm, Tubeless Ready\r\nPneu avant : Maxxis Rekon, EXO, Tubeless Ready, 2.4\r\nPneu arrière : Maxxis Rekon Race, EXO, Tubeless Ready, 2.35\r\nPotence : Newmen Evolution SL 318.4, 31.8mm\r\nCintre : Newmen Advanced SL 318.20, Carbon, 750mm\r\nPoignées : ACID Disrupt, Soft Compound\r\nTige de selle : Fox Transfer Factory 31.6mm, Kashima Coated (S: 125mm, M/L: 150mm, XL: 175mm)\r\nCollier de selle : CUBE Screwlock, 34.9mm\r\nSelle : Natural Fit Nuance SLT Carbon\r\nJeu de direction : VP Integrated, Top 1 1/8\", Bottom 1 1/2\"\r\nExtras : Schwalbe Aerothan™ Inner Tubes\r\nPoids : 11.6kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 2, 1, 2),
(8, 'Cube Stereo 120 HPC EX', 3849, 'CUBE4', 10, 2, 'Blanc/noir', 'Cadre : HPC Carbon Monocoque Advanced Twin Mold Technology, Aluminum 6061 T6 Rear Triangle, ATG, ETC 4-Link, Boost 148, AXH\r\nFourche : Fox 34 Float Factory FIT GRIP2, Tapered, 15x110mm, 130mm, Kashima Coated\r\nAmortisseur : Fox Float Float X Factory, 190x45mm, Adjustable LSC w/ 2-Pos. Lever, Kashima Coated\r\nEntretoises d’amortisseur : Top: 40x8mm, Bottom: 22x8mm\r\nFrein : Shimano XT BR-M8100, Hydr. Disc Brake (203/180)\r\nDérailleur arrière : Shimano XT RD-M8100-SGS, ShadowPlus, 12-Speed\r\nLeviers : Shimano XT SL-M8100-IR, Direct Attach\r\nPlateau : Praxis Girder Carbon, Boost, 30T, sealed Enduro™ Bearings, 170mm\r\nCassette : Shimano SLX CS-M7100, 10-51T\r\nChaîne : Shimano CN-M6100\r\nRoues : Newmen Evolution SL A.30, 28/28 Spokes, 15x110mm/12x148mm, Tubeless Ready\r\nPneu avant : Maxxis Minion DHF, Dual/EXO, Tubeless Ready, 2.5 WT\r\nPneu arrière : Maxxis Minion DHR II, Dual/EXO, Tubeless Ready, 2.4 WT\r\nPotence : Newmen Evolution SL 318.4, 31.8mm\r\nCintre : Newmen Evolution SL 318.25, 760mm\r\nPoignées : SDG Thrice\r\nTige de selle : Fox Transfer Factory 31.6mm, Kashima Coated (S: 125mm, M/L: 150mm, XL: 175mm)\r\nCollier de selle : CUBE Screwlock, 34.9mm\r\nSelle : SDG Bel Air V3\r\nJeu de direction : VP Integrated, Top 1 1/8\", Bottom 1 1/2\"\r\nPoids : 13.2kg\r\n', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 2, 1, 2),
(9, 'Cube AMS ZERO99 C:68X', 4399, 'CUBE5', 10, 2, 'Cerise', 'Cadre : C:68X Monocoque Advanced Twin Mold Technology, FSP 4-Link, Boost 148, UDH™\r\nFourche : Fox 32 SC Float Performance, 2-Position Remote, Tapered, 15x110mm, 100mm\r\nAmortisseur : Fox Float DPS Performance Elite Remote, 190x40mm, 2-Position Remote\r\nEntretoises d’amortisseur : Front: 26x8mm, Rear: 30x8mm\r\nFrein : Shimano XT BR-M8100, Hydr. Disc Brake (180/160)\r\nDérailleur arrière : Shimano XT RD-M8100-SGS, ShadowPlus, 12-Speed\r\nLeviers : Shimano XT SL-M8100-IR, Direct Attach\r\nPlateau : Shimano XT FC-M8100, 32T, Boost, 175mm (170mm for size S)\r\nCassette : Shimano XT CS-M8100, 10-51T\r\nChaîne : Shimano CN-M6100\r\nRoues : Newmen Evolution SL X.A.25, 28/28 Spokes, 15x110mm/12x148mm, Tubeless Ready\r\nPneu avant : Schwalbe Racing Ray, Super Race, Addix Speedgrip, Kevlar, 2.25\r\nPneu arrière : Schwalbe Racing Ralph, Super Race, Addix Speedgrip, Kevlar, 2.25\r\nPotence : Newmen Evolution SL 318.2, 31.8mm\r\nCintre : Newmen Advanced 318.0, Carbon, 740mm\r\nPoignées : ACID React Pro\r\nTige de selle : Newmen Advanced, Carbon, 30.9mm\r\nCollier de selle : CUBE Screwlock, 34.9mm\r\nSelle : Natural Fit Nuance SLT Carbon\r\nJeu de direction : ACROS Integrated, Top 1 1/8\", Bottom 1 1/2\", Fiber Inserts for 0.6° Angle Adjustment\r\nPoids : 10.7kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 2, 1, 2),
(10, 'Cube Reaction C:62 ONE', 1499, 'CUBE6', 10, 2, 'Rouge', 'Cadre : C:62 Monocoque Advanced Twin Mold Technology, ARG2, Tapered Headtube, PressFit BB\r\nFourche : SR Suntour Raidon 32 Air, Boost, 100mm, Remote Lockout\r\nFrein : Magura MT Thirty, Front 2-Piston/Rear 2-Piston, Hydr. Disc Brake (180/160)\r\nDérailleur arrière : Sram NX Eagle™, 12-Speed\r\nLeviers : Sram SX Eagle™ Trigger\r\nPlateau : Sram SX Eagle™ DUB 32T\r\nCassette : Sram XG-1230 Eagle™, 11-50T\r\nChaîne : Sram SX Eagle™\r\nRoues : Answer Atac AM, 15x110mm/12x148mm, Tubeless-Ready\r\nPneu avant : Schwalbe Racing Ray, Addix Performance, Kevlar, 2.25\r\nPneu arrière : Schwalbe Racing Ralph, Addix Performance, Kevlar, 2.25\r\nPotence : CUBE Performance Stem SL, 31.8mm\r\nCintre : CUBE Flat Race Bar, 720mm\r\nPoignées : ACID React Pro\r\nTige de selle : CUBE Performance Post, 27.2mm\r\nCollier de selle : CUBE Varioclose, 31.8mm\r\nSelle : Natural Fit Venec\r\nJeu de direction : VP Integrated, Top 1 1/8\", Bottom 1 1/2\"\r\nPoids : 11.5kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 2, 1, 2),
(11, 'Cube Reaction Pro', 1399, 'CUBE7', 10, 2, 'Bleu acier', 'Cadre : Aluminium Lite, AMF, Double Butted, Internal Cable Routing, Tapered Head Tube, Flat Mount Brake, SIC Mount, FM Kickstand Mount\r\nFourche : RockShox Judy Silver TK Air, 100mm, PopLoc\r\nFrein : Shimano XT BR-M8100, Hydr. Disc Brake, PM/FM (180/160)\r\nDérailleur arrière : Shimano XT RD-M8100-SGS, ShadowPlus, 12-Speed\r\nLeviers : Shimano Deore SL-M6100-IR, Direct Attach, Rapidfire-Plus\r\nPlateau : Shimano FC-MT611, 32T\r\nCassette : Shimano Deore CS-M6100, 10-51T\r\nChaîne : Shimano CN-M6100\r\nMoyeu avant : Shimano HB-M4050, QR, Centerlock\r\nMoyeu arrière : Shimano FH-MT401, QR, Centerlock\r\nJantes : CUBE ZX20, 32H, Disc\r\nPneu avant : Schwalbe Racing Ray, Addix Performance, Kevlar, 2.25\r\nPneu arrière : Schwalbe Racing Ralph, Addix Performance, Kevlar, 2.25\r\nPotence : CUBE Performance Stem SL, 31.8mm\r\nCintre : CUBE Flat Race Bar, 720mm\r\nPoignées : ACID React Pro\r\nTige de selle : CUBE Performance Post, 27.2mm\r\nCollier de selle : CUBE Varioclose, 31.8mm\r\nSelle : Natural Fit Venec\r\nJeu de direction : CUBE FPH868, Top 1 1/8\", Bottom 1 1/2\", Semi-Integrated\r\nPédales : CUBE PP MTB\r\nPoids : 12.9kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 2, 1, 2),
(12, 'Cube Access WS', 549, 'CUBE8', 10, 2, 'Violet', 'Cadre : Aluminium Lite, AMF, Double Butted, Internal Cable Routing, Flat Mount Brake, SIC Mount, FM Kickstand Mount\r\nFourche : SR Suntour XCE, 100mm\r\nFrein : Tektro MD-280/U310R, Mech. Disc Brake (160/160)\r\nDérailleur arrière : Shimano RD-TX800, 8-Speed\r\nDérailleur avant : Shimano FD-M315, Top Swing, 31.8mm Clamp\r\nLeviers : Shimano SL-M315, Rapidfire-Plus\r\nPlateau : Shimano FC-M315, 36x22T\r\nCassette : Shimano CS-HG200, 12-32T\r\nChaîne : KMC Z8.3\r\nMoyeu avant : CUBE Alloy Light, QR, 6-Bolt\r\nMoyeu arrière : CUBE Alloy Light, QR, 6-Bolt\r\nJantes : CUBE ZX20, 32H, Disc\r\nPneus : CUBE IMPAC Smartpac, 2.25\r\nPotence : CUBE Performance Stem, 31.8mm\r\nCintre : CUBE Rise Trail Bar, 680mm\r\nPoignées : ACID React\r\nTige de selle : CUBE Performance Post, 27.2mm\r\nCollier de selle : CUBE Varioclose, 31.8mm\r\nSelle : Natural Fit Venec Lite WS\r\nJeu de direction : CUBE FPH863, Semi-Integrated\r\nPédales : CUBE PP MTB\r\nPoids : 14.8kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 2, 1, 2),
(13, 'Giant Talon ', 427, 'GIANT1', 10, 2, 'Bleu nuit', 'Cadre : ALUXX\r\nFourche : SR Suntour XCE 29 / 27.5, 100mm / 80mm\r\nAmortisseur : N/A\r\nCintre : Giant Connect Trail, 780x31.8\r\nPotence : Giant Sport, 7-degree\r\nTige de selle : Giant Sport, 30.9\r\nSelle : Giant custom\r\nPédales : MTB caged\r\nManettes : Shimano SL-M315\r\nDérailleur avant : Shimano M315\r\nDérailleur arrière : Shimano Tourney\r\nFreins : Tektro TKD 172, mechanical\r\nLeviers de frein : RS360A\r\nCassette : Shimano MF-TZ500, 14x34\r\nChaîne : KMC Z7\r\nPédalier : ProWheel forged, 22/36\r\nBoitier de pédalier : cartridge\r\nJantes : Giant GX03V 29 / 27.5, alloy, double wall, 21mm\r\nMoyeux : [F]Giant Tracker Giant Sport QR, loose ball [R] Giant Tracker Giant Sport QR, loose ball\r\nRayons : stainless, 14g\r\nPneus : Maxxis Ikon 27.5 / 29x2.2, wire bead\r\nPoids : 14kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 3, 1, 3),
(14, 'Giant XTC Advanced', 1995, 'GIANT2', 10, 2, 'Bronze/noir', 'Cadre : Advanced Composite\r\nFourche : Giant Crest 34 RRL, 100mm, blocage au guidon\r\nAmortisseur : N/A\r\nCintre : Giant Contact SL XC Flat, 780x31.8\r\nPotence : Giant Contact\r\nTige de selle : Giant Connect, 30.9\r\nSelle : Giant Contact (neutral)\r\nPédales : platform\r\nManettes : Shimano Deore\r\nDérailleur avant : N/A\r\nDérailleur arrière : Shimano Deore\r\nFreins : Shimano MT410\r\nLeviers de frein : Shimano MT401\r\nCassette : Shimano Deore, 11x51\r\nChaîne : Shimano\r\nPédalier : Praxis Cadet Boost, 32t\r\nBoitier de pédalier : Praxis, press fit\r\nJantes : Giant XCT 29” alloy\r\nMoyeux : Shimano, sealed bearing\r\nRayons : Sapim\r\nPneus : Maxxis Recon Race 29x2.25, foldable, TLR, EXO, tubeless\r\nExtras : tubeless prepared\r\nPoids : 11.43kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 3, 1, 3),
(15, 'Giant Anthem', 2660, 'GIANT3', 10, 2, 'Noir mate', 'Cadre : ALUXX SL-Grade Aluminum, 90mm Maestro suspension\r\nFourche : Fox 32 Float SC Performance, 100mm, GRIP damper, 44mm offset, Boost 15x110, KaBolt, custom tuned for Giant\r\nAmortisseur : Fox Float DPS Performance, 165/42.5, custom tuned for Giant\r\nCintre : Giant Contact SL XC Flat, 780x31.8\r\nPotence : Giant Contact\r\nTige de selle : Giant Contact, 27.2mm\r\nSelle : Contact SL (neutral)\r\nPédales : platform\r\nManettes : Shimano SLX\r\nDérailleur avant : N/A\r\nDérailleur arrière : Shimano SLX\r\nFreins : Shimano MT500\r\nLeviers de frein : Shimano MT501\r\nCassette : Shimano SLX, 10x51\r\nChaîne : KMC X-12\r\nPédalier : Shimano SLX, 32t\r\nBoitier de pédalier : Shimano, press fit\r\nJantes : Giant XCT 29 alloy\r\nMoyeux : Shimano, sealed bearing\r\nRayons : Sapim\r\nPneus : [F] Maxxis Recon Race 29x2.35, foldable, TLR, EXO, tubeless, [R] Maxxis Recon Race 29x2.25, foldable, TLR, EXO, tubeless\r\nExtras : tubeless prepared\r\nPoids : 12.4kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 3, 1, 3),
(16, 'Giant Trance X Advanced', 8740, 'GIANT4', 10, 2, 'Vert/violet', 'Cadre : Advanced-Grade Composite front and rear triangles, 135mm Maestro suspension, flip chip\r\nFourche : Fox 36 Factory Live Valve, FIT4, 44mm offset, 150mm, 15x110 Kabolt, custom tuned for Giant\r\nAmortisseur : Fox Float DPX2 Factory Live Valve, 185/55, custom tuned for Giant\r\nCintre : Giant Contact SLR TR35, 780x35mm, 20mm rise\r\nPotence : Giant Contact SL 35\r\nTige de selle : Fox Transfer Factory dropper with Shimano remote, 30.9\r\nSelle : Giant Romero SL\r\nPédales : platform\r\nManettes : Shimano Deore XT\r\nDérailleur avant : N/A\r\nDérailleur arrière : Shimano Deore XTR\r\nFreins : Shimano Deore XT\r\nLeviers de frein : Shimano Deore XT\r\nCassette : Shimano Deore XT, 10x51\r\nChaîne : Shimano\r\nPédalier : Shimano Deore XT, 30t with MRP AMG V2 Carbon guide\r\nBoitier de pédalier : Shimano, press fit\r\nJantes : Giant TRX-1 29 WheelSystem\r\nMoyeux : Giant TRX-1 29 WheelSystem\r\nRayons : Giant TRX-1 29 WheelSystem\r\nPneus : [F] Maxxis Minion DHF 29x2.5, 3C, Max Terra, EXO, TR [R] Maxxis Dissector 29x2.4, 3C, Max Terra, EXO, TR, tubeless\r\nExtras : tubeless prepared\r\nPoids : 13.38 Kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 3, 1, 3),
(17, 'Giant Reign Advanced Pro', 8835, 'GIANT5', 10, 2, 'Blanc/rose', 'Cadre : Advanced-Grade Composite front and rear triangles, 146mm Maestro suspension\r\nFourche : Fox 38 Float, 170mm, GRIP2 damper, 15x110 Kabolt, tapered, 44mm offset, custom tuned for Giant\r\nAmortisseur : Fox DHX2 Factory, 205/60, custom tuned for Giant\r\nCintre : Giant Contact SLR TR35, 780x35mm, 20mm rise\r\nPotence : Giant Contact SL 35\r\nTige de selle : Fox Transfer Factory with Shimano remote\r\nSelle : Giant Romero SL\r\nPédales : platform\r\nManettes : Shimano XTR\r\nDérailleur avant : N/A\r\nDérailleur arrière : Shimano XTR\r\nFreins : Shimano XTR\r\nLeviers de frein : Shimano XTR\r\nCassette : Shimano XTR, 10x51\r\nChaîne : Shimano XTR\r\nPédalier : Shimano XTR, 34t with MRP AMG V2 Carbon guide\r\nBoitier de pédalier : Shimano, press fit\r\nJantes : Giant TRX-0 29 WheelSystem\r\nMoyeux : Giant TRX-0 29 WheelSystem\r\nRayons : Giant TRX-0 29 WheelSystem\r\nPneus : [F] Maxxis Assegai 29x2.5 WT, 3C MaxxTerra, , EXO+, TR [R] Maxxis Minion DHR II 29x2.4 WT, 3C MaxxTerra , EXO+, TR tubeless\r\nExtras : tubeless prepared\r\nPoids : 13.64kg ', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 3, 1, 3),
(18, 'KTM Ultra Fun', 819, 'KTM1', 10, 2, 'Bleu ciel', 'Cadre : 29\" Alloy 6061 MTB M1110\r\nFourche : Suntour XCM RL DS 29\" 100mm remote\r\nDérailleur arrière : Shimano Deore M592-SGS\r\nDérailleur avant : Shimano Alivio M3120\r\nLeviers : Shimano Alivio SL-M3100\r\nEnsemble pédalier : Shimano MT2102 36-22\r\nCassette : Shimano HG200-9 / 11-36\r\nChaîne : Shimano HG53\r\nFreins : Shimano MT200 2-Piston\r\nRotor : Shimano RT10 CL 180 / 160\r\nRoue avant : KTM Line - Shimano HB-TX505 CL 32H QR / KTM 29\" 32H ROCKY 22 RX 622x22 / RM 2.0 INOX silver\r\nRoue arrière : KTM Line - Shimano FH-TX505 CL 32H QR / KTM 29\" 32H ROCKY 22 RX 622x22 / RM 2.0 INOX silver\r\nPneu avant : Schwalbe RAPID ROB K-Guard 57-622\r\nPneu arrière : Schwalbe RAPID ROB K-Guard 57-622\r\nPoignées : KTM Comp Lock\r\nGuidon : KTM Comp Riser 15 720mm\r\nJeu de direction : KTM Comp 7°\r\nPotence : Ritchey Zero Logic PRESS FIT 1-1/8\" 15mm cover\r\nSelle : KTM MTB\r\nTige de selle : KTM Comp 27,2\r\nPédales : KTM Comp MTB C280DU alloy\r\nPoids : 14.80kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 4, 1, 4),
(19, 'KTM Scarp MT 1964 Elite', 3449, 'KTM2', 10, 2, 'Blanc', 'Cadre : Scarp 29\" Premium Carbon-Alloy rear SLL115mm / M-0916\r\nFourche : FOX 32 Float 29\" Rhythm 120mm remote\r\nAmortisseur : FOX Float DPS PerformanceElite remote 190x45\r\nDérailleur arrière : Shimano Deore XT M8100-12 SGS shadow+\r\nLeviers : Shimano Deore XT M8100-12\r\nEnsemble pédalier : Shimano Deore XT M8120 32T\r\nCassette : Shimano Deore M6100-12 / 10-51\r\nChaîne : Shimano Deore M6100-12\r\nFreins : Shimano Deore M6100 / M6100 2-Piston\r\nRotor : Shimano RT54 CL 180 / 160\r\nRoue avant : KTM Line - Shimano MT410B CL 32H 110-15TA / Ambrosio E30 Trail 32H 622x30TC / DT Champion 2.0 black\r\nRoue arrière : KTM Line - Shimano MT410B CL 32H 148-12TA / Ambrosio E30 Trail 32H 622x30TC / DT Champion 2.0 black\r\nPneu avant : Maxxis Rekon EXO/TR 62-622\r\nPneu arrière : Maxxis Rekon EXO/TR 62-622\r\nPoignées : KTM Team silicone\r\nGuidon : KTM Team flat 2X 740mm\r\nJeu de direction : KTM Team MTB 7°\r\nPotence : KTM Team drop/in 1.1/8\"-1.5\"\r\nSelle : Ergon SM10\r\nTige de selle : KTM Comp dropper internal\r\nPoids : 13.6kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 4, 1, 4),
(20, 'KTM Scarp MT Exonic', 8549, 'KTM3', 10, 2, 'Orange', 'Cadre : Scarp 29\" Premium Carbon SLL115mm / M-1926\r\nFourche : FOX 34 Float SC 29\" Factory 120mm (kashima) remote\r\nAmortisseur : FOX Float DPS Factory remote 190x45\r\nDérailleur arrière : SRAM XX1 Eagle AXS 12speed\r\nLeviers : SRAM Eagle AXS Controller\r\nEnsemble pédalier : SRAM XX1 Eagle DUB Carbon 32T\r\nCassette : SRAM XX1 Eagle XG-1299 / 10-52 rainbow\r\nChaîne : SRAM XX1 Eagle 12s\r\nFreins : Shimano XTR M9100 / M9100 2-Piston\r\nRotor : Shimano MT900 CL 160 / 160 Freeza\r\nRoue avant : DT Swiss XRC 1200 Spline 30 Carbon CL 110-15TA / 622x30TSS TLR\r\nRoue arrière : DT Swiss XRC 1200 Spline 30 Carbon CL 142-12TA / 622x30TSS TLR\r\nPneu avant : Schwalbe Racing Ray Evo SuperRace TLE 60-622\r\nPneu arrière : Schwalbe Racing Ralph Evo SuperRace TLE 60-622\r\nPoignées : KTM Team silicone\r\nGuidon : KTM Prime Carbon flat 740mm\r\nJeu de direction : KTM Prime MTB 6°\r\nPotence : KTM Prime drop/in 1.1/8\"-1.5\"\r\nSelle : Selle Italia SLR Boost flow Carbon rails\r\nTige de selle : KTM Prime Carbon zero 30.9/400\r\nPoids : 9.8kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 4, 1, 4),
(21, 'KTM Prowler Master', 4649, 'KTM4', 10, 2, 'Vert essence', 'Cadre : Prowler 29\" Performance Carbon SLL-LT 150mm / M-8606\r\nFourche : FOX 36 Float 29\" Rhythm 160mm\r\nAmortisseur : FOX Float DPX2 PerformanceElite 3Position 230x65\r\nDérailleur arrière : Shimano Deore XT M8100-12 SGS shadow+\r\nLeviers : Shimano Deore XT M8100-12\r\nEnsemble pédalier : Shimano Deore XT M8120 30T\r\nCassette : Shimano Deore M6100-12 / 10-51\r\nChaîne : Shimano Deore M6100-12\r\nFreins : Shimano Deore M6100 / M6120 4-Piston\r\nRotor : Shimano RT64 CL 203 / 180\r\nRoue avant : KTM Comp Trail 29 CL 110-15TA / 622x30TC TLR made by DT Swiss\r\nRoue arrière : KTM Comp Trail 29 CL 148-12TA / 622x30TC TLR made by DT Swiss\r\nPneu avant : Onza Porcupine White Edition TLR 62-622\r\nPneu arrière : Onza Porcupine White Edition TLR 62-622\r\nPoignées : Ergon GE10 Evo Factory\r\nGuidon : KTM Team Trail35 rizer25 800mm\r\nJeu de direction : KTM Team Trail35\r\nPotence : KTM Team drop/in 1.1/8\"-1.5\"\r\nSelle : Ergon SM10 Enduro Comp Men\r\nTige de selle : KTM Team dropper internal\r\npoids : 14.2kg ', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 4, 1, 4),
(22, 'Scott Contessa Spark RC', 7999, 'SCOTT1', 10, 2, 'Vert/Noir mate', 'Cadre : Spark RC Carbon HMX Integrated Suspension Technology Flex Pivot / Adjustable head angle Syncros Cable Integration System\r\nFourche : RockShox SID Select+ RL3 Air\r\n          custom Charger 3-Mode Damper\r\nAmortisseur : RockShox NUDE 5 RL3 Trunnion SCOTT custom w. travel / geo adj.\r\n              3 modes: Lockout-Traction Control-Descend\r\nContrôle suspensions : SCOTT TwinLoc 2 Technology Suspension & Dropper Remote 3 Suspension modes\r\nDérailleur arrière : SRAM X01 Eagle AXS / 12 Speed Wireless Electronic Shift System\r\nShifters : SRAM GX Eagle AXS Rocker Controller\r\nPédalier : SRAM X01 DUB Eagle Carbon crankarm 55mm CL / 30T\r\nBoîtier : SRAM DUB PF 92 MTB Wide / shell 41x92mm\r\nChaîne : SRAM CN X01 Eagle\r\nCassette : SRAM X01 XG1295 / 10-52 T\r\nFreins : Shimano XTR M9100 Disc\r\nRotor : Shimano SM-RT76 / 6 Bolt / 180/F and 160/R\r\nCintre : Syncros Fraser iC SL XC Carbon\r\nSelle : Syncros Celista 1.5 (Regular) Channel\r\nRoues : Syncros Silverton 1.0-30 6 Bolt\r\nPneu avant : Maxxis Rekon Race / 29x2.4\" / 120TPI Foldable Bead Tubeless Ready / EXO\r\nPneu arrière : Maxxis Rekon Race / 29x2.4\" / 120TPI Foldable Bead Tubeless Ready / EXO\r\nExtras : SRAM AXS Powerpack\r\nAccessoires : Syncros Eco Sealant , Transport Axle\r\nPoids : 10.7kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 5, 1, 5),
(23, 'Scott Spark RC Comp', 3499, 'SCOTT2', 10, 2, 'Jaune Fluo ', 'Cadre : Spark RC Carbon HMF Integrated Suspension Technology Flex Pivot / Adjustable head angle Syncros Cable Integration System\r\nFourche : FOX 32 Float Rhythm Grip 3 3-Modes / Kabolt 15x110mm axle / 44mm offset / tapered steerer\r\nAmortisseur : FOX Float Custom EVOL Performace Trunnion 3 modes / Lockout-Trail-Descend\r\nContrôle suspensions : SCOTT TwinLoc 2 Technology 3 Suspension modes\r\nDérailleur arrière : SRAM NX Eagle 12 Speed\r\nShifters : SRAM NX Eagle Trigger\r\nPédalier : SRAM NX Eagle DUB 55mm CL / 32T\r\nBoîtier : SRAM DUB PF 92 MTB Wide / shell 41x92mm\r\nChaîne : SRAM CN NX Eagle\r\nCassette : SRAM SX-PG1210 / 11-50 T\r\nFreins : Shimano Deore M6100 Disc\r\nRotor : Shimano SM-RT64 CL / 180/F and 160/R\r\nCintre : Syncros Fraser 2.0 XC Alloy 6061 D.B. Flat Bar / 8° / 740mm Syncros Pro lock-on grips\r\nPotence : Syncros XC 2.0 \r\nTige de selle : Syncros Duncan 2.0 / 10mm offset\r\nSelle : Syncros Belcarra Regular 2.0\r\nJantes : Syncros X-30SE / 32H / 30mm Tubeless ready\r\nPneu avant : Maxxis Rekon Race Tubeless Ready / EXO\r\nPneu arrière : Maxxis Rekon Race Tubeless Ready / EXO\r\nAccessoires : Transport Axle\r\nPoids : 12.5kg ', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 5, 1, 5),
(24, 'Scott Contessa Spark 930', 2299, 'SCOTT3', 10, 2, 'Orange', 'Cadre : Spark 3 Alloy SL 6011 Custom Butted Hydroformed Tubes\r\nFourche : RockShox Judy Silver TK Solo Air 2-Modes / Reb. Adj. / Lockout / 130mm travel\r\nAmortisseur : X-Fusion NUDE RLX Trunnion SCOTT custom w. travel / geo adj. 3 modes: Lockout-Traction Control -Descend\r\nContrôle suspensions : SCOTT TwinLoc TSP Suspension-Seatpost Remote\r\nDérailleur arrière : Shimano XT RD-M8100 SGS Shadow Plus / 12 Speed\r\nShifters : Shimano Deore SL-M6100-IR / Rapidfire Plus\r\nPédalier : Shimano FC-MT511-1\r\nBoîtier : Shimano BB-MT500 / shell 41x92mm\r\nChaîne : KMC X12\r\nCassette : Shimano Deore CS-M6100-12 / 10-51 T\r\nFreins : Shimano MT201 Disc\r\nCintre : Syncros Alloy 6061 T shape Flat / 9° / 760mm\r\nPotence : Syncros Alloy 6061\r\nTige de selle : Syncros Duncan Dropper Post 2.5\r\nSelle : Syncros Savona 2.5 (V-Concept) Channel\r\nJantes : Syncros X-25 / 32H / 25mm\r\nPneu avant : Maxxis Rekon / 2,4\" / 60TPI\r\nPneu arrière : Maxxis Rekon / 2,4\" / 60TPI\r\nPoids : 14.4kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 5, 1, 5),
(25, 'Scott Aspect 970', 459, 'SCOTT4', 10, 2, 'Bleu/Orange', 'Cadre : Aspect 900-700 series / Alloy 6061 Custom Tubing BSA73 / Internal Cable Routing / replaceable hanger\r\nFourche : Suntour XCE28 100mm travel\r\nDérailleur arrière : Shimano Tourney RD-TY300 21 Speed\r\nDérailleur avant : MicroShift FD-M20 / 31.8mm\r\nShifters : Shimano ST-EF-41-L / 7R EZ-fire plus w/gear indicator\r\nPédalier : Prowheel TA-CQ01 42x34x24 w/CG\r\nChaîne : KMC Z-7\r\nCassette : Sunrace CSM40 7AV / 11-34T\r\nFreins : Tektro SCM-02 Mech. Disc\r\nCintre : HL MTB-AL-312BT / 720mm / black / 12mm rise\r\nPotence : TDS-C301-8FOV / 10° / 31.8 / Black\r\nTige de selle : HL SP C207\r\nSelle : Syncros 3.0\r\nJantes : Syncros X-20 Disc 32H / black\r\nPneu avant : Pneus Kenda Booster\r\nPneu arrière : Pneus Kenda Booster\r\nPédales : Feimin FP-803\r\nPoids : 14.95kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 5, 1, 5),
(26, 'Scott Gambler 900 Tuned', 8499, 'SCOTT5', 10, 2, 'Blanc', 'Cadre : Gambler Carbon / IMP Technology / HMX BB107 / Carbon swingarm VLK Virtual 4 Link kinematic\r\nFourche : FOX 40 Factory / Kashima / Air GRIP2 / Hi-Lo Comp / Rebound / 52mm Offset\r\nAmortisseur : FOX DH X2 Factory Independent high/low comp. / rebound / RVS\r\nDérailleur arrière : SRAM XO1 DH Short cage / 7 Speed\r\nShifters : SRAM XO1 DH Trigger Shifter / 7 Speed\r\nPédalier : SRAM X01 DH DUB Carbon 34T Alloy Chainring DM / 165mm\r\nChainguide : SCOTT DH Custom\r\nBoîtier : SRAM DUB PF MTB107 Shell 107x41mm\r\nChaîne : KMC X11-1 Black\r\nCassette : SRAM CS PG-720 DH 11-25\r\nFreins : Shimano XTR M9120 4 Piston Disc\r\nCintre : Syncros Hixon iC DH Carbon 15mm Rise / 8° / 800mm Syncros Pro DH dual lock-on grips\r\nTige de selle : Syncros DH1.5 / 31.6mm / Alloy7050\r\nSelle : Syncros Kaslo 1.5 Titanium Rails\r\nRoues : Syncros Revelsoke DH 1.5 / 110x20 Boost front / 157x12 rear / 29\" / 32H / Tubeless Ready Rims\r\nPneu avant : Maxxis Assegai 29 x 2,5\" / Renforts en kevlar 2 x 60TPI / DH / TR / Grip 3C Maxx\r\nPneu arrière : Maxxis Assegai 29 x 2,5\" / Renforts en kevlar 2 x 60TPI / DH / TR / Grip 3C Maxx\r\nExtras : Fox 40 Fender\r\nPoids : 15.6kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 5, 1, 5),
(27, 'Scott Spark 970', 1999, 'SCOTT6', 10, 2, 'Vert Fluo', 'Cadre : Spark 3 Alloy SL 6011 Custom Butted Hydroformed Tubes\r\nFourche : RockShox Judy Silver TK Solo Air\r\nAmortisseur : X-Fusion NUDE RLX Trunnion SCOTT custom w. travel / geo adj. 3 modes: Lockout-Traction Control -Descend\r\nContrôle suspensions : SCOTT TwinLoc TSP Suspension-Seatpost Remote below Bar / integ. Grip clamp\r\nDérailleur arrière : SRAM NX / Eagle 12 Speed\r\nShifters : SRAM SX Eagle Trigger\r\nPédalier : SRAM SX Eagle DUB Boost 32T\r\nBoîtier : SRAM DUB PF integrated / shell 41x92mm\r\nChaîne : SRAM CN SX Eagle\r\nCassette : SRAM SX-PG1210 / 11-50 T\r\nFreins : Shimano MT201 Disc\r\nCintre : Syncros Alloy 6061 T shape Flat / 9° / 760mm\r\nPotence : Syncros Alloy 6061 oversized 31.8mm / 1 1/8\" / 6° angle\r\nTige de selle : Syncros Duncan Dropper Post\r\nSelle : Syncros Belcarra Regular 2.5\r\nJantes : Syncros X-25 / 32H / 25mm\r\nPneu avant : Maxxis Rekon / 2,4\" / 60TPI\r\nPneu arrière : Maxxis Rekon / 2,4\" / 60TPI\r\nPoids : 14.8kg', '2021-01-01 00:00:00', '2021-01-02 00:00:00', 5, 1, 5),
(28, 'KTM Scarp Glorious', 3549, 'KTM5', 10, NULL, 'Bleu', 'hgnh', '2021-09-07 14:18:34', NULL, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Structure de la table `subcategories`
--

CREATE TABLE `subcategories` (
  `sub_id` smallint(6) NOT NULL,
  `sub_name` varchar(20) NOT NULL,
  `cat_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `suppliers`
--

CREATE TABLE `suppliers` (
  `sup_id` int(11) NOT NULL,
  `sup_name` varchar(30) NOT NULL,
  `sup_city` varchar(50) NOT NULL,
  `sup_country` varchar(50) NOT NULL,
  `sup_address` varchar(50) NOT NULL,
  `sup_zipcode` int(11) NOT NULL,
  `sup_contact` varchar(50) NOT NULL,
  `sup_phone` int(11) NOT NULL,
  `sup_mail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `suppliers`
--

INSERT INTO `suppliers` (`sup_id`, `sup_name`, `sup_city`, `sup_country`, `sup_address`, `sup_zipcode`, `sup_contact`, `sup_phone`, `sup_mail`) VALUES
(1, 'BMC', 'Geneve', 'Swiss', '11 rue de la licorne', 1201, 'Bob Bigelow', 12345678, 'bob-bigletow@bmc.com'),
(2, 'CUBE', 'Munich', 'Allemagne', '19 boulevard de la biere', 6531, 'Marcus Purner', 12345678, 'marcus-purner@cube.com'),
(3, 'GIANT', 'Taipei', 'Taiwan', '20 avenue du sushi ', 7954, 'Chin-Piao Liu', 12345678, 'king-liu@giant.com'),
(4, 'KTM', 'Berlin', 'Allemagne', '36 rue de la soif', 9895, 'Ernst Kronreif', 12345678, 'ernst-kronreif@ktm.com'),
(5, 'SCOTT', 'Miami', 'Etat-Unis', '84 avenue springbreak', 6562, 'Ed Scott', 987654321, 'ed-scott@scott.com');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `cat_name` (`cat_name`);

--
-- Index pour la table `contain`
--
ALTER TABLE `contain`
  ADD PRIMARY KEY (`pro_id`,`ord_id`),
  ADD KEY `pro_id` (`pro_id`),
  ADD KEY `ord_id` (`ord_id`);

--
-- Index pour la table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cus_id`),
  ADD UNIQUE KEY `cus_login` (`cus_login`),
  ADD UNIQUE KEY `cus_email` (`cus_email`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ord_id`),
  ADD KEY `cus_id` (`cus_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pro_id`),
  ADD UNIQUE KEY `pro_name` (`pro_name`),
  ADD UNIQUE KEY `pro_reference` (`pro_reference`),
  ADD KEY `sup_id` (`sup_id`),
  ADD KEY `sub_id` (`sub_id`);

--
-- Index pour la table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`sub_id`),
  ADD UNIQUE KEY `sub_name` (`sub_name`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Index pour la table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`sup_id`),
  ADD UNIQUE KEY `sup_name` (`sup_name`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `customers`
--
ALTER TABLE `customers`
  MODIFY `cus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `ord_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `sub_id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `sup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `contain`
--
ALTER TABLE `contain`
  ADD CONSTRAINT `contain_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `products` (`pro_id`),
  ADD CONSTRAINT `contain_ibfk_2` FOREIGN KEY (`ord_id`) REFERENCES `orders` (`ord_id`);

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customers` (`cus_id`);

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`sup_id`) REFERENCES `suppliers` (`sup_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `subcategories` (`sub_id`);

--
-- Contraintes pour la table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
