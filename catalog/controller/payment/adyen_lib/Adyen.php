<?
class Adyen {
	var $client;
	var $DEBUG;
	var $last_response;

	function Adyen($login, $password, $host ="live", $debug=FALSE ) {
		$this->DEBUG = $debug;

		//Modificação realizada via N49 05/12/2013
		//$this->client = new SoapClient( "https://pal-$host.adyen.com/pal/Payment.wsdl",
		$this->client = new SoapClient( "http://www.rbpimports.com.br/loja/Payment.wsdl",
		  array(
		    "location" => "https://pal-$host.adyen.com/pal/servlet/soap/Payment",
		    "login" => $login,
		    "password" => $password,
		    'trace' => 1,
		    'soap_version' => SOAP_1_1,
		    'style' => SOAP_DOCUMENT,
		    'encoding' => SOAP_LITERAL
		  )
		);
	}

/*
	function authorise($valores,$cartao,$referencia,$pedido,$parcelas,$endereco,$merchantAccount) {
		$response = $this->client->authorise( array(
		  "paymentRequest" => array 
		  (
		    "amount" => $valores,
			"card" => $cartao, 
			"installments" => $parcelas,
			"merchantAccount" => $merchantAccount,
			"reference" => $referencia, 
			"billingAddress" => $endereco, 
			"OrderReference" => $pedido, 
			//"deliveryAddress" => $endereco
			)
	      )
	    );

	    return $response;
	}
*/
	function authorise($valores,$cartao,$referencia,$pedido,$parcelas,$endereco,$merchantAccount) {
		if(!isset($parcelas) || $parcelas == 0){
			return false;
		}
		$response = $this->client->authorise( array(
		  "paymentRequest" => array 
		  (
		    "amount" => $valores,
			"card" => $cartao, 
			"installments" => $parcelas,
			"merchantAccount" => $merchantAccount,
			"reference" => $referencia, 
			"billingAddress" => $endereco, 
			"OrderReference" => $pedido, 
			//"deliveryAddress" => $endereco
			)
		)
	    );

	    return $response;
	}
	
	//NÃ£o implementada ainda
	function capture($amount,$currencyCode,$authorisationCode,$reference,$originalReference) {
		global $merchantAccount;

		$response = $this->client->capture( array(
			  "modificationRequest" => array 
			  (
				  "modificationAmount" => array (
					"value" => $amount,
					"currency" => $currencyCode),
				  "merchantAccount" => $merchantAccount,
				  "reference" => $reference, 
				  "authorisationCode" => $authorisationCode, 
				  "originalReference" => $originalReference
			  )
	      )
	    );
		
		echo '<pre>';
		print_r($response);
		echo '</pre>';
	
	    return $response;
	}
};

?>
