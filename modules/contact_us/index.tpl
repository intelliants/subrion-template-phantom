{if $core.config.contact_us_show_map}
	<div class="row uniform">
		<div class="6u 12u$(xsmall)">
			{lang key='contact_us_address'}
		</div>
		<div class="6u$ 12u$(xsmall)">
			<div class="contact-us-map" id="contact-us-map" style="height:350px;"></div>

			<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js{if !empty($core.config.contact_us_key)}?key={$core.config.contact_us_key}{/if}"></script>
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
	</div>
{/if}

<hr>

<div class="row uniform">
	<div class="6u 12u$(xsmall)">
		{lang key='contact_top_text'}
	</div>
	<div class="6u$ 12u$(xsmall)">
		<form action="{$smarty.const.IA_URL}contacts/" method="post" id="contact">
			{preventCsrf}

			<div class="field">
				<input placeholder="{lang key='fullname'}" type="text" name="name" id="contact-name" value="{if isset($smarty.post.name)}{$smarty.post.name}{/if}">
			</div>

			<div class="field half first">
				<input placeholder="{lang key='email'}" type="text" name="email" id="contact-email" value="{if isset($smarty.post.email)}{$smarty.post.email}{/if}">
			</div>

			<div class="field half">
				<input placeholder="{lang key='phone'}" type="text" name="phone" id="contact-phone" value="{if isset($smarty.post.phone)}{$smarty.post.phone}{/if}">
			</div>

			{if !empty($subjects)}
				<div class="select-wrapper">
					<select class="form-control" name="subject" id="contact-subject">
						<option>{lang key='_select_'}</option>
						{foreach $subjects as $subject}
							<option value="{lang key=$subject default=$subject}">{lang key=$subject default=$subject}</option>
						{/foreach}
					</select>
				</div>
			{/if}

			<div class="field">
				<textarea placeholder="{lang key='contact_reason'}" id="msg" name="msg" rows="5">{if isset($smarty.post.msg)}{$smarty.post.msg}{/if}</textarea>
				{ia_add_js}
		$(function()
		{
			$('#msg').dodosTextCounter('500', { counterDisplayElement: 'span', counterDisplayClass: 'textcounter_msg' });
			$('.textcounter_msg').addClass('textcounter').wrap('<p class="align-right"></p>').before('{lang key='chars_left'} ');
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
	</div>
</div>