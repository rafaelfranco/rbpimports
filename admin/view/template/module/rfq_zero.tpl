<?php echo $header; 
//==============================================================================
// Request Quote If Price Is Zero v2.0
// 
// Author: Boopis Media, LLC
// E-mail: daveedchun@gmail.com
// Website: http://www.boopis.com
//==============================================================================
?>

<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><?php echo $entry_button; ?></td>
            <td><input type="text" name="rfq_zero_button" value="<?php echo $rfq_zero_button; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_phrase; ?></td>
            <td><input type="text" name="rfq_zero_phrase" value="<?php echo $rfq_zero_phrase; ?>" /></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?> 