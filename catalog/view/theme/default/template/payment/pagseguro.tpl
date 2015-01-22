<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_confirm; ?>" data-toggle="modal" data-target="#paymentModal" data-loading-text="<?php echo $text_loading; ?>" id="button-confirm" class="btn btn-pink" />
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="paymentModal" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-body">
             <div id="modalLoading" style="width:32px; margin: 100px auto; position: absolute;left: 0; right: 0;">
                 <img src="catalog/view/theme/<?php echo $theme ?>/image/loading.gif" alt="Carregando..." title='Carregando...' />
             </div>
            <iframe src="<?php echo $url; ?>" onload='document.getElementById("modalLoading").remove();' width="100%" height="100%" />
      </div>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
$('#button-confirm').on('click', function() {
	$.ajax({ 
		type: 'get',
		url: 'index.php?route=payment/pagseguro/confirm',
		cache: false,
		beforeSend: function() {
			$('#button-confirm').button('loading');
		},
		complete: function() {
			$('#button-confirm').button('reset');
		},		
		success: function() {
			<?php if($url){ ?>
			    
			    var modal = parseFloat($('#paymentModal').height());
			    var porcent = (modal * 15 / 100);
			    var modalHeight = modal - porcent;
			    $('#paymentModal iframe').height(modalHeight);
			    
			<?php } else { ?>
			     alert('Erro de acesso no PagSeguro. Para mais detalhes, verifique o log de erros do OpenCart.');
			<?php } ?>
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
//--></script> 
