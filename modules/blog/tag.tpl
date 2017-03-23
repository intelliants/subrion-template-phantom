{if isset($blog_entries)}
	<div class="blogroll">
		{foreach $blog_entries as $blog_entry}
			<div class="row uniform">
				<div class="3u">
					<span class="image fit">
						{if $blog_entry.image}
							{ia_image file=$blog_entry.image type='thumbnail' title=$blog_entry.title|escape}
						{else}
							<img src="{$core.page.nonProtocolUrl}templates/phantom/images/placeholder.jpg" alt="" />
						{/if}
					</span>
				</div>
				<div class="9u$">
					<h2><a href="{$smarty.const.IA_URL}blog/{$blog_entry.id}-{$blog_entry.alias}">{$blog_entry.title|escape}</a></h2>
					<p>{$blog_entry.body|strip_tags|truncate:$core.config.blog_max:'...'}</p>
					<ul class="actions small">
						<li><span class="fa fa-calendar"></span> {lang key='posted_on'} {$blog_entry.date_added|date_format:$core.config.date_format}</li>
						<li><span class="fa fa-user"></span> {lang key='by'} {$blog_entry.fullname}</li>
					</ul>
				</div>
			</div>
			{if !$blog_entry@last}<hr>{/if}
		{/foreach}
	</div>

	{navigation aTotal=$pagination.total aTemplate=$pagination.template aItemsPerPage=$core.config.blog_number aNumPageItems=5}
{else}
	{if $blog_tags}
		{foreach $blog_tags as $tag}
			{if $tag != ''}
				<div class="media ia-item">
					<div class="media-body">
						<h4 class="media-heading">
							<a href="{$smarty.const.IA_URL}tag/{$tag.alias}">#{$tag.title|escape}</a>
						</h4>
					</div>
				</div>
			{/if}
		{/foreach}

		{navigation aTotal=$pagination.total aTemplate=$pagination.template aItemsPerPage=$core.config.blog_tag_number aNumPageItems=5}
	{else}
		<div class="alert alert-info">{lang key='no_tags'}</div>
	{/if}
{/if}