<?php 

	$cols = 3;
	$span = 12/$cols;

	$config = $sconfig;
	$theme  = $themename;
	$themeConfig  	 			= (array)$config->get('themecontrol');
	$listingConfig  			= array( 		
		'category_pzoom' 		=> 1,
		'show_swap_image' 		=> 0,
		'quickview' 			=> 0,
		'product_layout'		=> 'default',
		'catalog_mode'			=> '',
	); 
	$listingConfig  			= array_merge($listingConfig, $themeConfig );
	$categoryPzoom 	    		= $listingConfig['category_pzoom'];
	$quickview 					= $listingConfig['quickview'];
	$swapimg 					= ($listingConfig['show_swap_image'])?'swap':'';
 

	$productLayout = DIR_TEMPLATE.$theme.'/template/common/product/'.$listingConfig['product_layout'].'.tpl';	
	if( !is_file($productLayout) ){
		$listingConfig['product_layout'] = 'default';
	}
	$productLayout = DIR_TEMPLATE.$theme.'/template/common/product/'.$listingConfig['product_layout'].'.tpl';	
?>
<div class="box-heading">
	<span><?php echo $heading_title; ?>(<?php echo count($products); ?>)</span>
	<em class="line"></em>
</div>
<?php if(!empty($products)){ ?>
<div class="box-content">
	<div id="product-related" class="slide product-grid" data-interval="0">
		<?php if(count($products) > $span){ ?>
		<div class="carousel-controls">
			<a class="carousel-control left" href="#product-related" data-slide="prev">prev</a>
			<a class="carousel-control right" href="#product-related"  data-slide="next">next</a>
		</div>
		<?php } ?>
		<div class="carousel-inner">
			<?php foreach ($products as $i => $product) { $i=$i+1; ?>
			<?php if( $i%$cols == 1 && $cols > 1 ) { ?>
			<div class= "item <?php if($i==1) {?>active<?php } ?>">
				<div class="row">
			<?php } ?>
				<div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-6 col-xs-12 product-col">
					<?php require( $productLayout );  ?>
				</div>
			<?php if( $cols > 1  && ($i%$cols == 0 || $i==count($products)) ) { ?>
				</div>
			</div>
			<?php } ?>
			<?php } ?>
		</div>
	</div>
</div>
<?php } ?>