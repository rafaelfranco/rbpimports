<?php
	class ModelModuleRfnewsletter extends Model {
		public function save($name,$email) {
			$this->db->query("INSERT INTO `rfnewsletter` (`id`, `name`, `email`) VALUES (null, '$name', '$email');");
		}
	}
?>