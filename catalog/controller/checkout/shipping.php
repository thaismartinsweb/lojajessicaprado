<?php
class ControllerCheckoutShipping extends Controller {
	public function index() {
		if ($this->config->get('shipping_status') && $this->config->get('shipping_estimator') && $this->cart->hasShipping()) {
			$this->load->language('checkout/shipping');

			$data['heading_title'] = $this->language->get('heading_title');

			$data['text_shipping'] = $this->language->get('text_shipping');
			$data['text_shipping_method'] = $this->language->get('text_shipping_method');
			$data['text_select'] = $this->language->get('text_select');
			$data['text_none'] = $this->language->get('text_none');
			$data['text_loading'] = $this->language->get('text_loading');

			$data['entry_country'] = $this->language->get('entry_country');
			$data['entry_zone'] = $this->language->get('entry_zone');
			$data['entry_postcode'] = $this->language->get('entry_postcode');

			$data['button_quote'] = $this->language->get('button_quote');
			$data['button_shipping'] = $this->language->get('button_shipping');
			$data['button_cancel'] = $this->language->get('button_cancel');

			$this->session->data['shipping_address']['country_id'] = '30';
			$this->session->data['shipping_address']['zone_id'] = '464';
			
			if (isset($this->session->data['shipping_address']['country_id'])) {
				$data['country_id'] = $this->session->data['shipping_address']['country_id'];
			} else {
				$data['country_id'] = $this->config->get('config_country_id');
			}

			$this->load->model('localisation/country');

			$data['countries'] = $this->model_localisation_country->getCountries();

			if (isset($this->session->data['shipping_address']['zone_id'])) {
				$data['zone_id'] = $this->session->data['shipping_address']['zone_id'];
			} else {
				$data['zone_id'] = '';
			}

			if (isset($this->session->data['shipping_address']['postcode'])) {
				$data['postcode'] = $this->session->data['shipping_address']['postcode'];
			} else {
				$data['postcode'] = '';
			}

			if (isset($this->session->data['shipping_method'])) {
				$data['shipping_method'] = $this->session->data['shipping_method']['code'];
			} else {
				$data['shipping_method'] = '';
			}

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/shipping.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/checkout/shipping.tpl', $data);
			} else {
				return $this->load->view('default/template/checkout/shipping.tpl', $data);
			}
		}
	}	
	
	public function quote(){

		$this->load->language('checkout/shipping');
		$this->load->model('localisation/country');
		$this->load->model('localisation/zone');
		
		$country_id = '30';
		$zone_id = '464';
		
		$country_info = $this->model_localisation_country->getCountry($country_id);
		$this->tax->setShippingAddress($country_id, $zone_id);

		$country = $country_info['name'];
		$iso_code_2 = $country_info['iso_code_2'];
		$iso_code_3 = $country_info['iso_code_3'];
		$address_format = $country_info['address_format'];	
		
		
		$zone_info = $this->model_localisation_zone->getZone($zone_id);
		
		$zone = $zone_info['name'];
		$zone_code = $zone_info['code'];

		$this->session->data['shipping_address'] = array(
				'firstname'      => '',
				'lastname'       => '',
				'company'        => '',
				'address_1'      => '',
				'address_2'      => '',
				'postcode'       => $this->request->post['postcode'],
				'city'           => '',
				'zone_id'        => $zone_id,
				'zone'           => $zone,
				'zone_code'      => $zone_code,
				'country_id'     => $country_id,
				'country'        => $country,
				'iso_code_2'     => $iso_code_2,
				'iso_code_3'     => $iso_code_3,
				'address_format' => $address_format
		);
		
		// Código de serviços
		/* 41106: PAC
		 * 40010: SEDEX
		 * 40045: SEDEX a Cobrar
		 * 40215: SEDEX 10 */
		$servico = 41106;
		
		// CEP's
		$cep['origem'] = '03952020';
		$cep['destino'] = $this->request->post['postcode'];
		
		// Infos do Produto
		$produto['peso'] = '2.5';
		$produto['valor'] = '4.00';
		$produto['altura'] = '20';
		$produto['largura'] = '20';
		$produto['comprimento'] = '20';
		
		// URL do WebService
		$correios= "http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?";
		$correios .= "nCdEmpresa=&sDsSenha=&sCepOrigem=".$cep['origem']."&sCepDestino=".$cep['destino'];
		$correios .= "&nVlPeso=".$produto['peso']."&nCdFormato=1&nVlComprimento=".$produto['comprimento'];
		$correios .= "&nVlAltura=".$produto['altura']."&nVlLargura=".$produto['largura']."&sCdMaoPropria=n";
		$correios .= "&nVlValorDeclarado=".$produto['valor']."&sCdAvisoRecebimento=n";
		$correios .= "&nCdServico=".$servico."&nVlDiametro=0&StrRetorno=xml";
		
		// Carrega o XML de Retorno
		$xml = simplexml_load_file($correios);
		
		if($xml->cServico->Erro == '0'){
			$quote["interno"] = array (	"code" => "interno.interno",
					"title" => "Frete por Região",
					"cost" => "".$xml->cServico->Valor,
					"tax_class_id" => "0",
					"text" => "R$".$xml->cServico->Valor);
			
			$error = "";
			$json['redirect'] = $this->url->link('checkout/cart');
		} else {
			$quote["interno"] = array ();
			$error = "Erro Interno dos Serviços de Frete";
			$json['warning'] = $error;
		}

		$quote_data["interno"] = array(
				'title'      => "Frete por Região",
				'quote'      => $quote,
				'sort_order' => 1,
				'error'      => $error
		);
		
		
		$this->session->data['shipping_methods'] = $quote_data;
		$this->session->data['shipping_method'] = $this->session->data['shipping_methods']["interno"]['quote']["interno"];
		$this->session->data['success'] = $this->language->get('text_success');

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

}