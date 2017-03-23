{if 'confirm' == $form}
	<form action="{$smarty.const.IA_URL}forgot/" method="get">
		{preventCsrf}
		<div class="row uniform">
			<div class="6u 12u$(xsmall)">
				<label>{lang key='email'}:</label>
				{if isset($smarty.post.email)}
					<input class="form-control" type="text" name="email" value="{$smarty.post.email|escape}">
				{elseif  isset($smarty.get.email)}
					<input class="form-control" type="text" name="email" value="{$smarty.get.email|escape}">
				{else}
					<input class="form-control" type="text" name="email">
				{/if}
			</div>
			<div class="6u 12u$(xsmall)">
				<label>{lang key='code'}:</label>
				<input class="form-control" type="text" name="code"{if isset($smarty.get.code)} value="{$smarty.get.code|escape}"{/if}>
			</div>
			<div class="12u$">
				<ul class="actions">
					<li><button class="special" type="submit">{lang key='send'}</button></li>
				</ul>
			</div>
		</div>
	</form>
{elseif 'request' == $form}
	<p>{lang key='forgot_tooltip'}</p>

	<form action="{$smarty.const.IA_URL}forgot/" method="post">
		{preventCsrf}
		<div class="row uniform">
			<div class="12u$">
				<label>{lang key='email'}:</label>
				<input class="form-control" type="text" name="email" value="{if isset($smarty.post.email)}{$smarty.post.email|escape}{/if}">
			</div>
			<div class="12u$">
				{include 'captcha.tpl'}
			</div>
			<div class="12u$">
				<ul class="actions">
					<li><button class="special" name="restore" type="submit">{lang key='restore_password'}</button></li>
				</ul>
			</div>
		</div>
	</form>
{/if}