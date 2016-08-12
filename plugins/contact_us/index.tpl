{if $core.config.contact_us_show_map}
	<div class="row">
		<div class="col-md-6">
			<div class="contact-us-address">
				{lang key='contact_us_address'}
			</div>

			<div class="contact-us-map" id="contact-us-map" style="height:350px;"></div>

			<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
			{ia_add_js}
google.maps.event.addDomListener(window, 'load', init);

function init() {
	var myLatLng = {
		lat: {$core.config.contact_us_lat},
		lng: {$core.config.contact_us_lng}
	},
	mapOptions = {
		zoom: {$core.config.contact_us_zoom|default:14},
		center: new google.maps.LatLng(myLatLng)
	},
	mapElement = document.getElementById('contact-us-map'),
	map = new google.maps.Map(mapElement, mapOptions);

	var marker = new google.maps.Marker({
		position: myLatLng,
		map: map
	});
}
			{/ia_add_js}
		</div>
		<div class="col-md-6">
{/if}
<div class="slogan">
	{lang key='contact_top_text'}
</div>

<form action="{$smarty.const.IA_URL}contacts/" method="post" id="contact" class="box">
	{preventCsrf}

	<div class="field half first">
		<input placeholder="{lang key='fullname'}" type="text" name="name" id="contact-name" value="{if isset($smarty.post.name)}{$smarty.post.name}{/if}">
	</div>

	<div class="field half">
		<input placeholder="{lang key='email'}" type="text" name="email" id="contact-email" value="{if isset($smarty.post.email)}{$smarty.post.email}{/if}">
	</div>

	<div class="field">
		<label for="phone">{lang key='phone'}:</label>
		<input class="form-control" type="text" name="phone" id="contact-phone" value="{if isset($smarty.post.phone)}{$smarty.post.phone}{/if}">
	</div>

	{if !empty($subjects)}
		<div class="form-group">
			<label for="subject">{lang key='subject'}:</label>
			<select class="form-control" name="subject" id="contact-subject">
				<option>{lang key='_select_'}</option>
				{foreach $subjects as $subject}
					<option value="{lang key=$subject default=$subject}">{lang key=$subject default=$subject}</option>
				{/foreach}
			</select>
		</div>
	{/if}

	<div class="form-group">
		<label for="msg">{lang key='contact_reason'}: <span class="required">*</span></label>
		<textarea class="form-control" id="msg" name="msg" rows="5">{if isset($smarty.post.msg)}{$smarty.post.msg}{/if}</textarea>
		{ia_add_js}
$(function()
{
	$('#msg').dodosTextCounter('500', { counterDisplayElement: 'span', counterDisplayClass: 'textcounter_msg' });
	$('.textcounter_msg').addClass('textcounter').wrap('<p class="help-block text-right"></p>').before('{lang key='chars_left'} ');
});
		{/ia_add_js}
		{ia_print_js files='jquery/plugins/jquery.textcounter'}
	</div>
	
	{include file='captcha.tpl'}

	<ul class="actions">
		<li>
			<input type="submit" class="special" value="{lang key='send'}">
		</li>
	</ul>
</form>

{if $core.config.contact_us_show_map}
		</div>
	</div>
{/if}