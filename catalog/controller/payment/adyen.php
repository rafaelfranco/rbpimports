<?php
class ControllerPaymentAdyen extends Controller {

    protected function index() {
        $this->language->load('payment/adyen');

        $this->data['text_barra'] = $this->language->get('text_barra');
        $this->data['text_teste'] = $this->language->get('text_teste');
        $this->data['text_pagamento'] = $this->language->get('text_pagamento');
        $this->data['text_info'] = $this->language->get('text_info');
        $this->data['text_wait'] = $this->language->get('text_wait');
        $this->data['text_cartao_visa'] = $this->language->get('text_cartao_visa');
        $this->data['text_cartao_visa_e'] = $this->language->get('text_cartao_visa_e');
        $this->data['text_cartao_mstercard'] = $this->language->get('text_cartao_mastercard');
        $this->data['text_cartao_diners'] = $this->language->get('text_cartao_diners');
        $this->data['text_cartao_amex'] = $this->language->get('text_cartao_amex');
        $this->data['text_cartao_discover'] = $this->language->get('text_cartao_discover');
        $this->data['text_cartao_elo'] = $this->language->get('text_cartao_elo');
        $this->data['entry_cc_owner'] = $this->language->get('entry_cc_owner');
        $this->data['entry_cc_number'] = $this->language->get('entry_cc_number');
        $this->data['entry_cc_expire_date'] = $this->language->get('entry_cc_expire_date');
        $this->data['entry_cc_cvv2'] = $this->language->get('entry_cc_cvv2');
        
        $meses = array('January'=>'Janeiro',
                        'February'=>'Fevereiro',
                        'March'=>'Março',
                        'April'=>'Abril',
                        'May'=>'Maio',
                        'June'=>'Junho',
                        'July'=>'Julho',
                        'August'=>'Agosto',
                        'September'=>'Setembro',
                        'October'=>'Outubro',
                        'November'=>'Novembro',
                        'December'=>'Dezembro');
        
        $this->data['months'] = array();

        for ($i = 1; $i <= 12; $i++) {
            $this->data['months'][] = array(
                'text' => $meses[strftime('%B', mktime(0, 0, 0, $i, 1, 2000))],
                'value' => sprintf('%02d', $i)
            );
        }

        $today = getdate();

        $this->data['year_expire'] = array();

        for ($i = $today['year']; $i < $today['year'] + 11; $i++) {
            $this->data['year_expire'][] = array(
                'text' => strftime('%Y', mktime(0, 0, 0, 1, 1, $i)),
                'value' => strftime('%Y', mktime(0, 0, 0, 1, 1, $i))
            );
        }

        $this->data['teste'] = $this->config->get('adyen_teste');

        $this->data['button_confirm'] = $this->language->get('button_confirm');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/adyen.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/payment/adyen.tpl';
        } else {
            $this->template = 'default/template/payment/adyen.tpl';
        }

        $this->render();
    }

    public function confirm() {
        
    }

    function processar() {
        
        $this->load->model('checkout/order');
        
        $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
        
        ini_set("soap.wsdl_cache_enabled", "0");
        
        //Include da classe adyen
        require (DIR_APPLICATION . "controller/payment/adyen_lib/Adyen.php");
		
		if($this->config->get('adyen_teste') == 1){
			$system = "test"; // "live"
		}else{
			$system = "live"; // "live"
		}
		
		$merchantAccount = $this->config->get('adyen_afiliacao');
		$login = $this->config->get('adyen_login');
		$password = str_replace(' ','+',html_entity_decode(urldecode($this->config->get('adyen_password'))));
		
		$amount = array ("value" => $this->frmPreco(urlencode($this->currency->format($order_info['total'], $order_info['currency_code'], 1.00000, false))),"currency" => 'BRL');
	
		$cartao = array ("cvc" => $this->request->post['cc_cvv2'], "expiryMonth" => $this->request->post['cc_expire_date_month'], "expiryYear" => $this->request->post['cc_expire_date_year'], "holderName" => strtoupper($this->request->post['cc_owner']), "number" => $this->request->post['cc_number']);
		
		$parcelamento = array ("value" => $this->request->post['parcelas']);
		
		$endereco = array ("city" => $order_info['payment_city'], "country" => "BR", "houseNumberOrName" => "", "postalCode" => $order_info['payment_postcode'], "stateOrProvince" => "", "street" => $order_info['payment_address_1']);
		
		$order = $this->session->data['order_id'];
		
		$debug = FALSE;
		
		$reference = "Pedido " . $this->session->data['order_id'] . ' ' . time();
		
		//Instacia a classe
		$a = new Adyen( $login, $password, $system, $debug);
		
		//Envia a requisição de autorização de cartão de crédito
		$result = $a->authorise( $amount, $cartao, $reference, $order, $parcelamento, $endereco, $merchantAccount);
		
		//Cria um array para usar com o json
        $json = array();
        
        $message = '';
		
		//Verifica a Resposta
  	    if ( $result->paymentResult->resultCode == "Authorised" ) {
			//Cartão aprovado
			if (isset($result->paymentResult->authCode)) {
				$message .= 'authCode: ';
				
				$message .= (string) $result->paymentResult->authCode . "\n";
			}
			
			if (isset($result->paymentResult->pspReference)) {
				$message .= 'pspReference: ';
				
				$message .= (string) $result->paymentResult->pspReference . "\n";
			}
			
			if (isset($result->paymentResult->resultCode)) {
				$message .= 'resultCode: ';
				
				$message .= (string) $result->paymentResult->resultCode . "\n";
			}
			
			$message .= 'Cartão de Crédito: ';

			if (isset($this->request->post['bandeira'])) {
				$message .= (string) strtoupper($this->request->post['bandeira']) . "\n";
			}
			
			$message .= 'Parcelado em: ';

			if (isset($this->request->post['parcelas'])) {
				$message .= (string) $this->request->post['parcelas'] . ' x'  . "\n";
			}
			
			$message_pagamento = '';

			if (isset($this->request->post['bandeira'])) {
				$message_pagamento .= (string) strtoupper($this->request->post['bandeira']) . " ";
			}

			if (isset($this->request->post['parcelas'])) {
				$message_pagamento .= (string) $this->request->post['parcelas'] . "X";
			}
			
			$this->db->query("UPDATE `" . DB_PREFIX . "order` SET payment_method = '".$message_pagamento."' WHERE order_id = ".$this->session->data['order_id']."");
			
			$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('adyen_aprovado_id'));

            $this->model_checkout_order->update($this->session->data['order_id'], $this->config->get('adyen_aprovado_id'), $message, false);

            $json['success'] = $this->url->link('checkout/success', '', 'SSL');
            $json['status_pagamento'] = 'sucesso';
			
	    } elseif($result->paymentResult->refusalReason) {
			$message .= 'refusalReason: ';
			$json['status_pagamento'] = 'negado';

			$message .= (string) $result->paymentResult->refusalReason . "\n";
			
            if($result->paymentResult->refusalReason == trim('101 Invalid card number')) {
                $json['status_pagamento'] = 'negado_card_number';
            }
            if($result->paymentResult->refusalReason == trim('Blocked Card')) {
                $json['status_pagamento'] = 'negado_blocked';
            }
            if($result->paymentResult->refusalReason == trim('103 CVC is not the right length')) {
                $json['status_pagamento'] = 'negado_cvc';
            }
            if($result->paymentResult->refusalReason == trim('Invalid Amount')) {
                $json['status_pagamento'] = 'negado_amount';
            }

			$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('adyen_nao_aprovado_id'));

			$this->model_checkout_order->update($this->session->data['order_id'], $this->config->get('adyen_nao_aprovado_id'), $message, false);
            
            $json['success'] = $this->url->link('payment/adyen_message');
            
			
	    } else {
			$message .= 'Erro não especificado';
				
			$message .= (string) "\n";
			
			$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('adyen_nao_aprovado_id'));

			$this->model_checkout_order->update($this->session->data['order_id'], $this->config->get('adyen_nao_aprovado_id'), $message, false);
            
            $json['success'] = $this->url->link('payment/adyen_message');
            $json['status_pagamento'] = 'erro';
	    }
		
		$this->response->setOutput(json_encode($json));    
    }
    
    function frmPreco($preco) {
        //$preco = str_replace('.','',$preco);
        if(!$preco)
        	return '000';
        $preco = str_replace(',','.',$preco);
        $preco = str_replace('.','',$preco);
        
        //return number_format($preco, '2', ',', '.');
        return $preco;
    }

    function parcelamento() {
        if (isset($this->request->get['bandeira'])) {
            $bandeira = $this->request->get['bandeira'];
        } else {
            $bandeira = 0;
        }

        if (isset($this->request->get['parcelas'])) {
            $maximo_parcelas = $this->request->get['parcelas'];
        } else {
            $maximo_parcelas = 0;
        }

        $this->load->model('checkout/order');
        $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
        $valor = str_replace(',', '', number_format($order_info['total'], 2));

        $parcelas_sem_juros = $this->config->get('adyen_cartao_semjuros');

        $juros = $this->config->get('adyen_cartao_juros');

        $parcela_minima = $this->config->get('adyen_cartao_minimo');
		
		$max_parcelas = $this->config->get('adyen_'.$this->request->get['bandeira'].'_parcelas');
        
        $html = '<select name="parcelas" id="parcelas" class="selecto">';

        if ($bandeira != 0 || $bandeira != 'visae') {
            if ($this->config->get('adyen_parcelamento') == "1") {
                $html .= '<option value="1">Cartão de Crédito '.strtoupper($bandeira).' - 1x de ' . number_format($valor, 2, ',', '.') . ' sem juros.</option>';

                for ($p = 2; $p <= $max_parcelas; $p++) {

                    if ($p <= $parcelas_sem_juros) {
                        $valor_parcela = $valor / $p;
                    }

                    if ($p > $parcelas_sem_juros) {
                        $valor_parcela = ($valor * pow(1 + ($juros / 100), $p)) / $p;
                    }

                    if ($valor_parcela >= $parcela_minima) {
                        
                        if ($parcelas_sem_juros < $p) {
                            //$juros = number_format($juros, 2, ',', '.');
                            $j = 'com juros (' . $juros . '% ao mês).';
                        }else{
                            $j = 'sem juros.';
                        }
                        
                        if ($p <= $parcelas_sem_juros) {
                            $html .= '<option value="'.$p.'">Cartão de Crédito '.strtoupper($bandeira).' - '.$p.'x de ' . number_format($valor_parcela, 2, ',', '.') . ' '.$j.'';
                        } else { 
                            $html .= '<option value="'.$p.'">Cartão de Crédito '.strtoupper($bandeira).' - '.$p.'x de ' . number_format($valor_parcela, 2, ',', '.') . ' '.$j.'';
                        }
                    } else {
                        echo '<span style="font-size: smaller;">Parcela mínima de ' . number_format($parcela_minima, 2, ',', '.') . '.</span>';
                        break;
                    }
                }
            } else if ($this->config->get('adyen_parcelamento') == "2") {
                $html .= '<option value="1">Cartão de Crédito '.strtoupper($bandeira).' - 1x de ' . number_format($valor, 2, ',', '.') . ' sem juros.</option>';

                for ($p = 2; $p <= $maximo_parcelas; $p++) {
                    $html .= '<option value="'.$p.'">Cartão de Crédito '.strtoupper($bandeira).' - '.$p.'x (a consultar)';
                }
            }
        } else if ($bandeira != 0 || $bandeira == 'visae') {
            $html .= '<option value="1">Cartão de Débito - 1x de ' . number_format($valor, 2, ',', '.') . '.</option>';
        }
        
        $html .= '</select>';
        
        echo $html;
    }

}
?>