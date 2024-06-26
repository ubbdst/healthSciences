{**
 * templates/frontend/objects/announcement_summary.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a summary view of an announcement
 *
 * @uses $announcement Announcement The announcement to display
 * @uses $heading string HTML heading element, default: h2
 *}
{if !$heading}
	{assign var="heading" value="h2"}
{/if}

<article class="announcement-summary">
	<{$heading}>
		<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
			{$announcement->getLocalizedTitle()|escape}
		</a>
	</{$heading}>
	<div class="announcement-summary-date">
		{$announcement->getDatePosted()|date_format:$dateFormatLong}
	</div>
	<div class="announcement-summary-description">
		{$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}
		<p class="announcement-summary-more">
			<a class="btn" href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
				<span aria-hidden="true">{translate key="common.readMore"}</span>

				{* Screen readers need more context *}
				<span class="sr-only">
					{translate key="common.readMoreWithTitle" title=$announcement->getLocalizedTitle()|escape}
				</span>
			</a>
		</p>
	</div>
</article>
