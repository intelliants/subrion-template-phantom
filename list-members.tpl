<div class="row uniform">
	<div class="2u">
		<span class="image fit">{ia_image file=$listing.avatar title=$listing.fullname|default:$listing.username gravatar=true email=$listing.email gravatar_width=200}</span>
	</div>
	<div class="9u$">
		<h2><a href="{ia_url item='members' data=$listing type='url'}">{$listing.fullname|default:$listing.username}</a></h2>

		{if !empty($listing.biography)}
			<p>{$listing.biography|escape|truncate:250:'...':true}</p>
		{/if}

		<ul class="actions">
			{if !empty($listing.phone)}
				<li><span class="fa fa-phone"></span> {$listing.phone}</li>
			{/if}
			{if !empty($listing.website)}
				<li><span class="fa fa-globe"></span> <a href="{$listing.website}">{lang key='field_members_website'}</a></li>
			{/if}
			{if !empty($listing.facebook)}
				<li><span class="fa fa-facebook"></span> <a href="{$listing.facebook}">{lang key='field_members_facebook'}</a></li>
			{/if}
			{if !empty($listing.twitter)}
				<li><span class="fa fa-twitter"></span> <a href="{$listing.twitter}">{lang key='field_members_twitter'}</a></li>
			{/if}
			{if !empty($listing.gplus)}
				<li><span class="fa fa-google-plus"></span> <a href="{$listing.gplus}">{lang key='field_members_gplus'}</a></li>
			{/if}
			{if !empty($listing.linkedin)}
				<li><span class="fa fa-linkedin"></span> <a href="{$listing.linkedin}">{lang key='field_members_linkedin'}</a></li>
			{/if}
		</ul>
	</div>
</div>