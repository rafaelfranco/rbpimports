<?php

class ControllerModuleFelipoParcelamento extends Controller {

    private $error = array();

    public function index() {

        $this->load->model('localisation/currency');
        // $currency_total = $this->model_localisation_currency->getTotalCurrencies();

        $this->data['moedas'] = $this->model_localisation_currency->getCurrencies();

        $this->language->load('module/felipo_parcelamento');

        $this->document->setTitle($this->language->get('heading_title_main'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('felipo_parcelamento', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $this->data['heading_title'] = $this->language->get('heading_title_modulo');
        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_info'] = $this->language->get('text_info');
        $this->data['text_info2'] = $this->language->get('text_info2');
        $this->data['text_feito'] = $this->language->get('text_feito');
        $this->data['text_ativa'] = $this->language->get('text_ativa');
        $this->data['text_configuracao'] = $this->language->get('text_configuracao');
        $this->data['entry_aviso_frete'] = $this->language->get('entry_aviso_frete');
        $this->data['entry_ativo'] = $this->language->get('entry_ativo');
        $this->data['entry_opcao'] = $this->language->get('entry_opcao');
        $this->data['entry_atualizar'] = $this->language->get('entry_atualizar');
        $this->data['entry_ativo_parcelamento'] = $this->language->get('entry_ativo_parcelamento');
        $this->data['entry_boleto_ativo'] = $this->language->get('entry_boleto_ativo');
        $this->data['entry_boleto_desconto'] = $this->language->get('entry_boleto_desconto');
        $this->data['entry_maximo_parcela'] = $this->language->get('entry_maximo_parcela');
        $this->data['entry_parcela_minima'] = $this->language->get('entry_parcela_minima');
        $this->data['entry_parcela_sem_juros'] = $this->language->get('entry_parcela_sem_juros');
        $this->data['entry_juros'] = $this->language->get('entry_juros');
        $this->data['entry_moeda_loja'] = $this->language->get('entry_moeda_loja');
        $this->data['entry_texto_cartao'] = $this->language->get('entry_texto_cartao');
        $this->data['entry_texto_boleto'] = $this->language->get('entry_texto_boleto');
        $this->data['entry_cartao'] = $this->language->get('entry_cartao');
        $this->data['entry_boleto'] = $this->language->get('entry_boleto');
        $this->data['entry_texto_frete'] = $this->language->get('entry_texto_frete');
        $this->data['entry_css'] = $this->language->get('entry_css');


        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/felipo_parcelamento', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['action'] = $this->url->link('module/felipo_parcelamento', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        $this->load->model('localisation/order_status');
        $this->data['status'] = $this->model_localisation_order_status->getOrderStatuses();


        if (isset($this->request->post['modulo_felipo_parcelamento'])) {
            $this->data['dados'] = $this->request->post['modulo_felipo_parcelamento'];
        } else {
            $this->data['dados'] = $this->config->get('modulo_felipo_parcelamento');
        }

        $this->template = 'module/felipo_parcelamento.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/felipo_parcelamento')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

}
?>