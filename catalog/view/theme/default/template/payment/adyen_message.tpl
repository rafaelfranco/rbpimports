<?php echo $header; ?><?php // echo $column_left; ?><?php // echo $column_right; ?>
<div id="content"><?php //echo $content_top; ?>
    <div class="box">
      <div class="box-content interna">
      <div class="conteudo">
          
    <ul class="breadcrumb">
      <li>Você está em:</li>
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li>
       <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
      </li>
    <?php } ?>
    </ul>
  <h1><?php echo $heading_title; ?></h1>
  <?php echo $text_message; ?>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button continuar"><?php echo $button_continue; ?></a></div>
  </div>
  <?php echo $content_bottom; ?></div></div></div></div>
<?php echo $footer; ?>