<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xss="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" method="html" indent="yes"/>

    <!--Вывод всех каталогов (для поиска)-->
    <xsl:template match="items" mode="search_result">
    <xsl:apply-templates select="item" mode="all_category"/>
    </xsl:template>

    <!--Шаблон вывода категорий-->
    <xsl:template match="item" mode="all_category">
        <xsl:if test="document(concat('udata://catalog/getObjectsList/notemplate/', @id))/udata/total != 0">
            <xsl:apply-templates select="document(concat('udata://system/numpages/', $lastlist/total, '/', $lastlist/per_page))/udata" mode="listing" />
        <br/> <strong><xsl:value-of select="."/></strong> <br/>
        </xsl:if>
        <!--Используем шаблон в шаблонах catalog-->
        <xsl:apply-templates select="document(concat('udata://catalog/getObjectsList/notemplate/', @id))/udata/lines" mode="catalog"/>
    </xsl:template>

































    <!--<xsl:template match="lines" mode="catalog_find">-->


        <!--<br/>-->
        <!--<strong>  <xsl:value-of select="$var_vet"/></strong>-->
        <!--<xsl:apply-templates select="item" mode="vet"/>-->

        <!--<strong> Гостиницы </strong>-->
        <!--<xsl:apply-templates select="item" mode="hotel"/>-->


    <!--</xsl:template>-->
    <!--&lt;!&ndash;Вывод ветклиник в поиске&ndash;&gt;-->
    <!--<xsl:template match="item" mode="vet">-->
        <!--<xsl:if test="document(concat('upage://',@id))/udata/page/properties/group/property[@name='sategory']/value/item/@name='Ветклиники'">-->
            <!--&lt;!&ndash;<xsl:value-of select="document(concat('upage://',@id))/udata/page/properties/group/property[@name='sategory']/value/item/@name"/>&ndash;&gt;-->
            <!--<xsl:variable name="var_vet" select="document(concat('upage://',@id))/udata/page/properties/group/property[@name='sategory']/value/item/@name"/>-->
            <!--<table>-->
                <!--<tr>-->
                    <!--<td><img src="{$template-resources}/images/__clinik.jpg" alt="asdasd"/></td>-->
                    <!--<td>-->
                        <!--<h2><a class="underdotted" href="{@link}"><xsl:value-of select="."/></a></h2>-->

                        <!--<p><xsl:value-of select="document(concat('upage://',@id,'.adres'))/udata/property/value" disable-output-escaping ="yes"/>-->
                            <!--<br/>-->
                            <!--<a href="{document(concat('upage://',@id,'.web-adress'))/udata/property/value}">-->
                                <!--<xsl:value-of select="document(concat('upage://',@id,'.web-adress'))/udata/property/value" disable-output-escaping ="yes" /></a>-->
                        <!--</p>-->
                        <!--<div class="companies-widgets">-->
                            <!--<div class="rating-total">25</div><b>отзывов</b>-->
                            <!--<a href="#"><img src="{$template-resources}/images/plus22x22.jpg" alt=""/><b>добавить отзыв</b>-->
                            <!--</a><div class="rating-bar"><div class="col-b" style="width:17%" data-tooltip="10"></div><div class="col-n" style="width:33%" data-tooltip="20"></div>-->
                            <!--<div class="col-g" style="width:50%" data-tooltip="30"></div></div>-->
                        <!--</div>-->
                    <!--</td>-->

                <!--</tr>-->

            <!--</table>-->

        <!--</xsl:if>-->
    <!--</xsl:template>-->

    <!--&lt;!&ndash;Вывод гостиниц в поиске&ndash;&gt;-->
    <!--<xsl:template match="item" mode="hotel">-->
        <!--<xsl:if test="document(concat('upage://',@id))/udata/page/properties/group/property[@name='sategory']/value/item/@name='Гостиницы'">-->
            <!--<table>-->
                <!--<tr>-->
                    <!--<td><img src="{$template-resources}/images/__clinik.jpg" alt="asdasd"/></td>-->
                    <!--<td>-->
                        <!--<h2><a class="underdotted" href="{@link}"><xsl:value-of select="."/></a></h2>-->
                        <!--<p><xsl:value-of select="document(concat('upage://',@id,'.adres'))/udata/property/value" disable-output-escaping ="yes"/>-->
                            <!--<br/>-->
                            <!--<a href="{document(concat('upage://',@id,'.web-adress'))/udata/property/value}">-->
                                <!--<xsl:value-of select="document(concat('upage://',@id,'.web-adress'))/udata/property/value" disable-output-escaping ="yes" /></a>-->
                        <!--</p>-->
                        <!--<div class="companies-widgets">-->
                            <!--<div class="rating-total">25</div><b>отзывов</b>-->
                            <!--<a href="#"><img src="{$template-resources}/images/plus22x22.jpg" alt=""/><b>добавить отзыв</b>-->
                            <!--</a><div class="rating-bar"><div class="col-b" style="width:17%" data-tooltip="10"></div><div class="col-n" style="width:33%" data-tooltip="20"></div>-->
                            <!--<div class="col-g" style="width:50%" data-tooltip="30"></div></div>-->
                        <!--</div>-->
                    <!--</td>-->
                <!--</tr>-->
            <!--</table>-->
        <!--</xsl:if>-->
    <!--</xsl:template>-->


</xsl:stylesheet>
