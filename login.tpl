<form action="{$smarty.const.IA_URL}login/" method="post">
	{preventCsrf}
	<div class="row uniform">
		<div class="6u 12u$(xsmall)">
			<label for="field_login">{lang key='username_or_email'}:</label>
			<input class="form-control" type="text" tabindex="4" name="username" value="{if isset($smarty.post.username)}{$smarty.post.username|escape}{/if}">
		</div>
		<div class="6u 12u$(xsmall)">
			<label for="field_password">{lang key='password'}:</label>
			<input class="form-control" type="password" tabindex="5" name="password">
		</div>
		<div class="6u$ 12u$(small)">
			<input type="checkbox" name="remember" id="remember">
			<label for="remember">{lang key='remember_me'}</label>
		</div>

		<div class="12u$">
			<ul class="actions">
				<li><button class="special" type="submit" tabindex="6" name="login">{lang key='login'}</button></li>
				<li><a class="button" href="{$smarty.const.IA_URL}forgot/">{lang key='forgot'}</a></li>
				<li><a class="button" href="{$smarty.const.IA_URL}registration/" rel="nofollow">{lang key='registration'}</a></li>
			</ul>
		</div>
	</div>
</form>

{*
{if $core.providers}
	<div class="social-providers">
		<p>{lang key='login_with_social_network'}:</p>
		{foreach $core.providers as $name => $provider}
			<a class="btn btn-block btn-social btn-{$name|lower}" href="{$smarty.const.IA_URL}login/{$name|lower}/"><span class="fa fa-{$name|lower}"></span> {$name}</a>
		{/foreach}
	</div>
{/if}
*}