{if !empty($block_blog_entries)}
	{$styles = [1,2,3,4,5,6]}
	<section class="tiles">
		{foreach $block_blog_entries as $one_blog_entry}
			<article class="style{$styles[array_rand($styles)]}">
				<span class="image">
					{if $one_blog_entry.image}
						{ia_image file=$one_blog_entry.image type='thumbnail' title=$one_blog_entry.title|escape}
					{else}
						<img src="{$core.page.nonProtocolUrl}templates/phantom/images/placeholder.jpg" alt="" />
					{/if}
				</span>
				<a href="{$smarty.const.IA_URL}blog/{$one_blog_entry.id}-{$one_blog_entry.alias}">
					<h2>{$one_blog_entry.title|escape}</h2>
					<div class="content">
						<p>{$one_blog_entry.body|strip_tags|truncate:80:'...'}</p>
						<p>{$one_blog_entry.date_added|date_format:$core.config.date_format}</p>
					</div>
				</a>
			</article>
		{/foreach}
	</section>
	<div class="m-t-md">
		<a href="{$smarty.const.IA_URL}blog/" class="button">{lang key='view_all_blog_entries'}</a>
	</div>
{else}
	<div class="alert alert-info">{lang key='no_blog_entries'}</div>
{/if}