<script>
	jQuery(function(){
		jQuery('#camera_wrap_<?php echo $module; ?>').camera({
			fx: 'scrollHorz',
			navigation: true,
			playPause: false,
			thumbnails: false,
			barPosition: 'top',
			loader: false,
			time: 3000,
			transPeriod:1000,
			loader: 'none',
			alignment: 'center',
			autoAdvance: true,
			mobileAutoAdvance: true,
			barDirection: 'leftToRight', 
			barPosition: 'bottom',
			easing: 'easeInOutExpo',
			height: '41.1%',
			minHeight: '90px',
			hover: true,
			pagination: false,
			loaderColor			: '#030261', 
			loaderBgColor		: 'transparent',
			loaderOpacity		: 1,
			loaderPadding		: 0,
			loaderStroke		: 3
			});
	});
</script>
<div class="fluid_container" >
	<div id="camera_wrap_<?php echo $module; ?>">
	<?php foreach ($banners as $banner) { ?>
		<div title="<?php echo $banner['title']; ?>" data-thumb="<?php echo $banner['image']; ?>" <?php if ($banner['link']) { ?> data-link="<?php echo $banner['link']; ?>"<?php } ?> data-src="<?php echo $banner['image']; ?>">
			<?php if ($banner['description']) { ?>
			<div class="camera_caption fadeIn">
				<?php echo $banner['description']; ?>
			</div>
			<?php } ?>
		</div>
	<?php } ?>
	</div>
	<div class="clear"></div>
</div>