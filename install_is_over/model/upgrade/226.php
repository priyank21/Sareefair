<?php
class ModelUpgrade226 extends Model {
	public function upgrade() {
		// Coupon
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "coupon` ADD COLUMN `seller_id` int(11) NOT NULL AFTER `coupon_id`");		
			
	  // Setting
		$this->db->query("INSERT INTO `" . DB_PREFIX . "setting` SET `code` = 'config', `key` = 'config_seller_group_id', `value` = '1'");
    
    // Seller group
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "seller` ADD COLUMN `seller_group_id` int(11) NOT NULL AFTER `seller_id`");
    $sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "seller_group` ( ";
	  $sql .= "`seller_group_id` int(11) NOT NULL AUTO_INCREMENT, ";
	  $sql .= "`approval` int(1) NOT NULL, ";
	  $sql .= "`sort_order` int(3) NOT NULL, ";
	  $sql .= "`prodlimit` int(11) NOT NULL, ";
	  $sql .= "`imglimit` int(11) NOT NULL, ";
	  $sql .= "`downloadlimit` int(11) NOT NULL, ";
	  $sql .= "PRIMARY KEY (`seller_group_id`) ";
	  $sql .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ; ";
	  $this->db->query($sql);
    
    $sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "seller_group_description` ( ";
	  $sql .= "`seller_group_id` int(11) NOT NULL, ";
	  $sql .= "`language_id` int(11) NOT NULL, ";
	  $sql .= "`name` varchar(32) NOT NULL, ";
	  $sql .= "`description` text NOT NULL, ";
	  $sql .= "PRIMARY KEY (`seller_group_id`,`language_id`) ";
	  $sql .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 ; ";
	  $this->db->query($sql);
    
    $this->db->query("INSERT INTO `" . DB_PREFIX . "seller_group` SET `seller_group_id` = '1', `approval` = '0', `sort_order` = '1', `prodlimit` = '10', `imglimit` = '100', `downloadlimit` = '100'");
    
    $this->db->query("INSERT INTO `" . DB_PREFIX . "seller_group_description` SET `seller_group_id` = '1', `language_id` = '1', `name` = 'Default', `description` = 'test'");
	
	}
}