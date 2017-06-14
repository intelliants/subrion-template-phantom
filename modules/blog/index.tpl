{if isset($blog_entry)}
	{if $blog_entry.image}
		<span class="image fit">
			{ia_image file=$blog_entry.image type='large' title=$blog_entry.title|escape}
		</span>
	{/if}

	{$blog_entry.body}

	<hr>

	<ul class="actions small">
		<li><span class="fa fa-calendar"></span> {lang key='posted_on'} {$blog_entry.date_added|date_format:$core.config.date_format}</li>
		<li><span class="fa fa-user"></span> {lang key='by'} {$blog_entry.fullname}</li>
		{if !empty($blog_tags)}
			<li>
				<span class="fa fa-tags"></span> 
				{foreach $blog_tags as $tag}
					<a href="{$smarty.const.IA_URL}tag/{$tag.alias}">{$tag.title|escape}</a>{if !$tag@last}, {/if}
				{/foreach}
			</li>
		{/if}
	</ul>
{else}
	{if $blog_entries}
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
							{if !empty($blog_tags)}
								<li>
									<span class="fa fa-tags"></span> 
									{$tagsExist=0}
									{foreach $blog_tags as $tag}
										{if $blog_entry.id == $tag.blog_id}
											{$tagsExist = $tagsExist + 1}
										{/if}
									{/foreach}
									{if $tagsExist != 0}
										{foreach $blog_tags as $tag}
											{if $blog_entry.id == $tag.blog_id}
												<a href="{$smarty.const.IA_URL}tag/{$tag.alias}">{$tag.title|escape}</a>
											{/if}
										{/foreach}
									{else}
										{lang key='no_tags'}
									{/if}
								</li>
							{/if}
						</ul>
					</div>
				</div>
				{if !$blog_entry@last}<hr>{/if}
			{/foreach}
		</div>

		{navigation aTotal=$pagination.total aTemplate=$pagination.template aItemsPerPage=$core.config.blog_number aNumPageItems=5}
	{else}
		<div class="alert alert-info">{lang key='no_blog_entries'}</div>
	{/if}
{/if}