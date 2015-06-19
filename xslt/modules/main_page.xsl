<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" method="html" indent="yes"/>
    <xsl:template match="result[@module='content'][@method = 'content']">


        <!--Объявления-->

        <!--меню -->
        <!-- <xsl:apply-templates select="document('udata://content/menu/0/2/obyavleniya')/udata" mode= "announcements_menu"/> -->

        <!--поиск ветклиник по карте-->
        <section class="ymap-main std-block clearfix">
            <div class="l-col categories_class">
                <!--Список инпутов-->
             <xsl:apply-templates select="document('udata://catalog/getCategoryList/notemplate/42/5000')/udata/items" mode= "category_catalog"/>
            </div>


            <div class="r-col" style="background-color: white">
                <ul id='points' style='display:none'>
                <!-- <xsl:apply-templates select="document('udata://catalog/getObjectsList/0/42/0/0/5')/udata/lines/item" mode="address_maps"/> -->
                    <!-- <xsl:apply-templates select="document('udata://catalog/getObjectsList/0/42/5000/0/5')/udata/lines/item" mode="address_maps"/> -->
                    <!-- <xsl:value-of select="document('udata://catalog/getObjectsList/0/42/5000/0/5) /udata" disable-output-escaping="" /> -->
                </ul>
                <!-- Скрипт отрисовки карты и прочего -->
                    <script src="{$template-resources}/js/map.js"></script>

                <div id="map" style="width: 680px; height: 400px"></div>

            </div>
        </section>

        <!--Последние отзывы-->
        <section class="clearfix">
            <h2 class="std-title">Последние отзывы</h2>
            <aside class="rating-legend">
                <div class="std-title">Как это понимать?</div>
                <div class="rating-bar"><div class="col-b"  data-tooltip="10" style="width:17%"></div><div data-tooltip="20" class="col-n" style="width:33%"></div><div data-tooltip="30" class="col-g" style="width:50%"></div></div>
                <b>Если навести на рейтинг мышкой, то можно увидеть:</b>
                <ul class="legend">
                    <li><div class="r-mark col-b"></div>оранжевый цвет показывает количество отрицательных отзывов</li>
                    <li><div class="r-mark col-g"></div>зеленый цвет показывает количество положительных отзывов</li>
                    <li><div class="r-mark col-n"></div>серый цвет показывает количество нейтральных отзывов</li>
                </ul>
            </aside>
            <div class="list last-comments">
                <xsl:variable name="y" select="3" />
                <table>
                    <!-- Походу в xslt нельзя просто так взять и сделать цикл -->
                    <!-- Пока не знаю как реалзовать красиво, будем через хардкод -->
                    <xsl:call-template name="lastcomments">
                        <xsl:with-param name="i" select="1"/>
                    </xsl:call-template>
                    <xsl:call-template name="lastcomments">
                        <xsl:with-param name="i" select="2"/>
                    </xsl:call-template>
                </table>
            </div>
        </section>
    </xsl:template>

    <!--Шаблон вывода адресов-->
    <xsl:template match="item" mode="address_maps">
        <xsl:if test="@address">
        <li class="OnMap" data-parent-id="{document(concat('upage://',@id))/udata/page/@parentId}"
            title="{document(concat('upage://',@id))/udata/page/properties/group/property[@name='title']/value}">
        <xsl:value-of select="document(concat('upage://',@id,'.address'))/udata/property/value"  />

        </li>

    </xsl:if>
    </xsl:template>

    <!--Шаблон списка интпутов-->
    <xsl:template match="item" mode="category_catalog">
        <div >
            <input id="{@id}" type="checkbox" checked="checked" name="{@id}" value="{document(concat('upage://',@id))/udata/page/properties/group[@name='dopolnitelno']/property[@name='icon']/value}"/>
            <label for="{@id}"><xsl:value-of select="."/></label>
        </div>
    </xsl:template>

    <xsl:template name="lastcomments">
        <xsl:param name="i"/>
        <xsl:variable name="childid" select="document('udata://comments/insert/all')/udata/items/item[position() = $i]" />
        <xsl:variable name="curentcomment" select="document(concat('upage://',$childid/@id))/udata/page/@parentId" />
        <xsl:variable name="catname" select="document(concat('upage://',$curentcomment))/udata/page/@parentId" />
        <tr>
            <td class="list-item-name">
                <a href="{document(concat('upage://',$curentcomment))/udata/page/@link}">
                    <xsl:value-of select="document(concat('upage://',$curentcomment))/udata/page/name" disable-output-escaping="yes" />
                </a>
                <span>
                    <xsl:value-of select="document(concat('upage://',$catname))/udata/page/properties/group/property/value" disable-output-escaping="yes" />
                </span>
            </td>
            <td class="list-item-rating">
                <div class="rating-total">
                    <xsl:value-of select="document(concat('udata://comments/countComments/', $curentcomment)) /udata" disable-output-escaping="yes" />
                </div>
                    <xsl:call-template name="raiting">
                        <xsl:with-param name="pageid" select="$curentcomment"/>
                        <xsl:with-param name="countcoment" select="document(concat('udata://comments/countComments/', $curentcomment)) /udata"/>
                    </xsl:call-template>
            </td>
            <td>
                <div>
                    <xsl:value-of select="substring($childid, 0, 122)" disable-output-escaping="yes" />...
                    <br/>
                    <a href="{document(concat('upage://',$curentcomment))/udata/page/@link}#{$childid/@id}">читать полностью</a>
                </div>
            </td>
        </tr>
    </xsl:template>


</xsl:stylesheet>

