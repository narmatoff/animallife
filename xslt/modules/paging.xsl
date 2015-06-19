<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet  [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="udata[@module='system'][@method='numpages'][items]" mode="listing">
        <div class="paging">
        <a href="{tobegin_link}">первая</a>
            <xsl:apply-templates select="items" mode="listing_pages"/>
        <a href="{toend_link}">последняя</a>
        </div>
    </xsl:template>

    <!--Шаблон для активных элементов-->
    <xsl:template match="item[@is-active]" mode="listing_pages">
        <a href="#" class="active"><xsl:value-of select="."/></a>
    </xsl:template>
    <!--Шаблон для остальных элементов-->
    <xsl:template match="item" mode="listing_pages">
        <a href="{@link}" title="На страницу {.}"> <xsl:value-of select="."/> </a>
    </xsl:template>

</xsl:stylesheet>


