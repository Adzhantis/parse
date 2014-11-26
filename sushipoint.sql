-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 17 2014 г., 18:16
-- Версия сервера: 5.5.38-log
-- Версия PHP: 5.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `sushipoint`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bonuses`
--

CREATE TABLE IF NOT EXISTS `bonuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) NOT NULL,
  `name_sys` varchar(255) NOT NULL,
  `name_ru` varchar(255) NOT NULL,
  `name_ua` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `work_minutes` int(11) NOT NULL,
  `price_discount` int(11) NOT NULL,
  `discount_work_after` int(11) NOT NULL,
  `free_delivery` int(11) NOT NULL,
  `discount_percent` int(11) NOT NULL,
  `bonus_money` int(11) NOT NULL,
  `time_end` int(11) NOT NULL,
  `allow_by_promo_code` int(11) NOT NULL,
  `allow_by_admin` int(11) NOT NULL,
  `allow_by_client` int(11) NOT NULL,
  `allow_by_client_with_confirm` int(11) NOT NULL,
  `allow_to_all` int(11) NOT NULL,
  `allow_to_registered` int(11) NOT NULL,
  `accessible_once` int(11) NOT NULL,
  `allow_to_device_1` int(11) NOT NULL,
  `allow_to_device_2` int(11) NOT NULL,
  `allow_to_device_3` int(11) NOT NULL,
  `accessible_period` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bonuses_images`
--

CREATE TABLE IF NOT EXISTS `bonuses_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bonus_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bonuses_images_types`
--

CREATE TABLE IF NOT EXISTS `bonuses_images_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_ru` varchar(255) NOT NULL,
  `name_sys` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usre_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `id_master` int(10) unsigned DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL,
  `name` varchar(40) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_priority` int(10) unsigned DEFAULT NULL,
  `hidden` int(11) NOT NULL,
  `name_ru` varchar(255) NOT NULL,
  `name_ua` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_master` (`id_master`),
  KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `categories_group`
--

CREATE TABLE IF NOT EXISTS `categories_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `categories_group`
--

INSERT INTO `categories_group` (`id`, `name`) VALUES
(1, 'Японская кухня');

-- --------------------------------------------------------

--
-- Структура таблицы `categories_menu`
--

CREATE TABLE IF NOT EXISTS `categories_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `name_ru` varchar(255) NOT NULL,
  `name_ua` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `city_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `important` tinyint(1) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `title_ru` varchar(150) DEFAULT NULL,
  `area_ru` varchar(150) DEFAULT NULL,
  `region_ru` varchar(150) DEFAULT NULL,
  `title_ua` varchar(150) DEFAULT NULL,
  `area_ua` varchar(150) DEFAULT NULL,
  `region_ua` varchar(150) DEFAULT NULL,
  `title_be` varchar(150) DEFAULT NULL,
  `area_be` varchar(150) DEFAULT NULL,
  `region_be` varchar(150) DEFAULT NULL,
  `title_en` varchar(150) DEFAULT NULL,
  `area_en` varchar(150) DEFAULT NULL,
  `region_en` varchar(150) DEFAULT NULL,
  `title_es` varchar(150) DEFAULT NULL,
  `area_es` varchar(150) DEFAULT NULL,
  `region_es` varchar(150) DEFAULT NULL,
  `title_pt` varchar(150) DEFAULT NULL,
  `area_pt` varchar(150) DEFAULT NULL,
  `region_pt` varchar(150) DEFAULT NULL,
  `title_de` varchar(150) DEFAULT NULL,
  `area_de` varchar(150) DEFAULT NULL,
  `region_de` varchar(150) DEFAULT NULL,
  `title_fr` varchar(150) DEFAULT NULL,
  `area_fr` varchar(150) DEFAULT NULL,
  `region_fr` varchar(150) DEFAULT NULL,
  `title_it` varchar(150) DEFAULT NULL,
  `area_it` varchar(150) DEFAULT NULL,
  `region_it` varchar(150) DEFAULT NULL,
  `title_pl` varchar(150) DEFAULT NULL,
  `area_pl` varchar(150) DEFAULT NULL,
  `region_pl` varchar(150) DEFAULT NULL,
  `title_ja` varchar(150) DEFAULT NULL,
  `area_ja` varchar(150) DEFAULT NULL,
  `region_ja` varchar(150) DEFAULT NULL,
  `title_lt` varchar(150) DEFAULT NULL,
  `area_lt` varchar(150) DEFAULT NULL,
  `region_lt` varchar(150) DEFAULT NULL,
  `title_lv` varchar(150) DEFAULT NULL,
  `area_lv` varchar(150) DEFAULT NULL,
  `region_lv` varchar(150) DEFAULT NULL,
  `title_cz` varchar(150) DEFAULT NULL,
  `area_cz` varchar(150) DEFAULT NULL,
  `region_cz` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cities`
--

-- --------------------------------------------------------

--
-- Структура таблицы `discounts`
--

CREATE TABLE IF NOT EXISTS `discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IDREC` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TOWN` varchar(255) NOT NULL,
  `STREET` varchar(255) NOT NULL,
  `REGION` varchar(255) NOT NULL,
  `HOUSE` varchar(255) NOT NULL,
  `PORCH` int(11) NOT NULL,
  `FLOOR` int(11) NOT NULL,
  `ROOM` varchar(255) NOT NULL,
  `TEL` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `CARDCODE` text NOT NULL,
  `QRCODE` varchar(255) NOT NULL,
  `AUTOSKID` int(11) NOT NULL,
  `BONUSCARD` int(11) NOT NULL,
  `DISCOUNTCARD` int(1) NOT NULL,
  `SKIDKA` int(11) NOT NULL,
  `DELETED` int(11) NOT NULL,
  `BONUS` int(11) NOT NULL,
  `BONUSPLUS` varchar(255) NOT NULL,
  `BIRTHDAY` varchar(255) NOT NULL,
  `REMARK` text NOT NULL,
  `CHANGED` int(11) NOT NULL,
  `TOTAL` varchar(255) NOT NULL,
  `COLBONUS` int(11) NOT NULL,
  `IDCARD` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `CARDID` varchar(255) NOT NULL,
  UNIQUE KEY `IDREC_2` (`id`),
  KEY `IDREC` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `discounts_total`
--

CREATE TABLE IF NOT EXISTS `discounts_total` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaraunt_id` int(11) NOT NULL,
  `CARDID` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `extra_items`
--

CREATE TABLE IF NOT EXISTS `extra_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `price` int(11) NOT NULL,
  `volume` int(11) NOT NULL,
  `id_volume_unit` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_volume_unit` (`id_volume_unit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `favourites`
--

CREATE TABLE IF NOT EXISTS `favourites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`,`device_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Дамп данных таблицы `favourites`
--

INSERT INTO `favourites` (`id`, `item_id`, `device_id`, `date`, `user_id`) VALUES
(11, 64, 8, '2014-11-14 12:09:46', 8),
(6, 20, 8, '2014-11-14 09:22:16', 8),
(10, 65, 8, '2014-11-14 11:33:09', 8),
(18, 101, 8, '2014-11-15 04:48:12', 8);

-- --------------------------------------------------------

--
-- Структура таблицы `feedback_types`
--

CREATE TABLE IF NOT EXISTS `feedback_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text_code` text,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `feedback_types`
--

INSERT INTO `feedback_types` (`id`, `text_code`, `name`) VALUES
(1, NULL, 'Жалоба'),
(2, NULL, 'Предложение');

-- --------------------------------------------------------

--
-- Структура таблицы `filters`
--

CREATE TABLE IF NOT EXISTS `filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `filters_to_items`
--

CREATE TABLE IF NOT EXISTS `filters_to_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_filter` int(10) unsigned NOT NULL,
  `id_item` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_filter` (`id_filter`,`id_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `folder_types`
--

CREATE TABLE IF NOT EXISTS `folder_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ingredients`
--

CREATE TABLE IF NOT EXISTS `ingredients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `eizm` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL,
  `sklad` text NOT NULL,
  `proc1` varchar(255) NOT NULL,
  `proc2` varchar(255) NOT NULL,
  `proc3` varchar(255) NOT NULL,
  `proc4` varchar(255) NOT NULL,
  `proc5` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `norm` varchar(255) NOT NULL,
  `reg_price` varchar(255) NOT NULL,
  `creator` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ip_history`
--

CREATE TABLE IF NOT EXISTS `ip_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `city_name` text,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `longitude` int(11) DEFAULT NULL,
  `latitude` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `ip_history`
--

INSERT INTO `ip_history` (`id`, `device_id`, `ip`, `city_name`, `date`, `longitude`, `latitude`, `user_id`) VALUES
(1, 8, '37.73.243.171', NULL, '2014-11-13 13:11:22', NULL, NULL, 8),
(2, 8, '37.73.236.33', NULL, '2014-11-13 13:25:19', NULL, NULL, 8),
(3, 8, '134.249.138.73', NULL, '2014-11-13 13:31:19', NULL, NULL, 8),
(4, 8, '37.73.210.3', NULL, '2014-11-14 13:13:28', NULL, NULL, 8),
(5, 8, '37.73.255.243', NULL, '2014-11-14 17:20:17', NULL, NULL, 8),
(6, 8, '37.73.216.127', NULL, '2014-11-15 04:45:28', NULL, NULL, 8),
(7, 8, '134.249.138.73', NULL, '2014-11-17 09:44:41', NULL, NULL, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `weight` int(11) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `new` int(11) NOT NULL,
  `id_volume_unit` int(10) unsigned NOT NULL,
  `description` text,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cex` varchar(255) NOT NULL,
  `groupname` varchar(255) NOT NULL,
  `can_sell` int(11) NOT NULL,
  `work_discount` int(11) NOT NULL,
  `semiproduct` int(11) NOT NULL,
  `has_bonus` int(11) NOT NULL,
  `menu` varchar(255) NOT NULL,
  `service` int(11) NOT NULL,
  `ration` varchar(255) NOT NULL,
  `losses` varchar(255) NOT NULL,
  `technology` text NOT NULL,
  `data_create` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `outcomm` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `name_ru` varchar(255) NOT NULL,
  `name_ua` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `description_ru` varchar(255) NOT NULL,
  `description_ua` varchar(255) NOT NULL,
  `description_en` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `additional_item` int(11) NOT NULL,
  `hit` int(11) NOT NULL,
  `id_currency` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_menu` (`category_id`),
  KEY `price` (`price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `items_backup`
--

CREATE TABLE IF NOT EXISTS `items_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `weight` int(11) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `new` int(11) NOT NULL,
  `id_volume_unit` int(10) unsigned NOT NULL,
  `description` text,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cex` varchar(255) NOT NULL,
  `groupname` varchar(255) NOT NULL,
  `can_sell` int(11) NOT NULL,
  `work_discount` int(11) NOT NULL,
  `semiproduct` int(11) NOT NULL,
  `has_bonus` int(11) NOT NULL,
  `menu` varchar(255) NOT NULL,
  `service` int(11) NOT NULL,
  `ration` varchar(255) NOT NULL,
  `losses` varchar(255) NOT NULL,
  `technology` text NOT NULL,
  `data_create` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `outcomm` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_menu` (`category_id`),
  KEY `price` (`price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `menu_data`
--

CREATE TABLE IF NOT EXISTS `menu_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codeproduct` int(11) NOT NULL,
  `codeingredient` int(11) NOT NULL,
  `prod` int(11) NOT NULL,
  `brutto` varchar(255) NOT NULL,
  `netto` varchar(255) NOT NULL,
  `gves` varchar(255) NOT NULL,
  `proc1` varchar(255) NOT NULL,
  `proc2` varchar(255) NOT NULL,
  `proc3` varchar(255) NOT NULL,
  `proc4` varchar(255) NOT NULL,
  `proc5` varchar(255) NOT NULL,
  `check1` varchar(255) NOT NULL,
  `check2` varchar(255) NOT NULL,
  `check3` varchar(255) NOT NULL,
  `check4` varchar(255) NOT NULL,
  `check5` varchar(255) NOT NULL,
  `massa` varchar(255) NOT NULL,
  `creator` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_type_code` int(11) NOT NULL,
  `cutlery_type_code` int(11) NOT NULL,
  `normal_sticks` int(11) NOT NULL,
  `educational_sticks` int(11) NOT NULL,
  `european_devices` int(11) NOT NULL,
  `persons` int(11) NOT NULL,
  `first_name` text NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `device_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `change` int(11) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `street` text NOT NULL,
  `house` text NOT NULL,
  `porch` text NOT NULL,
  `floor` text NOT NULL,
  `flat` text NOT NULL,
  `phone` text NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_code` int(11) NOT NULL,
  `folder_type_code` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `self_delivery_place_id` int(11) NOT NULL,
  `sended` int(11) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `personal_processed_id` int(11) NOT NULL,
  `personal_delivers_id` int(11) NOT NULL,
  `list_id` int(11) NOT NULL,
  `delivery_cost` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `delivery_date` varchar(255) NOT NULL,
  `start_processing_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `price_discount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status_code` (`status_code`),
  KEY `delivery_type_code` (`delivery_type_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `delivery_type_code`, `cutlery_type_code`, `normal_sticks`, `educational_sticks`, `european_devices`, `persons`, `first_name`, `last_name`, `device_id`, `price`, `change`, `city_id`, `street`, `house`, `porch`, `floor`, `flat`, `phone`, `comment`, `date`, `status_code`, `folder_type_code`, `place_id`, `self_delivery_place_id`, `sended`, `latitude`, `longitude`, `personal_processed_id`, `personal_delivers_id`, `list_id`, `delivery_cost`, `user_id`, `delivery_date`, `start_processing_time`, `price_discount`) VALUES
(1, 0, 0, 0, 0, 0, 0, '', '', 6, 550, NULL, 650, '', '', '', '', '', '3334342342', '', '2014-11-11 12:54:29', 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 6, '', '0000-00-00 00:00:00', 0),
(2, 0, 0, 0, 0, 0, 0, 'пприи', '', 8, 144, NULL, 650, '', '', '', '', '', '5588888888', '', '2014-11-14 08:46:20', 0, 0, 0, 0, 0, '', '', 0, 0, 0, 30, 8, '', '0000-00-00 00:00:00', 0),
(3, 0, 0, 0, 0, 0, 0, 'рпомрра', '', 8, 105, NULL, 650, '', '', '', '', '', '5585858585', '', '2014-11-14 11:07:27', 0, 0, 0, 0, 0, '', '', 0, 0, 0, 30, 8, '', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `orders_history`
--

CREATE TABLE IF NOT EXISTS `orders_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `personal_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `result_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `orders_history_results`
--

CREATE TABLE IF NOT EXISTS `orders_history_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `orders_history_results`
--

INSERT INTO `orders_history_results` (`id`, `text`, `type_id`) VALUES
(1, 'Недозвон', 1),
(2, 'Бросил трубку', 1),
(3, 'Успешно', 1),
(4, 'Перенос на время', 1),
(5, 'Отмена заказа', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders_history_types`
--

CREATE TABLE IF NOT EXISTS `orders_history_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `orders_history_types`
--

INSERT INTO `orders_history_types` (`id`, `text`) VALUES
(1, 'Звонок');

-- --------------------------------------------------------

--
-- Структура таблицы `orders_list`
--

CREATE TABLE IF NOT EXISTS `orders_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `time_end` int(11) NOT NULL,
  `courier_id` int(11) NOT NULL,
  `orders_ids` text NOT NULL,
  `courier_name` varchar(255) NOT NULL,
  `place_start_id` int(11) NOT NULL,
  `place_end_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `orders_products`
--

CREATE TABLE IF NOT EXISTS `orders_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `extra_item` tinyint(1) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_item` (`products_id`),
  KEY `id_cart` (`orders_id`),
  KEY `extra_item` (`extra_item`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `orders_products`
--

INSERT INTO `orders_products` (`id`, `orders_id`, `products_id`, `extra_item`, `quantity`) VALUES
(1, 1, 76, 0, 5),
(2, 2, 61, 0, 3),
(3, 3, 63, 0, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `parameters`
--

CREATE TABLE IF NOT EXISTS `parameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text_code` text,
  `name` text NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `description` text,
  `name_ru` varchar(255) NOT NULL,
  `name_ua` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_id` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `parameters_to_items`
--

CREATE TABLE IF NOT EXISTS `parameters_to_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `parameter_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`,`parameter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user_from` int(11) NOT NULL,
  `id_user_to` int(11) NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `payment_status_id` int(11) NOT NULL,
  `sum` decimal(15,2) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_user_from` (`id_user_from`,`id_user_to`,`payment_type_id`,`payment_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `payment_statuses`
--

CREATE TABLE IF NOT EXISTS `payment_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` text NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`(15))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `payment_types`
--

CREATE TABLE IF NOT EXISTS `payment_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` text NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`(15))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `personal`
--

CREATE TABLE IF NOT EXISTS `personal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type_id` int(11) NOT NULL,
  `can_drive` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `personal`
--

INSERT INTO `personal` (`id`, `first_name`, `last_name`, `login`, `password`, `type_id`, `can_drive`, `status_id`, `place_id`, `latitude`, `longitude`, `phone`) VALUES
(1, 'Василий', 'Петров', 'vasia', '123456', 1, 0, 2, 1, '', '', ''),
(2, 'Евгений', 'Каленников', 'zhenia', '123456', 2, 1, 2, 6, '', '', ''),
(3, 'Анна', 'Петровна', 'dispetcher1', '123456', 3, 0, 0, 0, '', '', ''),
(4, 'Александр', 'Александр', 'admin', 'admin12345', 0, 0, 0, 0, '', '', ''),
(5, 'Андрей', 'Евгенов', '', '', 2, 1, 2, 1, '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `personal_statuses`
--

CREATE TABLE IF NOT EXISTS `personal_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `personal_statuses`
--

INSERT INTO `personal_statuses` (`id`, `status_name`) VALUES
(1, 'Оффлайн'),
(2, 'Свободен'),
(3, 'Занят'),
(4, 'Доставляет');

-- --------------------------------------------------------

--
-- Структура таблицы `personal_types`
--

CREATE TABLE IF NOT EXISTS `personal_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `personal_types`
--

INSERT INTO `personal_types` (`id`, `type_name`) VALUES
(1, 'Курьер'),
(2, 'Водитель'),
(3, 'Диспетчер');

-- --------------------------------------------------------

--
-- Структура таблицы `places`
--

CREATE TABLE IF NOT EXISTS `places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `delivers` int(11) NOT NULL,
  `last_action_time` varchar(255) NOT NULL,
  `name_ru` varchar(255) NOT NULL,
  `name_ua` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `places`
--

INSERT INTO `places` (`id`, `country_id`, `city_id`, `name`, `login`, `password`, `token`, `delivers`, `last_action_time`, `name_ru`, `name_ua`, `name_en`) VALUES
(1, 1, 314, 'Ресторан', 'rest', 'gfdgdfgs2', '70138e19b07ec3e9a2d60fc487172412', 1, '1414592602', 'Ресторан', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `places_activity`
--

CREATE TABLE IF NOT EXISTS `places_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `places_categories_group`
--

CREATE TABLE IF NOT EXISTS `places_categories_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `places_categories_group`
--

INSERT INTO `places_categories_group` (`id`, `place_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `places_place`
--

CREATE TABLE IF NOT EXISTS `places_place` (
  `place_id` int(11) NOT NULL,
  `street` varchar(255) NOT NULL,
  `house` varchar(255) NOT NULL,
  `floor` int(11) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  PRIMARY KEY (`place_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `places_place`
--

INSERT INTO `places_place` (`place_id`, `street`, `house`, `floor`, `latitude`, `longitude`) VALUES
(1, 'Ленина', '20', 1, '55.74605252374095', '37.62920379638672');

-- --------------------------------------------------------

--
-- Структура таблицы `promo_codes`
--

CREATE TABLE IF NOT EXISTS `promo_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(111) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bonus_id` int(11) NOT NULL,
  `time_end` int(11) NOT NULL,
  `used` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `promo_codes_pack`
--

CREATE TABLE IF NOT EXISTS `promo_codes_pack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) NOT NULL,
  `time_create` int(11) NOT NULL,
  `time_end` int(11) NOT NULL,
  `code_start_id` int(11) NOT NULL,
  `code_count` int(11) NOT NULL,
  `bonus_id` int(11) NOT NULL,
  `distribution_method_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `user_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `regions`
--

CREATE TABLE IF NOT EXISTS `regions` (
  `region_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `title_ru` varchar(150) DEFAULT NULL,
  `title_ua` varchar(150) DEFAULT NULL,
  `title_be` varchar(150) DEFAULT NULL,
  `title_en` varchar(150) DEFAULT NULL,
  `title_es` varchar(150) DEFAULT NULL,
  `title_pt` varchar(150) DEFAULT NULL,
  `title_de` varchar(150) DEFAULT NULL,
  `title_fr` varchar(150) DEFAULT NULL,
  `title_it` varchar(150) DEFAULT NULL,
  `title_pl` varchar(150) DEFAULT NULL,
  `title_ja` varchar(150) DEFAULT NULL,
  `title_lt` varchar(150) DEFAULT NULL,
  `title_lv` varchar(150) DEFAULT NULL,
  `title_cz` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `server_files`
--

CREATE TABLE IF NOT EXISTS `server_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_fullpath` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `content` longblob NOT NULL,
  `displayed` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `users_date_start` timestamp NULL DEFAULT NULL,
  `date_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `seconds` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_id_AND_users_date_start` (`device_id`,`users_date_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sms_phones`
--

CREATE TABLE IF NOT EXISTS `sms_phones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `phone` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `statistic`
--

CREATE TABLE IF NOT EXISTS `statistic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `extra` text,
  `entity_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`,`action_id`),
  KEY `entity_id` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `statistic_actions`
--

CREATE TABLE IF NOT EXISTS `statistic_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text_code` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `short_description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `text_code` (`text_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `statistic_actions`
--

INSERT INTO `statistic_actions` (`id`, `text_code`, `description`, `short_description`) VALUES
(1, 'index', 'Просмотр меню', 'меню'),
(2, 'cart_plus', 'Добавление товара в корзину', '+ в корзину'),
(3, 'cart_minus', 'Удаления товара из корзины', '- из корзины'),
(4, 'cart_remove', 'Удаление товара из корзины', '');

-- --------------------------------------------------------

--
-- Структура таблицы `status_codes`
--

CREATE TABLE IF NOT EXISTS `status_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `name` text NOT NULL,
  `deliver_name` varchar(255) NOT NULL,
  `points` int(11) NOT NULL,
  `second_points` int(11) NOT NULL,
  `name_ru` varchar(255) NOT NULL,
  `name_ua` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `status_codes`
--

INSERT INTO `status_codes` (`id`, `code`, `name`, `deliver_name`, `points`, `second_points`, `name_ru`, `name_ua`, `name_en`) VALUES
(1, 0, 'Не просмотрен', '', 0, 0, 'Не просмотрен', '', ''),
(2, 1, 'Прозвон', '', 1, 0, 'Прозвон', '', ''),
(3, 2, 'Отказ', '', 0, 0, 'Отказ', '', ''),
(4, 3, 'Принят точкой', 'принят', 2, 2, 'Принят точкой', '', ''),
(5, 4, 'Отправлено на точку', 'не принят', 2, 1, 'Отправлено на точку', '', ''),
(6, 5, 'Готовим', 'готовится', 3, 3, 'Готовим', '', ''),
(7, 6, 'Доставляем', '', 5, 4, 'Доставляем', '', ''),
(8, 7, 'Отказ при доставке', '', 0, 0, 'Отказ при доставке', '', ''),
(9, 8, 'Доставлен', '', 6, 4, 'Доставлен', '', ''),
(10, 9, 'Приготовлен', 'приготовлен', 4, 4, 'Приготовлен', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `sync`
--

CREATE TABLE IF NOT EXISTS `sync` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place_id` int(11) NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `table_id` int(11) NOT NULL,
  `done` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_migration`
--

CREATE TABLE IF NOT EXISTS `tbl_migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `units`
--

CREATE TABLE IF NOT EXISTS `units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `units`
--

INSERT INTO `units` (`id`, `name`) VALUES
(1, 'г'),
(2, 'мл');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password_hash` text NOT NULL,
  `status` int(11) NOT NULL,
  `auth_key` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_email` varchar(255) NOT NULL,
  `last_phone` varchar(255) NOT NULL,
  `last_adress` varchar(255) NOT NULL,
  `first_name_en` varchar(255) NOT NULL,
  `last_latitude` varchar(255) NOT NULL,
  `last_longitude` varchar(255) NOT NULL,
  `last_adress_region` varchar(255) NOT NULL,
  `system_comment` varchar(255) NOT NULL,
  `last_second_phone` varchar(255) NOT NULL,
  `old_orders` int(11) NOT NULL,
  `last_ip` varchar(255) NOT NULL,
  `last_order_date` varchar(255) NOT NULL,
  `last_online_time` varchar(255) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `trust_rate` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` text NOT NULL,
  `phone` varchar(30) NOT NULL,
  `sms_code` varchar(6) NOT NULL,
  `registered` tinyint(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `city_id` int(11) NOT NULL,
  `new_password` text NOT NULL,
  `users_category_id` int(11) NOT NULL,
  `orders_count` int(11) NOT NULL,
  `sessions_count` int(11) NOT NULL,
  `orders_canceled_count` int(11) NOT NULL,
  `http_refferer` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `nickname` text NOT NULL,
  `main_bill` decimal(15,2) NOT NULL,
  `bonus_bill` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_email`, `last_phone`, `last_adress`, `first_name_en`, `last_latitude`, `last_longitude`, `last_adress_region`, `system_comment`, `last_second_phone`, `old_orders`, `last_ip`, `last_order_date`, `last_online_time`, `partner_id`, `trust_rate`, `login`, `password`, `email`, `phone`, `sms_code`, `registered`, `date`, `city_id`, `new_password`, `users_category_id`, `orders_count`, `sessions_count`, `orders_canceled_count`, `http_refferer`, `group_id`, `parent_id`, `nickname`, `main_bill`, `bonus_bill`) VALUES
(1, '', '', '', '', '', '', '', '', '', '', 0, '134.249.138.73', '', '1414596111', 0, 0, '', '', '', '', '', 0, '2014-10-29 15:21:51', 0, '', 0, 0, 1, 0, '', 0, 0, '', '0.00', '0.00'),
(2, '', '', '', '', '', '', '', '', '', '', 0, '134.249.138.73', '', '1414596868', 0, 0, '', '', '', '', '', 0, '2014-10-29 15:34:28', 0, '', 0, 0, 1, 0, '', 0, 0, '', '0.00', '0.00'),
(3, '', '', '', '', '', '', '', '', '', '', 0, '134.249.138.73', '', '1414597615', 0, 0, '', '', '', '', '', 0, '2014-10-29 15:46:55', 0, '', 0, 0, 1, 0, '', 0, 0, '', '0.00', '0.00'),
(4, '', '', '', '', '', '', '', '', '', '', 0, '134.249.138.73', '', '1414605782', 0, 0, '', '', '', '', '', 0, '2014-10-29 18:03:02', 0, '', 0, 0, 1, 0, '', 0, 0, '', '0.00', '0.00'),
(5, '', '', '', '', '', '', '', '', '', '', 0, '134.249.138.73', '', '1415104613', 0, 0, '', '', '', '', '', 0, '2014-11-04 12:36:53', 0, '', 0, 0, 0, 0, '', 0, 0, '', '0.00', '0.00'),
(6, '', '', '3334342342', '  ', '', '', '', '', '', '', 0, '134.249.138.73', '', '1415711915', 0, 0, '', '', '', '', '', 0, '2014-11-11 13:18:35', 0, '', 0, 1, 49, 0, '', 0, 0, '', '0.00', '0.00'),
(7, '', '', '', '', '', '', '', '', '', '', 0, '134.249.138.73', '', '1415714335', 0, 0, '', '', '', '', '', 0, '2014-11-11 13:58:55', 0, '', 0, 0, 1, 0, '', 0, 0, '', '0.00', '0.00'),
(8, '', '', '5585858585', '  ', '', '', '', '', '', '', 0, '134.249.138.73', '', '1416230658', 0, 0, '', '', '', '', '', 0, '2014-11-17 13:24:18', 0, '', 0, 2, 0, 0, '', 0, 0, '', '0.00', '0.00'),
(9, '', '', '', '', '', '', '', '', '', '', 0, '134.249.138.73', '', '1415715213', 0, 0, '', '', '', '', '', 0, '2014-11-11 14:13:33', 0, '', 0, 0, 1, 0, '', 0, 0, '', '0.00', '0.00'),
(10, '', '', '', '', '', '', '', '', '', '', 0, '134.249.138.73', '', '1415881230', 0, 0, '', '', '', '', '', 0, '2014-11-13 12:20:30', 0, '', 0, 0, 1, 0, '', 0, 0, '', '0.00', '0.00'),
(11, '', '', '', '', '', '', '', '', '', '', 0, '134.249.138.73', '', '1415887421', 0, 0, '', '', '', '', '', 0, '2014-11-13 14:03:41', 0, '', 0, 0, 4, 0, '', 0, 0, '', '0.00', '0.00'),
(12, '', '', '', '', '', '', '', '', '', '', 0, '134.249.138.73', '', '1416218191', 0, 0, '', '', '', '', '', 0, '2014-11-17 09:56:31', 0, '', 0, 0, 85, 0, '', 0, 0, '', '0.00', '0.00'),
(13, '', '', '', '', '', '', '', '', '', '', 0, '134.249.138.73', '', '1415967229', 0, 0, '', '', '', '', '', 0, '2014-11-14 12:13:49', 0, '', 0, 0, 0, 0, '', 0, 0, '', '0.00', '0.00'),
(14, '', '', '', '', '', '', '', '', '', '', 0, '134.249.138.73', '', '1416220458', 0, 0, '', '', '', '', '', 0, '2014-11-17 10:34:18', 0, '', 0, 0, 1, 0, '', 0, 0, '', '0.00', '0.00'),
(15, '', '', '', '', '', '', '', '', '', '', 0, '134.249.138.73', '', '1416223068', 0, 0, '', '', '', '', '', 0, '2014-11-17 11:17:48', 0, '', 0, 0, 23, 0, '', 0, 0, '', '0.00', '0.00'),
(16, '', '', '', '', '', '', '', '', '', '', 0, '134.249.138.73', '', '1416223593', 0, 0, '', '', '', '', '', 0, '2014-11-17 11:26:33', 0, '', 0, 0, 2, 0, '', 0, 0, '', '0.00', '0.00'),
(17, '', '', '', '', '', '', '', '', '', '', 0, '134.249.138.73', '', '1416232556', 0, 0, '', '', '', '', '', 0, '2014-11-17 13:55:56', 0, '', 0, 0, 5, 0, '', 0, 0, '', '0.00', '0.00'),
(18, '', '', '', '', '', '', '', '', '', '', 0, '134.249.138.73', '', '1416232388', 0, 0, '', '', '', '', '', 0, '2014-11-17 13:53:08', 0, '', 0, 0, 0, 0, '', 0, 0, '', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Структура таблицы `users_action_history`
--

CREATE TABLE IF NOT EXISTS `users_action_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `user_ip` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `users_bonuses`
--

CREATE TABLE IF NOT EXISTS `users_bonuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `time_start` int(11) NOT NULL,
  `bonus_id` int(11) NOT NULL,
  `promo_code_id` int(11) NOT NULL,
  `time_end` int(11) NOT NULL,
  `time_of_use` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `users_categories`
--

CREATE TABLE IF NOT EXISTS `users_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text_code` text NOT NULL,
  `name` text NOT NULL,
  `blocked_controllers` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `users_groups`
--

CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `users_partners`
--

CREATE TABLE IF NOT EXISTS `users_partners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `YiiLog`
--

CREATE TABLE IF NOT EXISTS `YiiLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(128) DEFAULT NULL,
  `category` varchar(128) DEFAULT NULL,
  `logtime` int(11) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
