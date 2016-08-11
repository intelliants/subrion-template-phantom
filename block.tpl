<!--__b_{$id}-->
{if 'top' == $position}
	<header>
		<!--__b_c_{$id}-->
		{$_block_content_}
		<!--__e_c_{$id}-->
	</header>
{else}
	{if $header}
		<div id="block_{$name}" 
			 class="{$classname}{if isset($collapsible) && $collapsible} collapsible{if isset($collapsed) && $collapsed} collapsed{/if}{/if}" {if isset($manageMode)} vm-hidden="{$hidden}"{/if}>
			{if 'landing' == $position}
				<div class="container">
			{/if}
			<h2 id="caption_{$name}" class="box__caption">{$title|escape:'html'}
				{if isset($icons) && $icons}
					<span class="box__actions">
						{foreach $icons as $icon}
							<a href="{$icon.url}" {$icon.attributes} id="{$icon.name}_{$name}">{$icon.text}</a>
						{/foreach}
					</span>
				{/if}
			</h2>
			<div id="content_{$name}" class="box__content"{if isset($display) && !$display} style="display: none;"{/if}>
	{else}
		<div id="block_{$name}" class="box--no-header {$classname}"{if isset($manageMode)} vm-hidden="{$hidden}"{/if}>
	{/if}

	<!--__b_c_{$id}-->
	{$_block_content_}
	<!--__e_c_{$id}-->

	{if $header}
			</div>
		</div>
	{else}
		</div>
	{/if}
{/if}
<!--__e_{$id}-->