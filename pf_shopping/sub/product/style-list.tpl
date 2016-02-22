<div class="product-block {if Configuration::get('PTS_CP_PRODUCT_LAYOUT') == 'gallery' }swap-gallery{/if}" itemscope itemtype="http://schema.org/Product">
	<div class="product-container">
		<div class="left-block">
			{hook h='displayProductListGallery' product=$product}
			<div class="product-image-container image">
				<a class="img product_img_link"	href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url">
					<img class="unveil replace-2x img-responsive pts-image" src="/img/cms/loading_spinner.gif" data-src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" itemprop="image" />
				</a>
				{hook h='displayProductListSwap' product=$product}

				{if isset($product.color_list)}
					<div class="color-list-container product-colors">{$product.color_list}</div>
				{/if}

			</div>
			{if isset($product.new) && $product.new == 1}
				<span class="product-label new-box">
					<span class="new-label">{l s='New'}</span>
				</span>
			{/if}
			<div class="button-container action">
				<div>
					{hook h='displayProductListFunctionalButtons' product=$product}
					{if isset($comparator_max_item) && $comparator_max_item}
						<div class="compare"><a class="btn add_to_compare" href="{$product.link|escape:'html':'UTF-8'}" data-id-product="{$product.id_product}" title="{l s='Compare'}">
							<i class="icon icon-retweet"></i><span>{l s='Compare'}</span></a>
						</div>
					{/if}
					<div class="pts-atchover">
						<a class="quick-view btn" title="{l s='Quick view'}" href="{$product.link|escape:'html':'UTF-8'}" rel="{$product.link|escape:'html':'UTF-8'}">
							<i class="icon icon-arrows-alt"></i>
						</a>
					</div>
				</div>
			</div>			
			{hook h="displayProductDeliveryTime" product=$product}
			{hook h="displayProductPriceBlock" product=$product type="weight"}
		</div>
		<div class="right-block">
			<div class="product-meta">
				<h4 class="name" itemprop="name">
					{if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
					<a class="product-name" href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url" >
						{$product.name|truncate:45:'...'|escape:'html':'UTF-8'}
					</a>
				</h4>
				<div class="product-desc description" itemprop="description">
					{$product.description_short|strip_tags:'UTF-8'|truncate:360:'...'}
				</div>
				<div class="clearfix product-box">
					{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
						<div itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="content_price price {if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}specific_price{/if}">
							{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
								<span itemprop="price" class="product-price{if isset($product.specific_prices) && $product.specific_prices} new-price{/if}">
									{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
								</span>
								<meta itemprop="priceCurrency" content="{$currency->iso_code}" />
								{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
									{hook h="displayProductPriceBlock" product=$product type="old_price"}
									<span class="old-price product-price">
										{displayWtPrice p=$product.price_without_reduction}
									</span>
{if $product.specific_prices.reduction_type == 'percentage'}
											<span style="color:red" class="price-percent-reduction">-{$product.specific_prices.reduction * 100}%</span>
										{/if}

								{/if}
								{hook h="displayProductPriceBlock" product=$product type="price"}
								{hook h="displayProductPriceBlock" product=$product type="unit_price"}
							{/if}
						</div>
					{/if}
					<!-- 
					{if isset($tabname) && $tabname != ptsblockrelatedproducts}
						{hook h='displayProductListReviews' product=$product}
					{/if}
					-->
					{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.customizable != 2 && !$PS_CATALOG_MODE}
						<div class="addtocart">
							{if (!isset($product.customization_required) || !$product.customization_required) && ($product.allow_oosp || $product.quantity > 0)}
								{capture}add=1&amp;id_product={$product.id_product|intval}{if isset($static_token)}&amp;token={$static_token}{/if}{/capture}
								<a class="ajax_add_to_cart_button btn btn-outline" href="{$link->getPageLink('cart', true, NULL, $smarty.capture.default, false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}" data-minimal_quantity="{if isset($product.product_attribute_minimal_quantity) && $product.product_attribute_minimal_quantity > 1}{$product.product_attribute_minimal_quantity|intval}{else}{$product.minimal_quantity|intval}{/if}">
									<i class=" icon-shopping-cart"></i>
									<span>{l s='Add to cart'}</span>
								</a>
							{else}
								<span class="button ajax_add_to_cart_button btn btn-default disabled">
									<span>{l s='Add to cart'}</span>
								</span>
							{/if}
						</div>
					{/if}
					{if isset($quick_view) && $quick_view}
						
					{/if}
				</div>
				<div class="product-flags">
					{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
						{if isset($product.online_only) && $product.online_only}
							<span class="online_only">{l s='Online only'}</span>
						{/if}
					{/if}
					{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
					{elseif isset($product.reduction) && $product.reduction && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
						<span class="discount">{l s='Reduced price!'}</span>
					{/if}
				</div>
				{if (!$PS_CATALOG_MODE && $PS_STOCK_MANAGEMENT && ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
					{if isset($product.available_for_order) && $product.available_for_order && !isset($restricted_country_mode)}
						<div itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="availability">
							{if (!isset($product.customization_required) || !$product.customization_required) && ($product.allow_oosp || $product.quantity > 0)}
								<span class="{if $product.quantity <= 0 && !$product.allow_oosp}out-of-stock{else}available-now{/if}">
									<link itemprop="availability" href="http://schema.org/InStock" />{if $product.quantity <= 0}{if $product.allow_oosp}{if isset($product.available_later) && $product.available_later}{$product.available_later}{else}{l s='In Stock'}{/if}{else}{l s='Out of stock'}{/if}{else}{if isset($product.available_now) && $product.available_now}{$product.available_now}{else}{l s='In Stock'}{/if}{/if}
								</span>
							{elseif (isset($product.quantity_all_versions) && $product.quantity_all_versions > 0)}
								<span class="available-dif">
									<link itemprop="availability" href="http://schema.org/LimitedAvailability" />{l s='Product available with different options'}
								</span>
							{else}
								<span class="out-of-stock">
									<link itemprop="availability" href="http://schema.org/OutOfStock" />{l s='Out of stock'}
								</span>
							{/if}
						</div>
					{/if}
				{/if}
			</div>
		</div>
	</div><!-- .product-container> -->
</div>
