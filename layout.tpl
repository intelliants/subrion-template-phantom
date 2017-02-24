<!DOCTYPE html>
<html lang="{$core.language.iso}" dir="{$core.language.direction}">
	<head>
		{ia_hooker name='smartyFrontBeforeHeadSection'}

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<title>{ia_print_title}</title>
		<meta name="description" content="{$core.page['meta-description']}">
		<meta name="keywords" content="{$core.page['meta-keywords']}">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="generator" content="Subrion CMS - Open Source Content Management System">
		<meta name="robots" content="index">
		<meta name="robots" content="follow">
		<meta name="revisit-after" content="1 day">
		<base href="{$smarty.const.IA_URL}">

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		<link rel="shortcut icon" href="{if !empty($core.config.site_favicon)}{$core.page.nonProtocolUrl}uploads/{$core.config.site_favicon}{else}{$core.page.nonProtocolUrl}favicon.ico{/if}">

		{ia_add_media files='jquery, subrion, css:main' order=0}
		{ia_print_js files='_IA_TPL_bootstrap.min, _IA_TPL_skel.min, _IA_TPL_util, _IA_TPL_main' order=999}

		{ia_hooker name='smartyFrontAfterHeadSection'}

		{ia_print_css display='on'}

		<!--[if lte IE 9]><link rel="stylesheet" href="{$core.page.nonProtocolUrl}templates/phantom/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="{$core.page.nonProtocolUrl}templates/phantom/css/ie8.css" /><![endif]-->

		{ia_add_js}
			intelli.pageName = '{$core.page.name}';

			{foreach $core.customConfig as $key => $value}
				intelli.config.{$key} = '{$value}';
			{/foreach}
		{/ia_add_js}
	</head>

	<body class="page-{$core.page.name}">
		<div class="hidden">
			{ia_blocks block='hidden'}
		</div>
		<div id="wrapper">
			<header id="header">
				<div class="inner">
					<a href="{$smarty.const.IA_URL}" class="logo">
						{if !empty($core.config.site_logo)}
							<img src="{$core.page.nonProtocolUrl}uploads/{$core.config.site_logo}" alt="{$core.config.site}">
						{else}
							<span class="symbol"><img src="{$core.page.nonProtocolUrl}templates/phantom/images/logo.svg" alt="" /></span><span class="title">{$core.config.logo_text}</span>
						{/if}
					</a>

					<nav>
						<ul>
							<li><a href="#menu">Menu</a></li>
						</ul>
					</nav>
				</div>
			</header>

			<nav id="menu">
				<h2>{lang key='nav_header'}</h2>
				{ia_blocks block='mainmenu'}

				{if $member && $core.config.members_enabled}
					<a href="{$smarty.const.IA_URL}blog/add/" class="button inverse fit icon fa-pencil">{lang key='add_blog_post'}</a>
				{/if}

				<h2>{lang key='account'}</h2>
				{ia_blocks block='account'}
			</nav>

			<div id="main" class="content">
				<div class="inner">
					{if isset($smarty.get.elements)}
						{include 'page.elements.tpl'}
					{else}
						<div class="blocks-top">{ia_blocks block='top'}</div>
						{if 'index' != $core.page.name}
							<div class="content__header clearfix">
								<h1>{$core.page.title}</h1>
								{ia_hooker name='smartyFrontBeforeBreadcrumb'}
								{include 'breadcrumb.tpl'}
							</div>

							{ia_hooker name='smartyFrontBeforeNotifications'}
							{include 'notification.tpl'}

							{ia_hooker name='smartyFrontBeforeMainContent'}

							<div class="content__body">
								{$_content_}
							</div>

							{ia_hooker name='smartyFrontAfterMainContent'}
						{/if}
						<div class="blocks-bottom">{ia_blocks block='bottom'}</div>
					{/if}
				</div>
			</div>

			<footer id="footer">
				<div class="inner">
					<section>
						{ia_blocks block='prefooter'}
					</section>
					<section>
						<h2>{lang key='follow'}</h2>
						<ul class="icons">
							{if $core.config.website_social_twitter}<li><a href="{$core.config.website_social_twitter}" class="icon style2 fa-twitter"><span class="label">Twitter</span></a></li>{/if}
							{if $core.config.website_social_facebook}<li><a href="{$core.config.website_social_facebook}" class="icon style2 fa-facebook"><span class="label">Facebook</span></a></li>{/if}
							{if $core.config.website_social_instagram}<li><a href="{$core.config.website_social_instagram}" class="icon style2 fa-instagram"><span class="label">Instagram</span></a></li>{/if}
							{if $core.config.website_social_dribbble}<li><a href="{$core.config.website_social_dribbble}" class="icon style2 fa-dribbble"><span class="label">Dribbble</span></a></li>{/if}
							{if $core.config.website_social_github}<li><a href="{$core.config.website_social_github}" class="icon style2 fa-github"><span class="label">GitHub</span></a></li>{/if}
							{if $core.config.website_social_500px}<li><a href="{$core.config.website_social_500px}" class="icon style2 fa-500px"><span class="label">500px</span></a></li>{/if}
							{if $core.config.website_social_email}<li><a href="mailto:{$core.config.website_social_email}" class="icon style2 fa-envelope-o"><span class="label">Email</span></a></li>{/if}
						</ul>
					</section>
					<ul class="copyright">
						<li>&copy; {$smarty.server.REQUEST_TIME|date_format:'%Y'} {lang key='powered_by_subrion'}</li>
						<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
				</div>
			</footer>
		</div>

		<!-- SYSTEM STUFF -->

		{if $core.config.cron}
			<div style="display: none;">
				<img src="{$core.page.nonProtocolUrl}cron/?{randnum}" width="1" height="1" alt="">
			</div>
		{/if}

		{if isset($manageMode)}
			{include 'visual-mode.tpl'}
		{/if}

		{if isset($previewMode)}
			<p>{lang key='youre_in_preview_mode'}</p>
		{/if}

		{ia_print_js display='on'}

		{ia_hooker name='smartyFrontFinalize'}
	</body>
</html>