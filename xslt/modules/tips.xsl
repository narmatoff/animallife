<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">


	<xsl:template match="banner[@type='image']"  mode="banner">
		<a href="{href}" title="{alt}" target="{@target}">

			<xsl:call-template name="thumbing">
				<xsl:with-param name="source" select="source" />
				<xsl:with-param name="width" select="216" />
				<xsl:with-param name="height" select="535" />

			</xsl:call-template>

		</a>

	</xsl:template>

	<xsl:template match="banner[@type='html']"  mode="banner">
		<xsl:value-of select="source" disable-output-escaping="yes"/>

	</xsl:template>


<!-- Случайная статья на главной -->
	<xsl:template
		match="udata"  mode="box_info">


		<xsl:variable name="page" select="document(concat('upage://',.))/udata"/>
		<div class="box box-inform">
						<h2>Полезная информация</h2>
						<ul class="list">
							<li>
								<xsl:call-template name="thumbing">
										<xsl:with-param name="source"
											select="$page/page/properties/group/property[@name='header_pic']/value" />
										<xsl:with-param name="width" select="179" />
										<xsl:with-param name="height" select="142" />
								</xsl:call-template>

								<span class="text">
									<a href="{$page/page/@link}"><xsl:value-of select="$page/page/properties/group/property[@name='short']/value" disable-output-escaping="yes" /></a>
								</span>
							</li>
						</ul>
	</div>
	</xsl:template>
<!-- Шаблон создания миниатюры -->
	<xsl:template name="thumbing">
		<xsl:param name="source" />
		<xsl:param name="width" select='60' />
		<xsl:param name="height">auto</xsl:param>
		<xsl:param name="class" />
		<xsl:param name="podpis" />

		<!--
			<xsl:choose> <xsl:when test="$width"> </xsl:when> <xsl:otherwise>
			<xsl:variable name="width" select=""></xsl:variable> </xsl:otherwise>
			</xsl:choose>
		-->

		<xsl:choose>
			<xsl:when test="$source">

		<xsl:apply-templates select="document(concat('udata://system/makeThumbnailFull/(.',$source,')/',$width,'/',$height,'///1/1//100'))/udata"
			mode="temp">
			<xsl:with-param name="class" select="$class"/>
			<xsl:with-param name="podpis" select="$podpis"/>
		</xsl:apply-templates>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="document(concat('udata://system/makeThumbnailFull/(.',$template-resources,'img/nophoto.jpg)/',$width,'/',$height,'//////100'))/udata"	mode="temp">
					<xsl:with-param name="class" select="$class"/>
					<xsl:with-param name="podpis" select="$podpis"/>
				</xsl:apply-templates>

			</xsl:otherwise>
		</xsl:choose>


	</xsl:template>
	<xsl:template name="thumsrc">
		<xsl:param name="source" />
		<xsl:param name="width" select='60' />
		<xsl:param name="height">auto</xsl:param>


		<!--
			<xsl:choose> <xsl:when test="$width"> </xsl:when> <xsl:otherwise>
			<xsl:variable name="width" select=""></xsl:variable> </xsl:otherwise>
			</xsl:choose>
		-->

		<xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.',$source,')/',$width,'/',$height,'//////100'))/udata/src"/>



	</xsl:template>

	<xsl:template match="udata" mode="temp">
		<xsl:param name="class" />
		<xsl:param name="podpis" />
		<img class="{$class}" alt="{$podpis}" src="{src}" />
	</xsl:template>


<!-- Шаблон обработки ошибок -->

	<xsl:template
		match="udata[@module = 'system' and @method = 'listErrorMessages']" />

	<xsl:template
		match="udata[@module = 'system' and @method = 'listErrorMessages'][count(items/item) &gt; 0]">
		<div class="errors">
			<h3>
				<xsl:text>При выполнени запроса возникли следующие ошибки:</xsl:text>
			</h3>
			<ul>
				<xsl:apply-templates select="items/item" mode="error" />
			</ul>
		</div>
	</xsl:template>

	<xsl:template match="item" mode="error">
		<li>
			<xsl:value-of select="." />
		</li>
	</xsl:template>


	<xsl:template match="error">
		<div class="errors">
			<h3>
				<xsl:text>При выполнени запроса возникли следующие ошибки:</xsl:text>
			</h3>
			<ul>
				<li>
					<xsl:value-of select="." />
				</li>
			</ul>
		</div>
	</xsl:template>

	<!-- Рейтинг предприятия -->

	<xsl:template name="raiting">
		<xsl:param name="pageid"/>
		<xsl:param name="countcoment"/>
		<xsl:choose>
	        <xsl:when test="(document(concat('udata://comments/countComments/', $pageid)) /udata) = 0">
		        <div class="rating-bar">
		        	<div class="col-n" data-tooltip="0" style="width:100%"></div>
		        </div>
	        </xsl:when>
	        <xsl:otherwise>
		        <xsl:variable name="colb" select="count(document(concat('udata://comments/insert/',$pageid,'///1')) /udata/items/item[@col='b'])" />
		        <xsl:variable name="coln" select="count(document(concat('udata://comments/insert/',$pageid,'///1')) /udata/items/item[@col='n'])" />
		        <xsl:variable name="colg" select="count(document(concat('udata://comments/insert/',$pageid,'///1')) /udata/items/item[@col='g'])" />
		        <div class="rating-bar">
			        <div class="col-b" data-tooltip="{$colb}" style="width:{($colb div $countcoment)*100}%"></div>
			        <div class="col-n" data-tooltip="{$coln}" style="width:{($coln div $countcoment)*100}%"></div>
			        <div class="col-g" data-tooltip="{$colg}" style="width:{($colg div $countcoment)*100}%"></div>
		        </div>
	        </xsl:otherwise>
        </xsl:choose>
	</xsl:template>


</xsl:stylesheet>
