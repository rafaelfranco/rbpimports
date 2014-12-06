<?php
class Mail {
	protected $to;
	protected $from;
	protected $sender;
	protected $subject;
	protected $text;
	protected $html;
	protected $attachments = array();
	public $protocol = 'mail';
	public $hostname;
	public $username;
	public $password;
	public $port = 25;
	public $timeout = 5;
	public $newline = "\n";
	public $crlf = "\r\n";
	public $verp = false;
	public $parameter = '';

	public function setTo($to) {
		$this->to = $to;
	}

	public function setFrom($from) {
		$this->from = $from;
	}

	public function setSender($sender) {
		$this->sender = $sender;
	}

	public function setSubject($subject) {
		$this->subject = $subject;
	}

	public function setText($text) {
		$this->text = $text;
	}

	public function setHtml($html) {
		$this->html = $html;
	}

	public function addAttachment($filename) {
		$this->attachments[] = $filename;
	}

	
				
				//Code Market - Mandrill API
				//Configurações
				//Informe a API Key do Mandril de usa conta (única configuração obrigatória)
				public $api_key = 'AWqiXBhElMTZO7Vcgqg08A';
				//Use true para habilitar ou false para desabilitar, recomendamos deixar habilitado para acompanhar os e-mails  abertos e links clicados
				public $verificar_aberto = 'true';
				public $verificar_clique = 'true';
				//Opcional,apenas se tiver IP Dedicado
				public $ip_dedicado = '';
				//Informe uma Tag para saber que a mensagem foi enviada da loja, pode ser o nome dela ou deixe em branco, caso queira usar mais de uma tag, separe por virgula
				public $tags = array('');
				//Metadata é parecido com a tag, no caso pode por o mesmo valor, por padrão recomendamos a loja ou deixe em branco, serve para filtrar depois os e-mails
				public $metadata = array('');

				//Google
				//Deixe em branco ou para mais detalhes de como adicionar os dados - http://help.mandrill.com/entries/21814166-How-do-I-add-Google-Analytics-tracking-to-my-links-
				public $google_dominios = array('');
				public $google_campanhas = array('');

				//true ou false, envia as imagens em background, ou seja, o sistema retorna normal enquanto as mensagens são enviadas, sem precisar esperar. É ativo automaticamente para
				//mais  de 10 destinatários
				public $assincrono = 'true';

				//Não recomendamos editar, vai servir para complementos e serão modificados de forma automática com base nos dados
				public $metadata_clientes = array('');
				public $dados = array('');
				public $dados_clientes = array('');
				protected $template_nome;
				protected $template_dados;
				protected $nomes;
				protected $envio = '1';
				public $data_envio;

				//handlebars ou mailchimp
				public $tema_engine = 'mailchimp';

				//Fim Configurações Mandrill

				//Mandrill
				public function setNomes($nomes) {
					$this->nomes = $nomes;
				}

				public function setAPI($api) {
					$this->api_key = $api;
				}

				public function setVerificarAberto($aberto) {
					$this->verificar_aberto = $aberto;
				}

				public function setVerificarClique($clique) {
					$this->verificar_clique = $clique;
				}

				public function setIP($ip) {
					$this->ip_dedicado = $ip;
				}

				public function setDados($dados) {
					$this->dados = $dados;
				}

				public function setDadosClientes($dados_clientes) {
					$this->dados_clientes = $dados_clientes;
				}

				public function setTags($tags) {
					$this->tags = $tags;
				}

				public function setMetadata($metadata) {
					$this->metadata = $metadata;
				}

				public function setMetadataClientes($metadata_clientes) {
					$this->metadata_clientes = $metadata_clientes;
				}

				public function setGoogleDominios($google_dominios) {
					$this->google_dominios = $google_dominios;
				}

				public function setGoogleCampanhas($google_campanhas) {
					$this->google_campanhas = $google_campanhas;
				}

				public function setTemplateNome($template_nome) {
					$this->template_nome = $template_nome;
				}

				public function setTemplateDados($template_dados) {
					$this->template_dados = $template_dados;
				}

				public function setTemaEngine($tema_engine) {
					$this->tema_engine = $tema_engine;
				}

				public function setDataEnvio($data_envio) {
					$this->data_envio = $data_envio;
				}

				public function setEnvio($envio) {
					$this->envio = $envio;
				}

				public function send(){
					//Verificações
					if (!$this->to) {
						trigger_error('Error: E-Mail to required!');
						exit();
					}

					if (!$this->from) {
						trigger_error('Error: E-Mail from required!');
						exit();
					}

					if (!$this->sender) {
						trigger_error('Error: E-Mail sender required!');
						exit();
					}

					if (!$this->subject) {
						trigger_error('Error: E-Mail subject required!');
						exit();
					}

					if ((!$this->text) && (!$this->html)) {
						trigger_error('Error: E-Mail message required!');
						exit();
					}

					if (is_array($this->to)) {
						$to = implode(',', $this->to);
					} else {
						$to = $this->to;
					}

					require_once(VQMod::modCheck(DIR_SYSTEM . 'library/mandrill/src/Mandrill.php'));
					try {
						if(empty($this->html)){
							$html = '';
						} else {
							$html = $this->html;
						}

						if(empty($this->text)){
							$text = '';
						}else {
							$text = $this->text;
						}

						//Enviar Para
						$emails = explode(',',$to);

						if(!empty($this->nomes)){
							$nomes = explode(',',$this->nomes);
						}else {
							$nomes = '';
						}

						for ($i = 0; $i < count($emails); $i++) {
							if(!empty($nomes[$i])){
								$nome = $nomes[$i];
							}else {
								$nome = '';
							}

							$enviar_para[] = array(
								'email' => $emails[$i],
								'name' => $nome,
								'type' => 'to'
							);
						}

						$mandrill = new Mandrill($this->api_key);
						$mensagem = array(
							'html' => $html,
							'text' => $text,
							'subject' => $this->subject,
							'from_email' => $this->from,
							'from_name' => $this->sender,
							'to' => $enviar_para,
							'headers' => array('Reply-To' => $this->from),
							'track_opens' => $this->verificar_aberto,
							'track_clicks' => $this->verificar_clique,
							'google_analytics_domains' => $this->google_dominios,
							'google_analytics_campaign' => $this->google_campanhas,
							'tags' => $this->tags,
							'merge_language' => $this->tema_engine,
							'global_merge_vars' => $this->dados,
							'merge_vars' => $this->dados_clientes,
							'metadata' => $this->metadata,
							'recipient_metadata' => $this->metadata_clientes
						);

						//Envio
						//1 = Padrão sem template nome, dados e sem ip dedicado
						//2 = Padrão com template nome, dados e ip dedicado

						//Alternativas
						//3 = Padrão com template nome e dados
						//4 = Padrão com template nome e ip dedicado
						//5 = Padrão com template dados e ip  dedicado
						//6 = Padrão com ip dedicado
						switch ($this->envio) {
							case 1:
							$mandrill->messages->send($mensagem, $this->assincrono, $this->data_envio);
							break;
							case 2:
							$mandrill->messages->send($this->template_nome, $this->template_dados, $mensagem, $this->assincrono, $this->ip_dedicado, $this->data_envio);
							break;
							case 3:
							$mandrill->messages->send($this->template_nome, $this->template_dados, $mensagem, $this->assincrono, $this->data_envio);
							break;
							case 4:
							$mandrill->messages->send($this->template_nome, $mensagem, $this->assincrono, $this->ip_dedicado, $this->data_envio);
							break;
							case 5:
							$mandrill->messages->send($this->template_dados, $mensagem, $this->assincrono, $this->ip_dedicado, $this->data_envio);
							break;
							case 6:
							$mandrill->messages->send($mensagem, $this->assincrono, $this->ip_dedicado, $this->data_envio);
							break;
						}

					} catch(Mandrill_Error $e) {
						// Mandrill errors are thrown as exceptions
						echo 'Ocorreu um erro ao enviar o E-mail: ' . get_class($e) . ' - ' . $e->getMessage();
						// A mandrill error occurred: Mandrill_Unknown_Subaccount - No subaccount exists with the id 'customer-123'
						throw $e;
					}
				}

				public function send_desativado() {
				
			
		if (!$this->to) {
			trigger_error('Error: E-Mail to required!');
			exit();			
		}

		if (!$this->from) {
			trigger_error('Error: E-Mail from required!');
			exit();					
		}

		if (!$this->sender) {
			trigger_error('Error: E-Mail sender required!');
			exit();					
		}

		if (!$this->subject) {
			trigger_error('Error: E-Mail subject required!');
			exit();					
		}

		if ((!$this->text) && (!$this->html)) {
			trigger_error('Error: E-Mail message required!');
			exit();					
		}

		if (is_array($this->to)) {
			$to = implode(',', $this->to);
		} else {
			$to = $this->to;
		}

		$boundary = '----=_NextPart_' . md5(time());

		$header = '';
		
		$header .= 'MIME-Version: 1.0' . $this->newline;
		
		if ($this->protocol != 'mail') {
			$header .= 'To: ' . $to . $this->newline;
			$header .= 'Subject: ' . $this->subject . $this->newline;
		}
		
		$header .= 'Date: ' . date('D, d M Y H:i:s O') . $this->newline;
		$header .= 'From: ' . '=?UTF-8?B?' . base64_encode($this->sender) . '?=' . ' <' . $this->from . '>' . $this->newline;
		$header .= 'Reply-To: ' . '=?UTF-8?B?' . base64_encode($this->sender) . '?=' . ' <' . $this->from . '>' . $this->newline;
		$header .= 'Return-Path: ' . $this->from . $this->newline;
		$header .= 'X-Mailer: PHP/' . phpversion() . $this->newline;
		$header .= 'Content-Type: multipart/related; boundary="' . $boundary . '"' . $this->newline . $this->newline;

		if (!$this->html) {
			$message  = '--' . $boundary . $this->newline;
			$message .= 'Content-Type: text/plain; charset="utf-8"' . $this->newline;
			$message .= 'Content-Transfer-Encoding: 8bit' . $this->newline . $this->newline;
			$message .= $this->text . $this->newline;
		} else {
			$message  = '--' . $boundary . $this->newline;
			$message .= 'Content-Type: multipart/alternative; boundary="' . $boundary . '_alt"' . $this->newline . $this->newline;
			$message .= '--' . $boundary . '_alt' . $this->newline;
			$message .= 'Content-Type: text/plain; charset="utf-8"' . $this->newline;
			$message .= 'Content-Transfer-Encoding: 8bit' . $this->newline . $this->newline;

			if ($this->text) {
				$message .= $this->text . $this->newline;
			} else {
				$message .= 'This is a HTML email and your email client software does not support HTML email!' . $this->newline;
			}

			$message .= '--' . $boundary . '_alt' . $this->newline;
			$message .= 'Content-Type: text/html; charset="utf-8"' . $this->newline;
			$message .= 'Content-Transfer-Encoding: 8bit' . $this->newline . $this->newline;
			$message .= $this->html . $this->newline;
			$message .= '--' . $boundary . '_alt--' . $this->newline;
		}

		foreach ($this->attachments as $attachment) {
			if (file_exists($attachment)) {
				$handle = fopen($attachment, 'r');
				
				$content = fread($handle, filesize($attachment));
				
				fclose($handle);

				$message .= '--' . $boundary . $this->newline;
				$message .= 'Content-Type: application/octet-stream; name="' . basename($attachment) . '"' . $this->newline;
				$message .= 'Content-Transfer-Encoding: base64' . $this->newline;
				$message .= 'Content-Disposition: attachment; filename="' . basename($attachment) . '"' . $this->newline;
				$message .= 'Content-ID: <' . basename(urlencode($attachment)) . '>' . $this->newline;
				$message .= 'X-Attachment-Id: ' . basename(urlencode($attachment)) . $this->newline . $this->newline;
				$message .= chunk_split(base64_encode($content));
			}
		}

		$message .= '--' . $boundary . '--' . $this->newline;

		if ($this->protocol == 'mail') {
			ini_set('sendmail_from', $this->from);

			if ($this->parameter) {
				mail($to, '=?UTF-8?B?' . base64_encode($this->subject) . '?=', $message, $header, $this->parameter);
			} else {
				mail($to, '=?UTF-8?B?' . base64_encode($this->subject) . '?=', $message, $header);
			}
		} elseif ($this->protocol == 'smtp') {
			$handle = fsockopen($this->hostname, $this->port, $errno, $errstr, $this->timeout);

			if (!$handle) {
				trigger_error('Error: ' . $errstr . ' (' . $errno . ')');
				exit();					
			} else {
				if (substr(PHP_OS, 0, 3) != 'WIN') {
					socket_set_timeout($handle, $this->timeout, 0);
				}

				while ($line = fgets($handle, 515)) {
					if (substr($line, 3, 1) == ' ') {
						break;
					}
				}

				if (substr($this->hostname, 0, 3) == 'tls') {
					fputs($handle, 'STARTTLS' . $this->crlf);

					while ($line = fgets($handle, 515)) {
						$reply .= $line;

						if (substr($line, 3, 1) == ' ') {
							break;
						}
					}

					if (substr($reply, 0, 3) != 220) {
						trigger_error('Error: STARTTLS not accepted from server!');
						exit();								
					}
				}

				if (!empty($this->username)  && !empty($this->password)) {
					fputs($handle, 'EHLO ' . getenv('SERVER_NAME') . $this->crlf);

					$reply = '';

					while ($line = fgets($handle, 515)) {
						$reply .= $line;

						if (substr($line, 3, 1) == ' ') {
							break;
						}
					}

					if (substr($reply, 0, 3) != 250) {
						trigger_error('Error: EHLO not accepted from server!');
						exit();								
					}

					fputs($handle, 'AUTH LOGIN' . $this->crlf);

					$reply = '';

					while ($line = fgets($handle, 515)) {
						$reply .= $line;

						if (substr($line, 3, 1) == ' ') {
							break;
						}
					}

					if (substr($reply, 0, 3) != 334) {
						trigger_error('Error: AUTH LOGIN not accepted from server!');
						exit();						
					}

					fputs($handle, base64_encode($this->username) . $this->crlf);

					$reply = '';

					while ($line = fgets($handle, 515)) {
						$reply .= $line;

						if (substr($line, 3, 1) == ' ') {
							break;
						}
					}

					if (substr($reply, 0, 3) != 334) {
						trigger_error('Error: Username not accepted from server!');
						exit();								
					}

					fputs($handle, base64_encode($this->password) . $this->crlf);

					$reply = '';

					while ($line = fgets($handle, 515)) {
						$reply .= $line;

						if (substr($line, 3, 1) == ' ') {
							break;
						}
					}

					if (substr($reply, 0, 3) != 235) {
						trigger_error('Error: Password not accepted from server!');
						exit();								
					}
				} else {
					fputs($handle, 'HELO ' . getenv('SERVER_NAME') . $this->crlf);

					$reply = '';

					while ($line = fgets($handle, 515)) {
						$reply .= $line;

						if (substr($line, 3, 1) == ' ') {
							break;
						}
					}

					if (substr($reply, 0, 3) != 250) {
						trigger_error('Error: HELO not accepted from server!');
						exit();							
					}
				}

				if ($this->verp) {
					fputs($handle, 'MAIL FROM: <' . $this->from . '>XVERP' . $this->crlf);
				} else {
					fputs($handle, 'MAIL FROM: <' . $this->from . '>' . $this->crlf);
				}

				$reply = '';

				while ($line = fgets($handle, 515)) {
					$reply .= $line;

					if (substr($line, 3, 1) == ' ') {
						break;
					}
				}

				if (substr($reply, 0, 3) != 250) {
					trigger_error('Error: MAIL FROM not accepted from server!');
					exit();							
				}

				if (!is_array($this->to)) {
					fputs($handle, 'RCPT TO: <' . $this->to . '>' . $this->crlf);

					$reply = '';

					while ($line = fgets($handle, 515)) {
						$reply .= $line;

						if (substr($line, 3, 1) == ' ') {
							break;
						}
					}

					if ((substr($reply, 0, 3) != 250) && (substr($reply, 0, 3) != 251)) {
						trigger_error('Error: RCPT TO not accepted from server!');
						exit();							
					}
				} else {
					foreach ($this->to as $recipient) {
						fputs($handle, 'RCPT TO: <' . $recipient . '>' . $this->crlf);

						$reply = '';

						while ($line = fgets($handle, 515)) {
							$reply .= $line;

							if (substr($line, 3, 1) == ' ') {
								break;
							}
						}

						if ((substr($reply, 0, 3) != 250) && (substr($reply, 0, 3) != 251)) {
							trigger_error('Error: RCPT TO not accepted from server!');
							exit();								
						}
					}
				}

				fputs($handle, 'DATA' . $this->crlf);

				$reply = '';

				while ($line = fgets($handle, 515)) {
					$reply .= $line;

					if (substr($line, 3, 1) == ' ') {
						break;
					}
				}

				if (substr($reply, 0, 3) != 354) {
					trigger_error('Error: DATA not accepted from server!');
					exit();						
				}

				// According to rfc 821 we should not send more than 1000 including the CRLF
				$message = str_replace("\r\n", "\n",  $header . $message);
				$message = str_replace("\r", "\n", $message);
				
				$lines = explode("\n", $message);
				
				foreach ($lines as $line) {
					$results = str_split($line, 998);
					
					foreach ($results as $result) {
						if (substr(PHP_OS, 0, 3) != 'WIN') {
							fputs($handle, $result . $this->crlf);
						} else {
							fputs($handle, str_replace("\n", "\r\n", $result) . $this->crlf);
						}							
					}
				}
				
				fputs($handle, '.' . $this->crlf);

				$reply = '';

				while ($line = fgets($handle, 515)) {
					$reply .= $line;

					if (substr($line, 3, 1) == ' ') {
						break;
					}
				}

				if (substr($reply, 0, 3) != 250) {
					trigger_error('Error: DATA not accepted from server!');
					exit();						
				}
				
				fputs($handle, 'QUIT' . $this->crlf);

				$reply = '';

				while ($line = fgets($handle, 515)) {
					$reply .= $line;

					if (substr($line, 3, 1) == ' ') {
						break;
					}
				}

				if (substr($reply, 0, 3) != 221) {
					trigger_error('Error: QUIT not accepted from server!');
					exit();						
				}

				fclose($handle);
			}
		}
	}
}
?>