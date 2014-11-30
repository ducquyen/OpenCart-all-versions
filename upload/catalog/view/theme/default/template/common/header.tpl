<?php echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" xml:lang="<?php echo $lang; ?>">
<head>
<title><?php echo $title; ?></title>
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<base href="<?php echo $base; ?>" />
<?php if ($icon) { ?>
<link href="image/<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/unitpngfix/unitpngfix.js"></script>
<![endif]-->
<?php foreach ($styles as $style) { ?>
<link rel="stylesheet" type="text/css" href="view/stylesheet/<?php echo $style; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/thickbox/thickbox-compressed.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/thickbox/thickbox.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/tab.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="view/javascript/jquery/<?php echo $script; ?>"></script>
<?php } ?>
</head>
<body>
<div id="container">
<div id="header">
  <div class="div1">
    <div class="div2"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $store; ?>" alt="<?php echo $store; ?>" /></a></div>
    <div class="div3"><a href="<?php echo $special; ?>" style="background-image: url('catalog/view/theme/default/image/special.png');"><?php echo $text_special; ?></a><a href="<?php echo $contact; ?>" style="background-image: url('catalog/view/theme/default/image/contact.png');"><?php echo $text_contact; ?></a><a href="<?php echo $sitemap; ?>" style="background-image: url('catalog/view/theme/default/image/sitemap.png');"><?php echo $text_sitemap; ?></a></div>
    <div class="div4"><a href="<?php echo $home; ?>" id="tab_home"><?php echo $text_home; ?></a>
      <?php if (!$logged) { ?>
      <a href="<?php echo $login; ?>" id="tab_login"><?php echo $text_login; ?></a>
      <?php } else { ?>
      <a href="<?php echo $logout; ?>" id="tab_logout"><?php echo $text_logout; ?></a>
      <?php } ?>
      <a href="<?php echo $account; ?>" id="tab_account"><?php echo $text_account; ?></a><a href="<?php echo $cart; ?>" id="tab_cart"><?php echo $text_cart; ?></a><a href="<?php echo $checkout; ?>" id="tab_checkout"><?php echo $text_checkout; ?></a></div>
    <div class="div5">
      <div class="left"></div>
      <div class="right"></div>
      <div class="center">
        <div id="search"><?php echo $entry_search; ?>&nbsp;
          <?php if ($keyword) { ?>
          <input type="text" value="<?php echo $keyword; ?>" id="filter_keyword" />
          <?php } else { ?>
          <input type="text" value="<?php echo $text_keyword; ?>" id="filter_keyword" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;" />
          <?php } ?>
          <select id="filter_category_id">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category) { ?>
            <?php if ($category['category_id'] == $category_id) { ?>
            <option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
          &nbsp;<a onclick="moduleSearch();" class="button"><span><?php echo $button_go; ?></span></a> <a href="<?php echo $advanced; ?>"><?php echo $text_advanced; ?></a></div>
      </div>
    </div>
  </div>
  <div class="div6">
    <div class="left"></div>
    <div class="right"></div>
    <div class="center">
      <div id="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
      </div>
      <div class="div7">
        <?php if ($currencies) { ?>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency_form">
          <div class="switcher">
            <?php foreach ($currencies as $currency) { ?>
            <?php if ($currency['code'] == $currency_code) { ?>
            <div class="selected"><a><?php echo $currency['title']; ?></a></div>
            <?php } ?>
            <?php } ?>
            <div class="option">
              <?php foreach ($currencies as $currency) { ?>
              <a onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $('#currency_form').submit();"><?php echo $currency['title']; ?></a>
              <?php } ?>
            </div>
          </div>
          <input type="hidden" name="currency_code" value="" />
          <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
        </form>
        <?php } ?>
        <?php if ($languages) { ?>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language_form">
          <div class="switcher">
            <?php foreach ($languages as $language) { ?>
            <?php if ($language['code'] == $language_code) { ?>
            <div class="selected"><a><img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" />&nbsp;&nbsp;<?php echo $language['name']; ?></a></div>
            <?php } ?>
            <?php } ?>
            <div class="option">
              <?php foreach ($languages as $language) { ?>
              <a onclick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>'); $('#language_form').submit();"><img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" />&nbsp;&nbsp;<?php echo $language['name']; ?></a>
              <?php } ?>
            </div>
          </div>
          <input type="hidden" name="language_code" value="" />
          <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
        </form>
        <?php } ?>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!-- 
function getURLVar(urlVarName) {
	var urlHalves = String(document.location).toLowerCase().split('?');
	var urlVarValue = '';
	
	if (urlHalves[1]) {
		var urlVars = urlHalves[1].split('&');

		for (var i = 0; i <= (urlVars.length); i++) {
			if (urlVars[i]) {
				var urlVarPair = urlVars[i].split('=');
				
				if (urlVarPair[0] && urlVarPair[0] == urlVarName.toLowerCase()) {
					urlVarValue = urlVarPair[1];
				}
			}
		}
	}
	
	return urlVarValue;
} 

$(document).ready(function() {
	route = getURLVar('route');
	
	if (!route) {
		$('#tab_home').addClass('selected');
	} else {
		part = route.split('/');
		
		if (route == 'common/home') {
			$('#tab_home').addClass('selected');
		} else if (route == 'account/login') {
			$('#tab_login').addClass('selected');	
		} else if (part[0] == 'account') {
			$('#tab_account').addClass('selected');
		} else if (route == 'checkout/cart') {
			$('#tab_cart').addClass('selected');
		} else if (part[0] == 'checkout') {
			$('#tab_checkout').addClass('selected');
		} else {
			$('#tab_home').addClass('selected');
		}
	}
});
//--></script>
<script type="text/javascript"><!--
$('#module_search input').keydown(function(e) {
	if (e.keyCode == 13) {
		moduleSearch();
	}
});

function moduleSearch() {
	url = 'index.php?route=product/search';
	
	var filter_keyword = $('#filter_keyword').attr('value')
	
	if (filter_keyword) {
		url += '&keyword=' + encodeURIComponent(filter_keyword);
	}
	
	var filter_category_id = $('#filter_category_id').attr('value');
	
	if (filter_category_id) {
		url += '&category_id=' + filter_category_id;
	}
	
	location = url;
}
//--></script>
<script type="text/javascript"><!--
$('.switcher').bind('click', function() {
	$(this).find('.option').slideToggle('fast');
});
//--></script>