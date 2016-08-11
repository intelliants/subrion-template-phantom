{if $core.page.breadcrumb|count}
	<ul class="actions small breadcrumbs" xmlns:v="http://rdf.data-vocabulary.org/#">
		{foreach $core.page.breadcrumb as $entry}
			{if $entry.url && !$entry@last}
				<li typeof="v:Breadcrumb">
					<a href="{$entry.url}"{if isset($entry.no_follow) && $entry.no_follow} rel="nofollow"{/if} rel="v:url" property="v:title">{$entry.caption}</a> <span class="fa fa-angle-right"></span>
				</li>
			{else}
				<li class="active">{$entry.caption}</li>
			{/if}
		{/foreach}
	</ul>
{/if}