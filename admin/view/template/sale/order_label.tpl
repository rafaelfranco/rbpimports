<?php echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $language; ?>" xml:lang="<?php echo $language; ?>">
<head>
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/invoice.css" />
</head>
<body>
<div class="page">
  <?php foreach ($orders as $order) { ?>


  <div class="label">
    <?php foreach ($order['total'] as $total) { ?>
       <div class="selo">
         <?php 
         if(stripos($total['title'], 'SEDEX') !==  false) {
            ?><img src="/image/sedex.png"><?php
         }
         if(stripos($total['title'], 'PAC') !==  false) {
           ?><img src="/image/pac.png"><?php
         }
         ?>
         </div>
    <?php } ?>

    <?php echo $order['shipping_address']; ?>
  </div>


<?php } ?>
</div>
<style>
  .page {
    width: 960px;
    
  }
  .label{
    border:dotted 1px #ccc;
    width:445px;;
    display: inline-block;
    padding-left: 30px;
    height: 390px;
    font-size: 14px;
    font-weight: bold;
    margin-bottom: 20px;
  }
  .selo {
    padding-left: 200px;
  }

</style>
</body>
</html>