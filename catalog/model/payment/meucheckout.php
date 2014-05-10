<?php
class ModelPaymentmeucheckout extends Model
{
    /**
     * getMethod
     *
     * @access public
     * @return array Array contendo dados de configuração do módulo
     */
    public function getMethod()
    {
		$this->load->language('payment/meucheckout');
        $method_data = array( 
                'code'       => 'meucheckout',
                'title'      => $this->language->get('text_title'),
                'sort_order' => $this->config->get('meucheckout_sort_order')
                );
    	return $method_data;
    }

    /**
     * getCart
     *
     * Recupera os dados do carrinho contidos na session e seleciona
     * os dados dos produtos adicionados a este carrinho.
     * @access public
     * @return array Array com os dados dos produtos
     */
    public function getCart()
    {
		$this->load->model('catalog/product');
		$this->load->model('checkout/order');
		$order = $this->model_checkout_order->getOrder($this->session->data['order_id']);

		foreach ($this->cart->getProducts() as $product) {
      		$option_data = array();
      		
      		foreach ($product['option'] as $option) {
        		$option_data[] = array(
          			'name'   => $option['name'],
          			'price'  => $option['price'],
          			'value'  => $option['option_value'],
					'prefix' => $option['price_prefix']
        		);
      		}
 
      		$product_data[] = array(
            'product_id' => $product['product_id'],
            'name'       => $product['name'],
            'model'      => $product['model'],
            'option'     => $option_data,
            'download'   => $product['download'],
            'quantity'   => $product['quantity'], 
            'price'      => $product['price'],
            'total'      => $product['total'], 
			'weight'     => $product['weight'], 
            'tax'        => $product['tax_class_id']
      		); 
    	}

        return array($order, $product_data);
    }
}
