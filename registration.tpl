<p class="lead">{lang key='registration_tooltip'}</p>

<form method="post" action="{$smarty.const.IA_SELF}" enctype="multipart/form-data" class="ia-form ia-form--bordered">
	{preventCsrf}

	{include 'plans.tpl' item=$tmp}

	{include 'field-type-content-fieldset.tpl' item_sections=$sections item=$tmp}

	<div class="fieldset">
		<div class="fieldset__header">{lang key='password'}</div>
		<div class="fieldset__content">
			<input type="checkbox" name="disable_fields" id="disable_fields" value="1"{if isset($smarty.post.disable_fields) && $smarty.post.disable_fields} checked{/if}>
			<label for="disable_fields">{lang key='auto_generate_password'}</label>

			<div id="pass_fieldset" {if isset($smarty.post.disable_fields) && 1 == $smarty.post.disable_fields}style="display: none;"{/if}>
				<div class="form-group">
					<label for="pass1">{lang key='your_password'}:</label>
					<input class="form-control" type="password" name="password" id="pass1" value="{if isset($tmp.password)}{$tmp.password}{/if}">
				</div>
				<div class="form-group">
					<label for="pass2">{lang key='your_password_confirm'}:</label>
					<input class="form-control" type="password" name="password2" id="pass2" value="{if isset($tmp.password)}{$tmp.password}{/if}">
				</div>
			</div>
		</div>
	</div>

	{include 'captcha.tpl'}

	<ul class="actions">
		<li><button class="special" type="submit" tabindex="6" name="register">{lang key='registration'}</button></li>
	</ul>

	{*if $core.providers}
		<div class="social-providers">
			<p>{lang key='login_with_social_network'}:</p>
			{foreach $core.providers as $name => $provider}
				<a class="btn btn-block btn-social btn-{$name|lower}" href="{$smarty.const.IA_URL}login/{$name|lower}/"><span class="fa fa-{$name|lower}"></span> {$name}</a>
			{/foreach}
		</div>
	{/if*}
</form>

{ia_print_js files='frontend/registration'}
