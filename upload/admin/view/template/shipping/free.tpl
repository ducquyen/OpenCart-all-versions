<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
    <h1 style="background-image: url('view/image/shipping.png');"><?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
        <tr>
          <td><?php echo $entry_total; ?></td>
          <td><input type="text" name="free_total" value="<?php echo $free_total; ?>" /></td>
        </tr>
        <tr>
          <td><?php echo $entry_geo_zone; ?></td>
          <td><select name="free_geo_zone_id">
              <option value="0"><?php echo $text_all_zones; ?></option>
              <?php foreach ($geo_zones as $geo_zone) { ?>
              <?php if ($geo_zone['geo_zone_id'] == $free_geo_zone_id) { ?>
              <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_product; ?></td>
          <td><table>
              <tr>
                <td style="padding: 0;" colspan="3"><select id="category" style="margin-bottom: 5px;" onchange="getProducts();">
                    <?php foreach ($categories as $category) { ?>
                    <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
                    <?php } ?>
                  </select></td>
              </tr>
              <tr>
                <td style="padding: 0;"><select multiple="multiple" id="product" size="10" style="width: 200px;">
                  </select></td>
                <td style="vertical-align: middle;"><input type="button" value="--&gt;" onclick="addProduct();" />
                  <br />
                  <input type="button" value="&lt;--" onclick="removeProduct();" /></td>
                <td style="padding: 0;"><select multiple="multiple" id="free" size="10" style="width: 200px;">
                  </select></td>
              </tr>
            </table>
            <div id="free_product">
              <?php foreach ($free_product as $product_id) { ?>
              <input type="hidden" name="free_product[]" value="<?php echo $product_id; ?>" />
              <?php } ?>
            </div></td>
        </tr>
		<tr>
          <td><?php echo $entry_inclusive; ?></td>
          <td><select name="free_inclusive">
              <?php if ($free_inclusive) { ?>
              <option value="1" selected="selected"><?php echo $text_yes; ?></option>
              <option value="0"><?php echo $text_no; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_yes; ?></option>
              <option value="0" selected="selected"><?php echo $text_no; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_status; ?></td>
          <td><select name="free_status">
              <?php if ($free_status) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_sort_order; ?></td>
          <td><input type="text" name="free_sort_order" value="<?php echo $free_sort_order; ?>" size="1" /></td>
        </tr>
      </table>
    </form>
  </div>
</div>

<script type="text/javascript"><!--
function addProduct() {
	$('#product :selected').each(function() {
		$(this).remove();

		$('#free option[value=\'' + $(this).attr('value') + '\']').remove();

		$('#free').append('<option value="' + $(this).attr('value') + '">' + $(this).text() + '</option>');

		$('#free_product input[value=\'' + $(this).attr('value') + '\']').remove();

		$('#free_product').append('<input type="hidden" name="free_product[]" value="' + $(this).attr('value') + '" />');
	});
}

function removeProduct() {
	$('#free :selected').each(function() {
		$(this).remove();

		$('#free_product input[value=\'' + $(this).attr('value') + '\']').remove();
	});
}

function getProducts() {
	$('#product option').remove();

	$.ajax({
		url: 'index.php?route=shipping/free/category&token=<?php echo $token; ?>&category_id=' + $('#category').attr('value'),
		dataType: 'json',
		success: function(data) {
			for (i = 0; i < data.length; i++) {
	 			$('#product').append('<option value="' + data[i]['product_id'] + '">' + data[i]['name'] + '</option>');
			}
		}
	});
}

function getProduct() {
	$('#free option').remove();

	$.ajax({
		url: 'index.php?route=shipping/free/product&token=<?php echo $token; ?>',
		type: 'POST',
		dataType: 'json',
		data: $('#free_product input'),
		success: function(data) {
			$('#free_product input').remove();

			for (i = 0; i < data.length; i++) {
	 			$('#free').append('<option value="' + data[i]['product_id'] + '">' + data[i]['name'] + '</option>');

				$('#free_product').append('<input type="hidden" name="free_product[]" value="' + data[i]['product_id'] + '" />');
			}
		}
	});
}

getProducts();
getProduct();
//--></script>
<?php echo $footer; ?>