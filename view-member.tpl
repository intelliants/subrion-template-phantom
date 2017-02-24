<div class="row uniform">
	<div class="3u">
		<span class="image fit">{ia_image file=$item.avatar title=$item.fullname|default:$item.username gravatar=true email=$item.email gravatar_width=200}</span>

		{if $item.featured || $item.sponsored}
			<div class="ia-item__labels">
				{if $item.sponsored}<span class="label label-warning" title="{lang key='sponsored'}"><span class="fa fa-star"></span> {lang key='sponsored'}</span>{/if}
				{if $item.featured}&nbsp;&nbsp;&nbsp;<span class="label label-info" title="{lang key='featured'}"><span class="fa fa-star-o"></span> {lang key='featured'}</span>{/if}
			</div>
		{/if}
	</div>
	<div class="9u$">
		<ul class="actions">
			<li><span class="fa fa-eye"></span> {$item.views_num}</li>
			{if !empty($item.phone)}
				<li><span class="fa fa-phone"></span> {$item.phone}</li>
			{/if}
			{if !empty($item.website)}
				<li><span class="fa fa-globe"></span> <a href="{$item.website}">{lang key='field_members_website'}</a></li>
			{/if}
			{if !empty($item.facebook)}
				<li><span class="fa fa-facebook"></span> <a href="{$item.facebook}">{lang key='field_members_facebook'}</a></li>
			{/if}
			{if !empty($item.twitter)}
				<li><span class="fa fa-twitter"></span> <a href="{$item.twitter}">{lang key='field_members_twitter'}</a></li>
			{/if}
			{if !empty($item.gplus)}
				<li><span class="fa fa-google-plus"></span> <a href="{$item.gplus}">{lang key='field_members_gplus'}</a></li>
			{/if}
			{if !empty($item.linkedin)}
				<li><span class="fa fa-linkedin"></span> <a href="{$item.linkedin}">{lang key='field_members_linkedin'}</a></li>
			{/if}
		</ul>

		{$item.biography|escape}

		<hr>

		<p>{lang key='member_since'}: {$item.date_reg|date_format:$core.config.date_format}</p>
	</div>
</div>

{foreach $item.items as $itemName => $oneitem}
	{if $oneitem.items}
		{capture name=$itemName append='tabs_content'}
			{if !$oneitem.package}
				{include "search.{$itemName}.tpl" listings=$oneitem.items fields=$oneitem.fields}
			{else}
				{include "extra:{$oneitem.package}/search.{$itemName}" listings=$oneitem.items fields=$oneitem.fields}
			{/if}
		{/capture}
	{/if}
{/foreach}

{include 'item-view-tabs.tpl' isView=true exceptions=array('username', 'avatar', 'fullname', 'phone', 'website', 'facebook', 'twitter', 'gplus', 'linkedin', 'biography')}

{if isset($groups['___empty___'])}
	{include 'field-type-content-fieldset.tpl' item_sections=$groups isView=true exceptions=array('username', 'avatar', 'fullname', 'phone', 'website', 'facebook', 'twitter', 'gplus', 'linkedin', 'biography')}
{/if}

{ia_hooker name='smartyViewListingBeforeFooter'}