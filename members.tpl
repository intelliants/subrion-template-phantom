<ul class="nav nav-tabs">
	<li><span>{lang key='sort_by'}</span></li>
	<li{if !$activeGroup} class="active"{/if}><a href="{$smarty.const.IA_SELF}?group=all">{lang key='all'}</a></li>

	{if isset($usergroups) && $usergroups}
		{foreach $usergroups as $entryId => $name}
			<li{if $activeGroup && $entryId == $activeGroup} class="active"{/if}><a href="{$smarty.const.IA_SELF}?group={$entryId}" rel="nofollow">{lang key="usergroup_{$name}"}</a></li>
		{/foreach}
	{/if}
</ul>

<div class="tab-content">
	<div id="tab-all" class="tab-pane{if !$activeGroup} active{/if}">
		{if !$activeGroup && isset($letters) && $letters}
			{foreach $letters.all as $letter}
				{if $letter == $letters.active || !in_array($letter, $letters.existing)}
					<a class="button small {if $letter == $letters.active} disabled{/if}" href="{$smarty.const.IA_URL}members/{$letter}/">{$letter}</a>
				{else}
					<a class="button small" href="{$smarty.const.IA_URL}members/{$letter}/">{$letter}</a>
				{/if}
			{/foreach}
		{/if}
	</div>

	{if isset($usergroups) && $usergroups}
		{foreach $usergroups as $entryId => $name}
			<div id="tab-usergroups" class="tab-pane{if $entryId == $activeGroup} active{/if}">
				{if $entryId == $activeGroup && isset($letters) && $letters}
					{foreach $letters.all as $letter}
						{if $letter == $letters.active || !in_array($letter, $letters.existing)}
							<a class="button small {if $letter == $letters.active} disabled{/if}" href="{$smarty.const.IA_URL}members/{$letter}/">{$letter}</a>
						{else}
							<a class="button small" href="{$smarty.const.IA_URL}members/{$letter}/">{$letter}</a>
						{/if}
					{/foreach}
				{/if}
			</div>
		{/foreach}
	{/if}
</div>

<div id="js-search-results-container">
	<div class="ia-items m-t-md">
		{foreach $members as $listing}
			{include 'list-members.tpl'}
			{if !$listing@last}<hr>{/if}
		{foreachelse}
			<div class="alert alert-info">{lang key='no_members'}</div>
		{/foreach}
	</div>
</div>

<div id="js-search-results-pagination">
	{navigation aTotal=$pagination.total aTemplate=$pagination.url aItemsPerPage=$pagination.limit aNumPageItems=5 aTruncateParam=1}
</div>