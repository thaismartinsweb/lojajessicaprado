-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: loja
-- Source Schemata: loja
-- Created: Sat Jan 31 22:24:03 2015
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;;

-- ----------------------------------------------------------------------------
-- Schema loja
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `loja` ;
CREATE SCHEMA IF NOT EXISTS `loja` ;

-- ----------------------------------------------------------------------------
-- Table loja.oc_address
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_address` (
  `address_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_id` INT(11) NOT NULL,
  `firstname` VARCHAR(32) NOT NULL,
  `lastname` VARCHAR(32) NOT NULL,
  `company` VARCHAR(40) NOT NULL,
  `address` VARCHAR(128) NOT NULL,
  `number` VARCHAR(45) NULL DEFAULT NULL,
  `complement` VARCHAR(45) NULL DEFAULT NULL,
  `neighborhood` VARCHAR(128) NOT NULL,
  `city` VARCHAR(128) NOT NULL,
  `postcode` VARCHAR(10) NOT NULL,
  `country_id` INT(11) NOT NULL DEFAULT '0',
  `zone_id` INT(11) NOT NULL DEFAULT '0',
  `custom_field` TEXT NOT NULL,
  PRIMARY KEY (`address_id`),
  INDEX `customer_id` (`customer_id` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_affiliate
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_affiliate` (
  `affiliate_id` INT(11) NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(32) NOT NULL,
  `lastname` VARCHAR(32) NOT NULL,
  `email` VARCHAR(96) NOT NULL,
  `telephone` VARCHAR(32) NOT NULL,
  `fax` VARCHAR(32) NOT NULL,
  `password` VARCHAR(40) NOT NULL,
  `salt` VARCHAR(9) NOT NULL,
  `company` VARCHAR(40) NOT NULL,
  `website` VARCHAR(255) NOT NULL,
  `address_1` VARCHAR(128) NOT NULL,
  `address_2` VARCHAR(128) NOT NULL,
  `city` VARCHAR(128) NOT NULL,
  `postcode` VARCHAR(10) NOT NULL,
  `country_id` INT(11) NOT NULL,
  `zone_id` INT(11) NOT NULL,
  `code` VARCHAR(64) NOT NULL,
  `commission` DECIMAL(4,2) NOT NULL DEFAULT '0.00',
  `tax` VARCHAR(64) NOT NULL,
  `payment` VARCHAR(6) NOT NULL,
  `cheque` VARCHAR(100) NOT NULL,
  `paypal` VARCHAR(64) NOT NULL,
  `bank_name` VARCHAR(64) NOT NULL,
  `bank_branch_number` VARCHAR(64) NOT NULL,
  `bank_swift_code` VARCHAR(64) NOT NULL,
  `bank_account_name` VARCHAR(64) NOT NULL,
  `bank_account_number` VARCHAR(64) NOT NULL,
  `ip` VARCHAR(40) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  `approved` TINYINT(1) NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`affiliate_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_affiliate_activity
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_affiliate_activity` (
  `activity_id` INT(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` INT(11) NOT NULL,
  `key` VARCHAR(64) NOT NULL,
  `data` TEXT NOT NULL,
  `ip` VARCHAR(40) NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`activity_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_affiliate_login
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_affiliate_login` (
  `affiliate_login_id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(96) NOT NULL,
  `ip` VARCHAR(40) NOT NULL,
  `total` INT(4) NOT NULL,
  `date_added` DATETIME NOT NULL,
  `date_modified` DATETIME NOT NULL,
  PRIMARY KEY (`affiliate_login_id`),
  INDEX `email` (`email` ASC),
  INDEX `ip` (`ip` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_affiliate_transaction
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_affiliate_transaction` (
  `affiliate_transaction_id` INT(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` INT(11) NOT NULL,
  `order_id` INT(11) NOT NULL,
  `description` TEXT NOT NULL,
  `amount` DECIMAL(15,4) NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_api
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_api` (
  `api_id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(64) NOT NULL,
  `firstname` VARCHAR(64) NOT NULL,
  `lastname` VARCHAR(64) NOT NULL,
  `password` TEXT NOT NULL,
  `status` TINYINT(1) NOT NULL,
  `date_added` DATETIME NOT NULL,
  `date_modified` DATETIME NOT NULL,
  PRIMARY KEY (`api_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_attribute
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_attribute` (
  `attribute_id` INT(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` INT(11) NOT NULL,
  `sort_order` INT(3) NOT NULL,
  PRIMARY KEY (`attribute_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_attribute_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_attribute_description` (
  `attribute_id` INT(11) NOT NULL,
  `language_id` INT(11) NOT NULL,
  `name` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`attribute_id`, `language_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_attribute_group
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_attribute_group` (
  `attribute_group_id` INT(11) NOT NULL AUTO_INCREMENT,
  `sort_order` INT(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_attribute_group_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_attribute_group_description` (
  `attribute_group_id` INT(11) NOT NULL,
  `language_id` INT(11) NOT NULL,
  `name` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`, `language_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_banner
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_banner` (
  `banner_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`banner_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_banner_image
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_banner_image` (
  `banner_image_id` INT(11) NOT NULL AUTO_INCREMENT,
  `banner_id` INT(11) NOT NULL,
  `link` VARCHAR(255) NOT NULL,
  `image` VARCHAR(255) NOT NULL,
  `sort_order` INT(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_image_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 99
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_banner_image_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_banner_image_description` (
  `banner_image_id` INT(11) NOT NULL,
  `language_id` INT(11) NOT NULL,
  `banner_id` INT(11) NOT NULL,
  `title` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`, `language_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_category
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_category` (
  `category_id` INT(11) NOT NULL AUTO_INCREMENT,
  `image` VARCHAR(255) NULL DEFAULT NULL,
  `parent_id` INT(11) NOT NULL DEFAULT '0',
  `top` TINYINT(1) NOT NULL,
  `column` INT(3) NOT NULL,
  `sort_order` INT(3) NOT NULL DEFAULT '0',
  `status` TINYINT(1) NOT NULL,
  `date_added` DATETIME NOT NULL,
  `date_modified` DATETIME NOT NULL,
  PRIMARY KEY (`category_id`),
  INDEX `parent_id` (`parent_id` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 59
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_category_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_category_description` (
  `category_id` INT(11) NOT NULL,
  `language_id` INT(11) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `meta_title` VARCHAR(255) NOT NULL,
  `meta_description` VARCHAR(255) NOT NULL,
  `meta_keyword` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`category_id`, `language_id`),
  INDEX `name` (`name` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_category_filter
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_category_filter` (
  `category_id` INT(11) NOT NULL,
  `filter_id` INT(11) NOT NULL,
  PRIMARY KEY (`category_id`, `filter_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_category_path
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_category_path` (
  `category_id` INT(11) NOT NULL,
  `path_id` INT(11) NOT NULL,
  `level` INT(11) NOT NULL,
  PRIMARY KEY (`category_id`, `path_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_category_to_layout
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_category_to_layout` (
  `category_id` INT(11) NOT NULL,
  `store_id` INT(11) NOT NULL,
  `layout_id` INT(11) NOT NULL,
  PRIMARY KEY (`category_id`, `store_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_category_to_store
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_category_to_store` (
  `category_id` INT(11) NOT NULL,
  `store_id` INT(11) NOT NULL,
  PRIMARY KEY (`category_id`, `store_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_country
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_country` (
  `country_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `iso_code_2` VARCHAR(2) NOT NULL,
  `iso_code_3` VARCHAR(3) NOT NULL,
  `address_format` TEXT NOT NULL,
  `postcode_required` TINYINT(1) NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 258
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_coupon
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_coupon` (
  `coupon_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `code` VARCHAR(10) NOT NULL,
  `type` CHAR(1) NOT NULL,
  `discount` DECIMAL(15,4) NOT NULL,
  `logged` TINYINT(1) NOT NULL,
  `shipping` TINYINT(1) NOT NULL,
  `total` DECIMAL(15,4) NOT NULL,
  `date_start` DATE NOT NULL DEFAULT '0000-00-00',
  `date_end` DATE NOT NULL DEFAULT '0000-00-00',
  `uses_total` INT(11) NOT NULL,
  `uses_customer` VARCHAR(11) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`coupon_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_coupon_category
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_coupon_category` (
  `coupon_id` INT(11) NOT NULL,
  `category_id` INT(11) NOT NULL,
  PRIMARY KEY (`coupon_id`, `category_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_coupon_history
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_coupon_history` (
  `coupon_history_id` INT(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` INT(11) NOT NULL,
  `order_id` INT(11) NOT NULL,
  `customer_id` INT(11) NOT NULL,
  `amount` DECIMAL(15,4) NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`coupon_history_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_coupon_product
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_coupon_product` (
  `coupon_product_id` INT(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_currency
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_currency` (
  `currency_id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(32) NOT NULL,
  `code` VARCHAR(3) NOT NULL,
  `symbol_left` VARCHAR(12) NOT NULL,
  `symbol_right` VARCHAR(12) NOT NULL,
  `decimal_place` CHAR(1) NOT NULL,
  `value` FLOAT(15,8) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  `date_modified` DATETIME NOT NULL,
  PRIMARY KEY (`currency_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_custom_field
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_custom_field` (
  `custom_field_id` INT(11) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(32) NOT NULL,
  `value` TEXT NOT NULL,
  `location` VARCHAR(7) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  `sort_order` INT(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_custom_field_customer_group
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_custom_field_customer_group` (
  `custom_field_id` INT(11) NOT NULL,
  `customer_group_id` INT(11) NOT NULL,
  `required` TINYINT(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`, `customer_group_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_custom_field_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_custom_field_description` (
  `custom_field_id` INT(11) NOT NULL,
  `language_id` INT(11) NOT NULL,
  `name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`, `language_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_custom_field_value
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_custom_field_value` (
  `custom_field_value_id` INT(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` INT(11) NOT NULL,
  `sort_order` INT(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_custom_field_value_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_custom_field_value_description` (
  `custom_field_value_id` INT(11) NOT NULL,
  `language_id` INT(11) NOT NULL,
  `custom_field_id` INT(11) NOT NULL,
  `name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`, `language_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_customer
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_customer` (
  `customer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` INT(11) NOT NULL,
  `store_id` INT(11) NOT NULL DEFAULT '0',
  `firstname` VARCHAR(32) NOT NULL,
  `lastname` VARCHAR(32) NOT NULL,
  `email` VARCHAR(96) NOT NULL,
  `telephone` VARCHAR(32) NOT NULL,
  `fax` VARCHAR(32) NOT NULL,
  `password` VARCHAR(40) NOT NULL,
  `salt` VARCHAR(9) NOT NULL,
  `cart` TEXT NULL DEFAULT NULL,
  `wishlist` TEXT NULL DEFAULT NULL,
  `newsletter` TINYINT(1) NOT NULL DEFAULT '0',
  `address_id` INT(11) NOT NULL DEFAULT '0',
  `custom_field` TEXT NOT NULL,
  `ip` VARCHAR(40) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  `approved` TINYINT(1) NOT NULL,
  `safe` TINYINT(1) NOT NULL,
  `token` VARCHAR(255) NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_customer_activity
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_customer_activity` (
  `activity_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_id` INT(11) NOT NULL,
  `key` VARCHAR(64) NOT NULL,
  `data` TEXT NOT NULL,
  `ip` VARCHAR(40) NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`activity_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 37
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_customer_ban_ip
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_customer_ban_ip` (
  `customer_ban_ip_id` INT(11) NOT NULL AUTO_INCREMENT,
  `ip` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  INDEX `ip` (`ip` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_customer_group
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_customer_group` (
  `customer_group_id` INT(11) NOT NULL AUTO_INCREMENT,
  `approval` INT(1) NOT NULL,
  `sort_order` INT(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_customer_group_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_customer_group_description` (
  `customer_group_id` INT(11) NOT NULL,
  `language_id` INT(11) NOT NULL,
  `name` VARCHAR(32) NOT NULL,
  `description` TEXT NOT NULL,
  PRIMARY KEY (`customer_group_id`, `language_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_customer_history
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_customer_history` (
  `customer_history_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_id` INT(11) NOT NULL,
  `comment` TEXT NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`customer_history_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_customer_ip
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_customer_ip` (
  `customer_ip_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_id` INT(11) NOT NULL,
  `ip` VARCHAR(40) NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  INDEX `ip` (`ip` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_customer_login
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_customer_login` (
  `customer_login_id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(96) NOT NULL,
  `ip` VARCHAR(40) NOT NULL,
  `total` INT(4) NOT NULL,
  `date_added` DATETIME NOT NULL,
  `date_modified` DATETIME NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  INDEX `email` (`email` ASC),
  INDEX `ip` (`ip` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_customer_online
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_customer_online` (
  `ip` VARCHAR(40) NOT NULL,
  `customer_id` INT(11) NOT NULL,
  `url` TEXT NOT NULL,
  `referer` TEXT NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`ip`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_customer_reward
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_customer_reward` (
  `customer_reward_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_id` INT(11) NOT NULL DEFAULT '0',
  `order_id` INT(11) NOT NULL DEFAULT '0',
  `description` TEXT NOT NULL,
  `points` INT(8) NOT NULL DEFAULT '0',
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`customer_reward_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_customer_transaction
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_customer_transaction` (
  `customer_transaction_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_id` INT(11) NOT NULL,
  `order_id` INT(11) NOT NULL,
  `description` TEXT NOT NULL,
  `amount` DECIMAL(15,4) NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`customer_transaction_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_download
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_download` (
  `download_id` INT(11) NOT NULL AUTO_INCREMENT,
  `filename` VARCHAR(128) NOT NULL,
  `mask` VARCHAR(128) NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`download_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_download_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_download_description` (
  `download_id` INT(11) NOT NULL,
  `language_id` INT(11) NOT NULL,
  `name` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`download_id`, `language_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_event
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_event` (
  `event_id` INT(11) NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(32) NOT NULL,
  `trigger` TEXT NOT NULL,
  `action` TEXT NOT NULL,
  PRIMARY KEY (`event_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_extension
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_extension` (
  `extension_id` INT(11) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(32) NOT NULL,
  `code` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`extension_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 434
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_filter
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_filter` (
  `filter_id` INT(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` INT(11) NOT NULL,
  `sort_order` INT(3) NOT NULL,
  PRIMARY KEY (`filter_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_filter_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_filter_description` (
  `filter_id` INT(11) NOT NULL,
  `language_id` INT(11) NOT NULL,
  `filter_group_id` INT(11) NOT NULL,
  `name` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`filter_id`, `language_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_filter_group
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_filter_group` (
  `filter_group_id` INT(11) NOT NULL AUTO_INCREMENT,
  `sort_order` INT(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_filter_group_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_filter_group_description` (
  `filter_group_id` INT(11) NOT NULL,
  `language_id` INT(11) NOT NULL,
  `name` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`, `language_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_geo_zone
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_geo_zone` (
  `geo_zone_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `date_modified` DATETIME NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`geo_zone_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_information
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_information` (
  `information_id` INT(11) NOT NULL AUTO_INCREMENT,
  `bottom` INT(1) NOT NULL DEFAULT '0',
  `sort_order` INT(3) NOT NULL DEFAULT '0',
  `status` TINYINT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_information_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_information_description` (
  `information_id` INT(11) NOT NULL,
  `language_id` INT(11) NOT NULL,
  `title` VARCHAR(64) NOT NULL,
  `description` TEXT NOT NULL,
  `meta_title` VARCHAR(255) NOT NULL,
  `meta_description` VARCHAR(255) NOT NULL,
  `meta_keyword` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`information_id`, `language_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_information_to_layout
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_information_to_layout` (
  `information_id` INT(11) NOT NULL,
  `store_id` INT(11) NOT NULL,
  `layout_id` INT(11) NOT NULL,
  PRIMARY KEY (`information_id`, `store_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_information_to_store
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_information_to_store` (
  `information_id` INT(11) NOT NULL,
  `store_id` INT(11) NOT NULL,
  PRIMARY KEY (`information_id`, `store_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_language
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_language` (
  `language_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `code` VARCHAR(5) NOT NULL,
  `locale` VARCHAR(255) NOT NULL,
  `image` VARCHAR(64) NOT NULL,
  `directory` VARCHAR(32) NOT NULL,
  `sort_order` INT(3) NOT NULL DEFAULT '0',
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  INDEX `name` (`name` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_layout
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_layout` (
  `layout_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`layout_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_layout_module
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_layout_module` (
  `layout_module_id` INT(11) NOT NULL AUTO_INCREMENT,
  `layout_id` INT(11) NOT NULL,
  `code` VARCHAR(64) NOT NULL,
  `position` VARCHAR(14) NOT NULL,
  `sort_order` INT(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 99
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_layout_route
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_layout_route` (
  `layout_route_id` INT(11) NOT NULL AUTO_INCREMENT,
  `layout_id` INT(11) NOT NULL,
  `store_id` INT(11) NOT NULL,
  `route` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 72
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_length_class
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_length_class` (
  `length_class_id` INT(11) NOT NULL AUTO_INCREMENT,
  `value` DECIMAL(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_length_class_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_length_class_description` (
  `length_class_id` INT(11) NOT NULL AUTO_INCREMENT,
  `language_id` INT(11) NOT NULL,
  `title` VARCHAR(32) NOT NULL,
  `unit` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`length_class_id`, `language_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_location
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_location` (
  `location_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `address` TEXT NOT NULL,
  `telephone` VARCHAR(32) NOT NULL,
  `fax` VARCHAR(32) NOT NULL,
  `geocode` VARCHAR(32) NOT NULL,
  `image` VARCHAR(255) NULL DEFAULT NULL,
  `open` TEXT NOT NULL,
  `comment` TEXT NOT NULL,
  PRIMARY KEY (`location_id`),
  INDEX `name` (`name` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_manufacturer
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_manufacturer` (
  `manufacturer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL,
  `image` VARCHAR(255) NULL DEFAULT NULL,
  `sort_order` INT(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_manufacturer_to_store
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_manufacturer_to_store` (
  `manufacturer_id` INT(11) NOT NULL,
  `store_id` INT(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`, `store_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_marketing
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_marketing` (
  `marketing_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `description` TEXT NOT NULL,
  `code` VARCHAR(64) NOT NULL,
  `clicks` INT(5) NOT NULL DEFAULT '0',
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`marketing_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_modification
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_modification` (
  `modification_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL,
  `code` VARCHAR(64) NOT NULL,
  `author` VARCHAR(64) NOT NULL,
  `version` VARCHAR(32) NOT NULL,
  `link` VARCHAR(255) NOT NULL,
  `xml` TEXT NOT NULL,
  `status` TINYINT(1) NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`modification_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_module
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_module` (
  `module_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL,
  `code` VARCHAR(32) NOT NULL,
  `setting` TEXT NOT NULL,
  PRIMARY KEY (`module_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 32
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_option
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_option` (
  `option_id` INT(11) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(32) NOT NULL,
  `sort_order` INT(3) NOT NULL,
  PRIMARY KEY (`option_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_option_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_option_description` (
  `option_id` INT(11) NOT NULL,
  `language_id` INT(11) NOT NULL,
  `name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`option_id`, `language_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_option_value
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_option_value` (
  `option_value_id` INT(11) NOT NULL AUTO_INCREMENT,
  `option_id` INT(11) NOT NULL,
  `image` VARCHAR(255) NOT NULL,
  `sort_order` INT(3) NOT NULL,
  PRIMARY KEY (`option_value_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 49
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_option_value_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_option_value_description` (
  `option_value_id` INT(11) NOT NULL,
  `language_id` INT(11) NOT NULL,
  `option_id` INT(11) NOT NULL,
  `name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`option_value_id`, `language_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_order
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_order` (
  `order_id` INT(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` INT(11) NOT NULL DEFAULT '0',
  `invoice_prefix` VARCHAR(26) NOT NULL,
  `store_id` INT(11) NOT NULL DEFAULT '0',
  `store_name` VARCHAR(64) NOT NULL,
  `store_url` VARCHAR(255) NOT NULL,
  `customer_id` INT(11) NOT NULL DEFAULT '0',
  `customer_group_id` INT(11) NOT NULL DEFAULT '0',
  `firstname` VARCHAR(32) NOT NULL,
  `lastname` VARCHAR(32) NOT NULL,
  `email` VARCHAR(96) NOT NULL,
  `telephone` VARCHAR(32) NOT NULL,
  `fax` VARCHAR(32) NOT NULL,
  `custom_field` TEXT NOT NULL,
  `payment_firstname` VARCHAR(32) NOT NULL,
  `payment_lastname` VARCHAR(32) NOT NULL,
  `payment_company` VARCHAR(40) NOT NULL,
  `payment_address_1` VARCHAR(128) NOT NULL,
  `payment_address_2` VARCHAR(128) NOT NULL,
  `payment_city` VARCHAR(128) NOT NULL,
  `payment_postcode` VARCHAR(10) NOT NULL,
  `payment_country` VARCHAR(128) NOT NULL,
  `payment_country_id` INT(11) NOT NULL,
  `payment_zone` VARCHAR(128) NOT NULL,
  `payment_zone_id` INT(11) NOT NULL,
  `payment_address_format` TEXT NOT NULL,
  `payment_custom_field` TEXT NOT NULL,
  `payment_method` VARCHAR(128) NOT NULL,
  `payment_code` VARCHAR(128) NOT NULL,
  `shipping_firstname` VARCHAR(32) NOT NULL,
  `shipping_lastname` VARCHAR(32) NOT NULL,
  `shipping_company` VARCHAR(40) NOT NULL,
  `shipping_address_1` VARCHAR(128) NOT NULL,
  `shipping_address_2` VARCHAR(128) NOT NULL,
  `shipping_city` VARCHAR(128) NOT NULL,
  `shipping_postcode` VARCHAR(10) NOT NULL,
  `shipping_country` VARCHAR(128) NOT NULL,
  `shipping_country_id` INT(11) NOT NULL,
  `shipping_zone` VARCHAR(128) NOT NULL,
  `shipping_zone_id` INT(11) NOT NULL,
  `shipping_address_format` TEXT NOT NULL,
  `shipping_custom_field` TEXT NOT NULL,
  `shipping_method` VARCHAR(128) NOT NULL,
  `shipping_code` VARCHAR(128) NOT NULL,
  `comment` TEXT NOT NULL,
  `total` DECIMAL(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` INT(11) NOT NULL DEFAULT '0',
  `affiliate_id` INT(11) NOT NULL,
  `commission` DECIMAL(15,4) NOT NULL,
  `marketing_id` INT(11) NOT NULL,
  `tracking` VARCHAR(64) NOT NULL,
  `language_id` INT(11) NOT NULL,
  `currency_id` INT(11) NOT NULL,
  `currency_code` VARCHAR(3) NOT NULL,
  `currency_value` DECIMAL(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` VARCHAR(40) NOT NULL,
  `forwarded_ip` VARCHAR(40) NOT NULL,
  `user_agent` VARCHAR(255) NOT NULL,
  `accept_language` VARCHAR(255) NOT NULL,
  `date_added` DATETIME NOT NULL,
  `date_modified` DATETIME NOT NULL,
  PRIMARY KEY (`order_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 38
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_order_custom_field
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_order_custom_field` (
  `order_custom_field_id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) NOT NULL,
  `custom_field_id` INT(11) NOT NULL,
  `custom_field_value_id` INT(11) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `value` TEXT NOT NULL,
  `type` VARCHAR(32) NOT NULL,
  `location` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_order_fraud
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_order_fraud` (
  `order_id` INT(11) NOT NULL,
  `customer_id` INT(11) NOT NULL,
  `country_match` VARCHAR(3) NOT NULL,
  `country_code` VARCHAR(2) NOT NULL,
  `high_risk_country` VARCHAR(3) NOT NULL,
  `distance` INT(11) NOT NULL,
  `ip_region` VARCHAR(255) NOT NULL,
  `ip_city` VARCHAR(255) NOT NULL,
  `ip_latitude` DECIMAL(10,6) NOT NULL,
  `ip_longitude` DECIMAL(10,6) NOT NULL,
  `ip_isp` VARCHAR(255) NOT NULL,
  `ip_org` VARCHAR(255) NOT NULL,
  `ip_asnum` INT(11) NOT NULL,
  `ip_user_type` VARCHAR(255) NOT NULL,
  `ip_country_confidence` VARCHAR(3) NOT NULL,
  `ip_region_confidence` VARCHAR(3) NOT NULL,
  `ip_city_confidence` VARCHAR(3) NOT NULL,
  `ip_postal_confidence` VARCHAR(3) NOT NULL,
  `ip_postal_code` VARCHAR(10) NOT NULL,
  `ip_accuracy_radius` INT(11) NOT NULL,
  `ip_net_speed_cell` VARCHAR(255) NOT NULL,
  `ip_metro_code` INT(3) NOT NULL,
  `ip_area_code` INT(3) NOT NULL,
  `ip_time_zone` VARCHAR(255) NOT NULL,
  `ip_region_name` VARCHAR(255) NOT NULL,
  `ip_domain` VARCHAR(255) NOT NULL,
  `ip_country_name` VARCHAR(255) NOT NULL,
  `ip_continent_code` VARCHAR(2) NOT NULL,
  `ip_corporate_proxy` VARCHAR(3) NOT NULL,
  `anonymous_proxy` VARCHAR(3) NOT NULL,
  `proxy_score` INT(3) NOT NULL,
  `is_trans_proxy` VARCHAR(3) NOT NULL,
  `free_mail` VARCHAR(3) NOT NULL,
  `carder_email` VARCHAR(3) NOT NULL,
  `high_risk_username` VARCHAR(3) NOT NULL,
  `high_risk_password` VARCHAR(3) NOT NULL,
  `bin_match` VARCHAR(10) NOT NULL,
  `bin_country` VARCHAR(2) NOT NULL,
  `bin_name_match` VARCHAR(3) NOT NULL,
  `bin_name` VARCHAR(255) NOT NULL,
  `bin_phone_match` VARCHAR(3) NOT NULL,
  `bin_phone` VARCHAR(32) NOT NULL,
  `customer_phone_in_billing_location` VARCHAR(8) NOT NULL,
  `ship_forward` VARCHAR(3) NOT NULL,
  `city_postal_match` VARCHAR(3) NOT NULL,
  `ship_city_postal_match` VARCHAR(3) NOT NULL,
  `score` DECIMAL(10,5) NOT NULL,
  `explanation` TEXT NOT NULL,
  `risk_score` DECIMAL(10,5) NOT NULL,
  `queries_remaining` INT(11) NOT NULL,
  `maxmind_id` VARCHAR(8) NOT NULL,
  `error` TEXT NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`order_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_order_history
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_order_history` (
  `order_history_id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) NOT NULL,
  `order_status_id` INT(5) NOT NULL,
  `notify` TINYINT(1) NOT NULL DEFAULT '0',
  `comment` TEXT NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`order_history_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 41
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_order_option
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_order_option` (
  `order_option_id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) NOT NULL,
  `order_product_id` INT(11) NOT NULL,
  `product_option_id` INT(11) NOT NULL,
  `product_option_value_id` INT(11) NOT NULL DEFAULT '0',
  `name` VARCHAR(255) NOT NULL,
  `value` TEXT NOT NULL,
  `type` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`order_option_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 44
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_order_product
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_order_product` (
  `order_product_id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `model` VARCHAR(64) NOT NULL,
  `quantity` INT(4) NOT NULL,
  `price` DECIMAL(15,4) NOT NULL DEFAULT '0.0000',
  `total` DECIMAL(15,4) NOT NULL DEFAULT '0.0000',
  `tax` DECIMAL(15,4) NOT NULL DEFAULT '0.0000',
  `reward` INT(8) NOT NULL,
  PRIMARY KEY (`order_product_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 86
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_order_recurring
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_order_recurring` (
  `order_recurring_id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) NOT NULL,
  `reference` VARCHAR(255) NOT NULL,
  `product_id` INT(11) NOT NULL,
  `product_name` VARCHAR(255) NOT NULL,
  `product_quantity` INT(11) NOT NULL,
  `recurring_id` INT(11) NOT NULL,
  `recurring_name` VARCHAR(255) NOT NULL,
  `recurring_description` VARCHAR(255) NOT NULL,
  `recurring_frequency` VARCHAR(25) NOT NULL,
  `recurring_cycle` SMALLINT(6) NOT NULL,
  `recurring_duration` SMALLINT(6) NOT NULL,
  `recurring_price` DECIMAL(10,4) NOT NULL,
  `trial` TINYINT(1) NOT NULL,
  `trial_frequency` VARCHAR(25) NOT NULL,
  `trial_cycle` SMALLINT(6) NOT NULL,
  `trial_duration` SMALLINT(6) NOT NULL,
  `trial_price` DECIMAL(10,4) NOT NULL,
  `status` TINYINT(4) NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`order_recurring_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_order_recurring_transaction
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_order_recurring_transaction` (
  `order_recurring_transaction_id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` INT(11) NOT NULL,
  `reference` VARCHAR(255) NOT NULL,
  `type` VARCHAR(255) NOT NULL,
  `amount` DECIMAL(10,4) NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_order_status
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_order_status` (
  `order_status_id` INT(11) NOT NULL AUTO_INCREMENT,
  `language_id` INT(11) NOT NULL,
  `name` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`order_status_id`, `language_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_order_total
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_order_total` (
  `order_total_id` INT(10) NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) NOT NULL,
  `code` VARCHAR(32) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `value` DECIMAL(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` INT(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  INDEX `order_id` (`order_id` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 112
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_order_voucher
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_order_voucher` (
  `order_voucher_id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) NOT NULL,
  `voucher_id` INT(11) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `code` VARCHAR(10) NOT NULL,
  `from_name` VARCHAR(64) NOT NULL,
  `from_email` VARCHAR(96) NOT NULL,
  `to_name` VARCHAR(64) NOT NULL,
  `to_email` VARCHAR(96) NOT NULL,
  `voucher_theme_id` INT(11) NOT NULL,
  `message` TEXT NOT NULL,
  `amount` DECIMAL(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_product
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_product` (
  `product_id` INT(11) NOT NULL AUTO_INCREMENT,
  `model` VARCHAR(64) NOT NULL,
  `sku` VARCHAR(64) NOT NULL,
  `upc` VARCHAR(12) NOT NULL,
  `ean` VARCHAR(14) NOT NULL,
  `jan` VARCHAR(13) NOT NULL,
  `isbn` VARCHAR(17) NOT NULL,
  `mpn` VARCHAR(64) NOT NULL,
  `location` VARCHAR(128) NOT NULL,
  `quantity` INT(4) NOT NULL DEFAULT '0',
  `stock_status_id` INT(11) NOT NULL,
  `image` VARCHAR(255) NULL DEFAULT NULL,
  `manufacturer_id` INT(11) NOT NULL,
  `shipping` TINYINT(1) NOT NULL DEFAULT '1',
  `price` DECIMAL(15,4) NOT NULL DEFAULT '0.0000',
  `points` INT(8) NOT NULL DEFAULT '0',
  `tax_class_id` INT(11) NOT NULL,
  `date_available` DATE NOT NULL DEFAULT '0000-00-00',
  `weight` DECIMAL(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` INT(11) NOT NULL DEFAULT '0',
  `length` DECIMAL(15,8) NOT NULL DEFAULT '0.00000000',
  `width` DECIMAL(15,8) NOT NULL DEFAULT '0.00000000',
  `height` DECIMAL(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` INT(11) NOT NULL DEFAULT '0',
  `subtract` TINYINT(1) NOT NULL DEFAULT '1',
  `minimum` INT(11) NOT NULL DEFAULT '1',
  `sort_order` INT(11) NOT NULL DEFAULT '0',
  `status` TINYINT(1) NOT NULL DEFAULT '0',
  `viewed` INT(5) NOT NULL DEFAULT '0',
  `date_added` DATETIME NOT NULL,
  `date_modified` DATETIME NOT NULL,
  PRIMARY KEY (`product_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 50
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_product_attribute
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_product_attribute` (
  `product_id` INT(11) NOT NULL,
  `attribute_id` INT(11) NOT NULL,
  `language_id` INT(11) NOT NULL,
  `text` TEXT NOT NULL,
  PRIMARY KEY (`product_id`, `attribute_id`, `language_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_product_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_product_description` (
  `product_id` INT(11) NOT NULL,
  `language_id` INT(11) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `tag` TEXT NOT NULL,
  `meta_title` VARCHAR(255) NOT NULL,
  `meta_description` VARCHAR(255) NOT NULL,
  `meta_keyword` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`product_id`, `language_id`),
  INDEX `name` (`name` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_product_discount
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_product_discount` (
  `product_discount_id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_id` INT(11) NOT NULL,
  `customer_group_id` INT(11) NOT NULL,
  `quantity` INT(4) NOT NULL DEFAULT '0',
  `priority` INT(5) NOT NULL DEFAULT '1',
  `price` DECIMAL(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` DATE NOT NULL DEFAULT '0000-00-00',
  `date_end` DATE NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  INDEX `product_id` (`product_id` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 441
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_product_filter
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_product_filter` (
  `product_id` INT(11) NOT NULL,
  `filter_id` INT(11) NOT NULL,
  PRIMARY KEY (`product_id`, `filter_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_product_image
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_product_image` (
  `product_image_id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_id` INT(11) NOT NULL,
  `image` VARCHAR(255) NULL DEFAULT NULL,
  `sort_order` INT(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  INDEX `product_id` (`product_id` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 2364
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_product_option
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_product_option` (
  `product_option_id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_id` INT(11) NOT NULL,
  `option_id` INT(11) NOT NULL,
  `value` TEXT NOT NULL,
  `required` TINYINT(1) NOT NULL,
  PRIMARY KEY (`product_option_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 227
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_product_option_value
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_product_option_value` (
  `product_option_value_id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  `option_id` INT(11) NOT NULL,
  `option_value_id` INT(11) NOT NULL,
  `quantity` INT(3) NOT NULL,
  `subtract` TINYINT(1) NOT NULL,
  `price` DECIMAL(15,4) NOT NULL,
  `price_prefix` VARCHAR(1) NOT NULL,
  `points` INT(8) NOT NULL,
  `points_prefix` VARCHAR(1) NOT NULL,
  `weight` DECIMAL(15,8) NOT NULL,
  `weight_prefix` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_product_recurring
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_product_recurring` (
  `product_id` INT(11) NOT NULL,
  `recurring_id` INT(11) NOT NULL,
  `customer_group_id` INT(11) NOT NULL,
  PRIMARY KEY (`product_id`, `recurring_id`, `customer_group_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_product_related
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_product_related` (
  `product_id` INT(11) NOT NULL,
  `related_id` INT(11) NOT NULL,
  PRIMARY KEY (`product_id`, `related_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_product_reward
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_product_reward` (
  `product_reward_id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_id` INT(11) NOT NULL DEFAULT '0',
  `customer_group_id` INT(11) NOT NULL DEFAULT '0',
  `points` INT(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 549
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_product_special
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_product_special` (
  `product_special_id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_id` INT(11) NOT NULL,
  `customer_group_id` INT(11) NOT NULL,
  `priority` INT(5) NOT NULL DEFAULT '1',
  `price` DECIMAL(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` DATE NOT NULL DEFAULT '0000-00-00',
  `date_end` DATE NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  INDEX `product_id` (`product_id` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 440
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_product_to_category
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_product_to_category` (
  `product_id` INT(11) NOT NULL,
  `category_id` INT(11) NOT NULL,
  PRIMARY KEY (`product_id`, `category_id`),
  INDEX `category_id` (`category_id` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_product_to_download
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_product_to_download` (
  `product_id` INT(11) NOT NULL,
  `download_id` INT(11) NOT NULL,
  PRIMARY KEY (`product_id`, `download_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_product_to_layout
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_product_to_layout` (
  `product_id` INT(11) NOT NULL,
  `store_id` INT(11) NOT NULL,
  `layout_id` INT(11) NOT NULL,
  PRIMARY KEY (`product_id`, `store_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_product_to_store
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_product_to_store` (
  `product_id` INT(11) NOT NULL,
  `store_id` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`, `store_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_recurring
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_recurring` (
  `recurring_id` INT(11) NOT NULL AUTO_INCREMENT,
  `price` DECIMAL(10,4) NOT NULL,
  `frequency` ENUM('day','week','semi_month','month','year') NOT NULL,
  `duration` INT(10) UNSIGNED NOT NULL,
  `cycle` INT(10) UNSIGNED NOT NULL,
  `trial_status` TINYINT(4) NOT NULL,
  `trial_price` DECIMAL(10,4) NOT NULL,
  `trial_frequency` ENUM('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` INT(10) UNSIGNED NOT NULL,
  `trial_cycle` INT(10) UNSIGNED NOT NULL,
  `status` TINYINT(4) NOT NULL,
  `sort_order` INT(11) NOT NULL,
  PRIMARY KEY (`recurring_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_recurring_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_recurring_description` (
  `recurring_id` INT(11) NOT NULL,
  `language_id` INT(11) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`recurring_id`, `language_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_return
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_return` (
  `return_id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  `customer_id` INT(11) NOT NULL,
  `firstname` VARCHAR(32) NOT NULL,
  `lastname` VARCHAR(32) NOT NULL,
  `email` VARCHAR(96) NOT NULL,
  `telephone` VARCHAR(32) NOT NULL,
  `product` VARCHAR(255) NOT NULL,
  `model` VARCHAR(64) NOT NULL,
  `quantity` INT(4) NOT NULL,
  `opened` TINYINT(1) NOT NULL,
  `return_reason_id` INT(11) NOT NULL,
  `return_action_id` INT(11) NOT NULL,
  `return_status_id` INT(11) NOT NULL,
  `comment` TEXT NULL DEFAULT NULL,
  `date_ordered` DATE NOT NULL DEFAULT '0000-00-00',
  `date_added` DATETIME NOT NULL,
  `date_modified` DATETIME NOT NULL,
  PRIMARY KEY (`return_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_return_action
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_return_action` (
  `return_action_id` INT(11) NOT NULL AUTO_INCREMENT,
  `language_id` INT(11) NOT NULL DEFAULT '0',
  `name` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`return_action_id`, `language_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_return_history
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_return_history` (
  `return_history_id` INT(11) NOT NULL AUTO_INCREMENT,
  `return_id` INT(11) NOT NULL,
  `return_status_id` INT(11) NOT NULL,
  `notify` TINYINT(1) NOT NULL,
  `comment` TEXT NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`return_history_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_return_reason
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_return_reason` (
  `return_reason_id` INT(11) NOT NULL AUTO_INCREMENT,
  `language_id` INT(11) NOT NULL DEFAULT '0',
  `name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`, `language_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_return_status
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_return_status` (
  `return_status_id` INT(11) NOT NULL AUTO_INCREMENT,
  `language_id` INT(11) NOT NULL DEFAULT '0',
  `name` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`return_status_id`, `language_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_review
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_review` (
  `review_id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_id` INT(11) NOT NULL,
  `customer_id` INT(11) NOT NULL,
  `author` VARCHAR(64) NOT NULL,
  `text` TEXT NOT NULL,
  `rating` INT(1) NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT '0',
  `date_added` DATETIME NOT NULL,
  `date_modified` DATETIME NOT NULL,
  PRIMARY KEY (`review_id`),
  INDEX `product_id` (`product_id` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_setting
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_setting` (
  `setting_id` INT(11) NOT NULL AUTO_INCREMENT,
  `store_id` INT(11) NOT NULL DEFAULT '0',
  `code` VARCHAR(32) NOT NULL,
  `key` VARCHAR(64) NOT NULL,
  `value` TEXT NOT NULL,
  `serialized` TINYINT(1) NOT NULL,
  PRIMARY KEY (`setting_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 887
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_stock_status
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_stock_status` (
  `stock_status_id` INT(11) NOT NULL AUTO_INCREMENT,
  `language_id` INT(11) NOT NULL,
  `name` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`, `language_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_store
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_store` (
  `store_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  `ssl` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`store_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_tax_class
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_tax_class` (
  `tax_class_id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(32) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `date_added` DATETIME NOT NULL,
  `date_modified` DATETIME NOT NULL,
  PRIMARY KEY (`tax_class_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_tax_rate
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_tax_rate` (
  `tax_rate_id` INT(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` INT(11) NOT NULL DEFAULT '0',
  `name` VARCHAR(32) NOT NULL,
  `rate` DECIMAL(15,4) NOT NULL DEFAULT '0.0000',
  `type` CHAR(1) NOT NULL,
  `date_added` DATETIME NOT NULL,
  `date_modified` DATETIME NOT NULL,
  PRIMARY KEY (`tax_rate_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 88
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_tax_rate_to_customer_group
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_tax_rate_to_customer_group` (
  `tax_rate_id` INT(11) NOT NULL,
  `customer_group_id` INT(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`, `customer_group_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_tax_rule
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_tax_rule` (
  `tax_rule_id` INT(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` INT(11) NOT NULL,
  `tax_rate_id` INT(11) NOT NULL,
  `based` VARCHAR(10) NOT NULL,
  `priority` INT(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 129
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_upload
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_upload` (
  `upload_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `filename` VARCHAR(255) NOT NULL,
  `code` VARCHAR(255) NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`upload_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_url_alias
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_url_alias` (
  `url_alias_id` INT(11) NOT NULL AUTO_INCREMENT,
  `query` VARCHAR(255) NOT NULL,
  `keyword` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  INDEX `query` (`query` ASC),
  INDEX `keyword` (`keyword` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 869
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_user
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` INT(11) NOT NULL,
  `username` VARCHAR(20) NOT NULL,
  `password` VARCHAR(40) NOT NULL,
  `salt` VARCHAR(9) NOT NULL,
  `firstname` VARCHAR(32) NOT NULL,
  `lastname` VARCHAR(32) NOT NULL,
  `email` VARCHAR(96) NOT NULL,
  `image` VARCHAR(255) NOT NULL,
  `code` VARCHAR(40) NOT NULL,
  `ip` VARCHAR(40) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_user_group
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_user_group` (
  `user_group_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL,
  `permission` TEXT NOT NULL,
  PRIMARY KEY (`user_group_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_voucher
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_voucher` (
  `voucher_id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) NOT NULL,
  `code` VARCHAR(10) NOT NULL,
  `from_name` VARCHAR(64) NOT NULL,
  `from_email` VARCHAR(96) NOT NULL,
  `to_name` VARCHAR(64) NOT NULL,
  `to_email` VARCHAR(96) NOT NULL,
  `voucher_theme_id` INT(11) NOT NULL,
  `message` TEXT NOT NULL,
  `amount` DECIMAL(15,4) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`voucher_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_voucher_history
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_voucher_history` (
  `voucher_history_id` INT(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` INT(11) NOT NULL,
  `order_id` INT(11) NOT NULL,
  `amount` DECIMAL(15,4) NOT NULL,
  `date_added` DATETIME NOT NULL,
  PRIMARY KEY (`voucher_history_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_voucher_theme
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_voucher_theme` (
  `voucher_theme_id` INT(11) NOT NULL AUTO_INCREMENT,
  `image` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_voucher_theme_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_voucher_theme_description` (
  `voucher_theme_id` INT(11) NOT NULL,
  `language_id` INT(11) NOT NULL,
  `name` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`, `language_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_weight_class
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_weight_class` (
  `weight_class_id` INT(11) NOT NULL AUTO_INCREMENT,
  `value` DECIMAL(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_weight_class_description
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_weight_class_description` (
  `weight_class_id` INT(11) NOT NULL AUTO_INCREMENT,
  `language_id` INT(11) NOT NULL,
  `title` VARCHAR(32) NOT NULL,
  `unit` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`, `language_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_zone
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_zone` (
  `zone_id` INT(11) NOT NULL AUTO_INCREMENT,
  `country_id` INT(11) NOT NULL,
  `name` VARCHAR(128) NOT NULL,
  `code` VARCHAR(32) NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 4225
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table loja.oc_zone_to_geo_zone
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` INT(11) NOT NULL AUTO_INCREMENT,
  `country_id` INT(11) NOT NULL,
  `zone_id` INT(11) NOT NULL DEFAULT '0',
  `geo_zone_id` INT(11) NOT NULL,
  `date_added` DATETIME NOT NULL,
  `date_modified` DATETIME NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`))
ENGINE = MyISAM
AUTO_INCREMENT = 114
DEFAULT CHARACTER SET = utf8;
SET FOREIGN_KEY_CHECKS = 1;;
