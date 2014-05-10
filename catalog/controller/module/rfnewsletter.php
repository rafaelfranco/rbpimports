<?php  
class ControllerModuleRfnewsletter extends Controller {
	protected function index() {
		$this->language->load('module/rfnewsletter');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
    	$this->data['name'] = $this->language->get('name');
    	$this->data['email'] = $this->language->get('email');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/rfnewsletter.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/rfnewsletter.tpl';
		} else {
			$this->template = 'default/template/module/rfnewsletter.tpl';
		}
		
		$this->render();
	}
	public function save() {
		//load model
		$this->load->model('module/rfnewsletter');
		//save data
		$this->model_module_rfnewsletter->save($_REQUEST['name'],$_REQUEST['email']);

		//show sucess message
		$this->language->load('module/rfnewsletter');
		echo $this->language->get('success');
		
	}
}
?>