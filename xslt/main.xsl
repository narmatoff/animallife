<?xml version="1.0" encoding="utf-8"?>


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" method="html" indent="yes"/>

<xsl:output
	encoding="UTF-8"
	indent="yes"
	cdata-section-elements="script noscript"
	omit-xml-declaration="yes"
	doctype-system = "string"
/>

	<xsl:param name="search_string" />
	<xsl:param name="template-resources" />
	<xsl:param name="expert" />
	<xsl:param name="lent-id" />
	<xsl:param name="brend" />
	<xsl:param name="_err" />
	<xsl:param name="link" />
	<xsl:param name="p" />
	<xsl:param name="news" select="0"/>
	<xsl:param name="katalog_link" />
	<xsl:param name="param0" />
	<xsl:param name="flat" />
	<xsl:variable name="user-id" select="/result/user/@id" />

	<!--Глобальная переменная для ИД страницы-->
	<xsl:variable name="page-id" select="/result/@pageId" />

    <!--Глобальная переменная для ИД страницы-->
	<xsl:variable name="user-info" select="document(concat('uobject://', $user-id))" />
	<xsl:variable name="system" select="document('upage://4270')/udata/page"/>
    <xsl:variable name="category_id" select="document(concat('upage://',@id))/udata/page/@parentId"/>
	<xsl:variable name="errors" select="document(concat('udata://system/listErrorMessages/?_err=', $_err))/udata" />

    <!--Постраничное листание (пагинация)-->
    <xsl:variable name="lastlist" select="document(concat('udata://catalog/getObjectsList/notemplate/',page/properties/group/property/value/page/@id ,'/0/0/3'))/udata"/>


    <!--Подключенные шаблоны-->
	<xsl:include href="default.xsl" />
    <xsl:include href="modules/menu.xsl" />
    <xsl:include href="modules/main_page.xsl" />
	<xsl:include href="modules/other_pages.xsl" />
	<xsl:include href="modules/catalog.xsl" />
	<xsl:include href="modules/navibar.xsl" />
	<xsl:include href="modules/paging.xsl" />
	<xsl:include href="modules/search.xsl" />
	<xsl:include href="modules/search_result.xsl" />
	<xsl:include href="modules/comments.xsl" />
	<xsl:include href="modules/registration.xsl" />
	<xsl:include href="modules/tips.xsl" />
	<xsl:include href="modules/forms.xsl" />
	<xsl:include href="modules/users.xsl" />


</xsl:stylesheet>
