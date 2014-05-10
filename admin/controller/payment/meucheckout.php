<?php
class ControllerPaymentMeucheckout extends Controller {
    private $error;

    function index() {

        $this->load->language('payment/meucheckout');
		
        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');
        
        $this->session->data['token'] = isset($this->session->data['token']) ? $this->session->data['token'] : '';
            
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {

            $this->load->model('setting/setting');

            $this->model_setting_setting->editSetting('meucheckout', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect(HTTPS_SERVER . 'index.php?route=extension/payment&token=' . $this->session->data['token']);
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),            
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_payment'),
            'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('payment/meucheckout', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        
        $langs = array(
                'heading_title', 'text_payment', 'text_success',
                'text_enabled', 'text_disabled', 'button_cancel',
                'button_save', 'lb_convenio', 'lb_msg', 'lb_dias', 'lb_sort_order',
                'lb_status', 'entry_order_status'
        );

        foreach ($langs as $item) {
            $this->data[$item] = $this->language->get($item);
        }

        foreach (array('convenio', 'sort_order', 'status', 'order_status_id', 'target') as $item) {
            if (isset($this->request->post['meucheckout_'.$item])) {
                $this->data["meucheckout_$item"] = $this->request->post["meucheckout_$item"];
            } else {
                $this->data["meucheckout_$item"] = $this->config->get("meucheckout_$item");
            }
        }

		$this->load->model('localisation/order_status');		
		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

        $this->data['action'] = HTTPS_SERVER . 'index.php?route=payment/meucheckout&token=' . $this->session->data['token'];

        $this->data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/payment&token=' . $this->session->data['token'];

        if (isset($this->error['error_warning']))
            $this->data['error_warning'] = @$this->error['warning'];
        else
            $this->data['error_warning'] = '';
        if (isset($this->error['error_convenio']))
            $this->data['error_convenio'] = @$this->error['error_convenio'];
        else
            $this->data['error_convenio'] = '';

        $this->id       = 'content';
        $this->template = 'payment/meucheckout.tpl';
        $this->children = array(
                'common/header',
                'common/footer'
        );

        $this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
    }

    public function validate() {
        if (!$this->user->hasPermission('modify', 'payment/meucheckout')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->request->post['meucheckout_convenio']) {
            $this->error['error_convenio'] = $this->language->get('error_convenio');
        }

        if (!$this->error) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
}
