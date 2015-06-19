<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" method="html" indent="yes"/>
    <xsl:template match="result">

        <!--Хлебные крошки-->
            <xsl:apply-templates select="document('udata://core/navibar')/udata"/>

        <!--Показывать поиск на странице результатов поиска-->
        <xsl:if test="/result/page/@id = 106" >
            <xsl:apply-templates select="document('udata://catalog/search/11')" mode = 'find_catalog'/>
        </xsl:if>

        <!-- <xsl:if test="not(/result/page/@id = 106) ">
        <div class="h-search-brief std-block">
            <form action="/" method="post">

                <select name="district" class="style-me">
                    <option value="-1">Любой район</option>
                    <option value="1">Центральный</option>
                    <option value="2">Не очень</option>
                    <option value="3">Приморский</option>
                </select>
                <select name="metro" class="style-me">
                    <option value="-1">Любое метро</option>
                    <option value="1">Адмиралтейская</option>
                    <option value="2">Большевиков проспект</option>
                    <option value="3">Василеостровская</option>
                </select>
            </form>
        </div>
        </xsl:if> -->

    <h1><xsl:value-of select="/result/page/properties/group/property[@name = 'h1']/value"/></h1>
        <section>
            <div class="list companies">
                <!--Условия вывода каталога или объявлений-->
                <!--Постраничный вывод -->
                <xsl:apply-templates select="document(concat('udata://system/numpages/', $lastlist/total, '/', $lastlist/per_page))/udata" mode="listing" />
                <xsl:choose>
                    <xsl:when test="/result/parents/page/@id = 42 ">
                        <!--Вывод каталога-->
                        <xsl:apply-templates select="document('udata://catalog/getObjectsList/')/udata/lines/item" mode="catalog"/>
                    </xsl:when>
                        <!--Вывод объявлений-->
                    <xsl:otherwise>
                        <xsl:apply-templates select="document('udata://catalog/getObjectsList/')/udata/lines/item" mode="announcements"/>
                    </xsl:otherwise>
                </xsl:choose>
                <!--Постраничный вывод -->
                <xsl:apply-templates select="document(concat('udata://system/numpages/', $lastlist/total, '/', $lastlist/per_page))/udata" mode="listing" />

                <!--вывод всех товаров на страницы(результата поиска)-->
                <xsl:if test="/result/page/@id = 106">
                    <xsl:apply-templates select="document('udata://catalog/GetCategoryList/notemplate/42')/udata/items" mode="search_result"/>
                </xsl:if>

            </div>


        </section>
    </xsl:template>
<xsl:template match="result[@module='content'][@pageId='187']">
    <h1><xsl:value-of select="/result/page/name"/></h1>
    <xsl:value-of select="/result/page/properties/group/property[@name='content']/value" disable-output-escaping="yes" />
</xsl:template>
<xsl:template match="result[@module='content'][@pageId='972']">
    <h1><xsl:value-of select="/result/page/name"/></h1>
    <xsl:value-of select="/result/page/properties/group/property[@name='content']/value" disable-output-escaping="yes" />
</xsl:template>

</xsl:stylesheet>
