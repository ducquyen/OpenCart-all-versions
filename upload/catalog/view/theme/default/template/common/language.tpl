<div style="text-align: left; color: #999; margin-bottom: 4px;"><?php echo $entry_language; ?>
  <?php foreach ($languages as $language) { ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <div style="display: inline;"><input type="image" src="catalog/view/theme/default/image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" style="position: relative; top: 4px;" />
    <input type="hidden" name="language" value="<?php echo $language['code']; ?>" />
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" /></div>
  </form>
  <?php } ?>
</div>
