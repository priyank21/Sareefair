<?php 
  /*
  * @package Framework for Opencart 2.0
  * @version 2.0
  * @author http://www.pavothemes.com
  * @copyright Copyright (C) Feb 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
  * @license   GNU General Public License version 2
  */
  require_once(DIR_SYSTEM . 'pavothemes/loader.php');
?>
<!-- 
  $ospans: allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
 -->

<?php if( !($helper->getConfig('enable_pagebuilder') && $helper->isHomepage())  ){ ?>

<?php
  $blockid = 'mass_bottom';
  $blockcls = '';
 
  $ospans = array(1=>9, 2=>3);
  $tmcols = 'col-sm-12 col-xs-12';
  require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );


?>

<?php } ?>
 
<footer id="footer">
 
  <?php
    $blockid = 'footer_top';
    $blockcls = '';
    $ospans = array(1=>12, 2=>12);
    require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );
  ?>

  <?php
  /**
   * Footer Center Position
   * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
   */
  $blockid = 'footer_center';
  $blockcls = '';
 
  $ospans = array(1=>2,2=>2,3=>2,4=>2,5=>4);
   require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );
  if( count($modules) <= 0 ) { 
   ?>
  
  <div class="footer-center">
    <div class="container">
      <div class="inner">
        <div class="row">

          <?php if( $content=$helper->getLangConfig('widget_logo') ) {?>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
              <?php echo $content; ?>
            </div>
          <?php } ?>

           <?php if( $content=$helper->getLangConfig('widget_about_us') ) {?>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
              <div class="box about"> 
                <div class="box-heading">
                  <span><?php echo $objlang->get('text_about_us'); ?></span>
                </div>
                <?php echo $content; ?>
              </div>
              
            </div>
          <?php } ?>

           <?php if( $content=$helper->getLangConfig('widget_social') ) {?>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
              <div class="box social">  
              <div class="box-heading"><span><?php echo $objlang->get('text_social'); ?></span></div>  
               <?php echo $content; ?>
              </div>
             
            </div>
          <?php } ?>
      </div>
      <div class="row">

        <?php if( $content=$helper->getLangConfig('widget_call_us') ) {?>
        <div class="column col-xs-12 col-sm-6 col-lg-3 col-md-3">
          <div class="box call-us">
            <div class="box-heading"><span><?php echo $objlang->get('text_call_us'); ?></span></div>
              <?php echo $content; ?>
          </div>
        </div>
        <?php } ?>

        <div class="column col-xs-12 col-sm-6 col-lg-2 col-md-2">
          <div class="box">
            <div class="box-heading"><span><?php echo $text_service; ?></span></div>
            <ul class="list">
              <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
              <!-- <li><a href="<?php //echo $return; ?>"><?php //echo $text_return; ?></a></li> -->
              <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
               <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
             <!--  <li><a href="<?php //echo $voucher; ?>"><?php //echo $text_voucher; ?></a></li> -->
            </ul>
          </div>
        </div>

        <?php if ($informations) { ?>
          <div class="column col-xs-12 col-sm-6 col-lg-2 col-md-2">
            <div class="box info">
              <div class="box-heading"><span><?php echo $text_information; ?></span></div>
                <ul class="list">
                  <?php foreach ($informations as $information) { ?>
                  <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                  <?php } ?>
                </ul>         
            </div>
          </div>
          <?php } ?>
          
        <div class="column col-xs-12 col-sm-6 col-lg-2 col-md-2">
          <div class="box">
            <div class="box-heading"><span><?php echo $text_account; ?></span></div>
            <ul class="list">
              <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
              <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
              <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
              <!-- <li><a href="<?php //echo $newsletter; ?>"><?php //echo $text_newsletter; ?></a></li> -->
              <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
            </ul>
          </div>
        </div>

        <?php if( $content=$helper->getLangConfig('widget_contact_us') ) {?>
        <div class="column col-xs-12 col-sm-6 col-lg-3 col-md-3">
          <div class="box contact-us">
            <div class="box-heading"><span><?php echo $objlang->get('text_contact_us'); ?></span></div>
            <?php echo $content; ?>
          </div>
        </div>
        <?php } ?>

    </div>
    </div>
     </div> </div> 
<?php  } ?> 


  <?php
    $blockid = 'footer_bottom';
    $blockcls = '';
    $ospans = array();
    require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );
  ?>
  <div id="top-scroll" class="bo-social-icons">
    <a href="#" class="bo-social-gray scrollup"><i class="fa fa-angle-up"></i></a>
  </div>
</footer>
 
<div id="powered">
  <div class="container">
    <div class="inner clearfix">
      <div class="copyright">
        <?php if( $helper->getConfig('enable_custom_copyright', 0) ) { ?>
          <?php echo $helper->getConfig('copyright'); ?>
        <?php } else { ?>
          <?php echo 'Future Work Technologies'; //$powered; ?>. 
        <?php } ?>
        Design By <a href="#" title="pavothemes - opencart themes clubs">Future Work</a>
      </div>  
    </div>   
  </div>
</div>
<?php if( $helper->getConfig('enable_paneltool',0) ){  ?>
  <?php  echo $helper->renderAddon( 'panel' );?>
<?php  } ?>

<?php
  $offcanvas = $helper->getConfig('offcanvas','category');
  if($offcanvas == "megamenu") {
      echo $helper->renderAddon('offcanvas');
  } else {
      echo $helper->renderAddon('offcanvas-category');
  }
?> 
</div>
</body></html>