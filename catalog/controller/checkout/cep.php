<?php
class ControllerCheckoutCep extends Controller {
	public function search() {
		$this->load->language('checkout/checkout');
		
		$json = array();
		
		if(!isset($this->request->post['postcode']) || (utf8_strlen($this->request->post['postcode']) < 8)){
			$json['error'] = $this->language->get('error_postcode');
		} else {
		
			$url = 'http://republicavirtual.com.br/web_cep.php?cep='.urlencode($this->request->post['postcode']).'&formato=query_string';
			$result = @file_get_contents($url);
			
			if(!$result){
				$result = "&resultado=0";  
			}

			$arrResult = explode("&", substr($result, 1));
			
			foreach($arrResult as $key) {
				$arrValues = explode("=", $key);
				$json[$arrValues[0]] = utf8_encode(urldecode($arrValues[1]));
			}
			
		}		
		
		$this->response->addHeader('Content-Type: application/json; charset=UTF-8;');
		$this->response->setOutput(json_encode($json));
	}
}