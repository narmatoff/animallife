<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" method="html" indent="yes"/>


    <xsl:template match="udata[@method = 'navibar']">
        <div class="crumbs-wrp">
            <a href="/"> Главная </a>
            <span>
            /
            </span>
            <xsl:apply-templates select="items/item" mode="navibar"/>
        </div>
    </xsl:template>

    <xsl:template match="item" mode="navibar">
        <xsl:choose>
            <xsl:when test="@link = '/katalogi/'">
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:when test="@link != '/katalogi/'">
                <a href="{@link}">
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
        </xsl:choose>

        <span>
            /
        </span>
    </xsl:template>

    <xsl:template match="item[position() = last()]" mode="navibar">
        <xsl:value-of select="."/>
    </xsl:template>

</xsl:stylesheet>
