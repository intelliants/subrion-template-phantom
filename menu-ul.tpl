{function name=menu pid=0}
	{if isset($data.$pid)}
		<ul class="{$class}{if $pid} menu_{$pid}{/if}">

			{foreach $data.$pid as $menu}

				{if in_array($position, array('left', 'right', 'user1', 'user2', 'top'))}
					<a class="list-group-item{if $menu.active} active{/if}" href="{if $menu.url}{$menu.url}{else}{$smarty.const.IA_SELF}#{/if}"{if $menu.nofollow} rel="nofollow"{/if}{if $menu.new_window} target="_blank"{/if}>{$menu.text}</a>
				{else}
					<li class="m_{$menu.page_name}
					    {if isset($data[$menu.el_id]) || isset($menu_children)} dropdown{/if}
					    {if $menu.active} active{/if}
					    {if $menu.level >= 1 && (isset($data[$menu.el_id]) || isset($menu_children))} dropdown-submenu{/if}
					    {if $menu.level >= 0 && (isset($data[$menu.el_id]) || isset($menu_children)) && $position == 'left'} dropdown-submenu{/if}
					    ">

						<a href="{if $menu.url}{$menu.url}{else}{$smarty.const.IA_SELF}#{/if}"
							{if $menu.nofollow} rel="nofollow"{/if}
							{if $menu.new_window} target="_blank"{/if}
							{if (isset($data[$menu.el_id]) || isset($menu_children)) && $menu.level == 0  && $position != 'left'}data-toggle="dropdown"{/if}
						>
							{$menu.text}
							{if (isset($data[$menu.el_id]) || isset($menu_children)) && $menu.level == 0  && $position != 'left'}<span class="caret"></span>{/if}
						</a>
						{if isset($data[$menu.el_id])}
							{if in_array($position, array('inventory', 'right', 'copyright'))}
								{menu data=$data pid=$menu.el_id class='dropdown-menu pull-right'}
							{else}
								{menu data=$data pid=$menu.el_id class='dropdown-menu'}
							{/if}
						{/if}
					</li>
				{/if}

			{/foreach}
		</ul>
	{/if}
{/function}

{menu data=$menus class=$menu_class}