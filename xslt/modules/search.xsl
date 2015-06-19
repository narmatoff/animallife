<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet	version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="udata[@module='catalog'][@method='search']" mode = 'find_catalog'>

        <script>
           function show_query(){
            //alert('hello');
            $($('#example').removeAttr('value'));
            $('#example').attr('value', $('span#this_span').text());
            }
        </script>

        <div class="h-search tab-me">
            <ul class="tabs-h">
                <li class="active">Поиск по каталогу</li>
                <!-- <li>Поиск по объявлениям</li> -->
            </ul>
            <div class="tabs-c std-block">
                <div>
                    <form action="/find_result"  method="get">
                        например, <a href="/katalogi/vetkliniki/tri_kota/" class="underdotted"> <span onclick="show_query();" id='this_span'  >ветклиника Три кота</span></a>
                        <div class="std-row">

                        </div>
                        <xsl:apply-templates select="group[@name='poiskovye_svojstva']/field" mode="search_cat"/>
                        <div  class= "std-row">
                            <div class="style-me" >
                        <button type="submit" class="std-btn">Найти</button>
                            </div>
                            </div>
                            <div style="clear:both;"></div>
                    </form>
                </div>
                <!--Поиск по объявлениям-->
<!--                 <div>
                    <form action="/" method="post">
                        например, магазин Забота
                    </form>
                </div> -->
            </div>
        </div>


        <!--Условия того что искали-->
        <xsl:if test="group/field[@data-type = 'string']/value">
        <span style="color:#249cc8; font-weight: bold;">Вы искали </span>
        <xsl:apply-templates select="group/field[@data-type = 'string']/value"/>,
        <!--район-->
        <xsl:if test="not(group/field[@name='rajon']/values/item[@selected])">
            любой район
        </xsl:if>
            <xsl:value-of select="/udata/group/field[@name='rajon']/values/item[@selected]"/>,
        <!--Метро    -->
            <xsl:if test="not(/udata/group/field[@name='metro']/values/item[@selected])">
                любое метро
            </xsl:if>
        <xsl:value-of select="/udata/group/field[@name='metro']/values/item[@selected]"/>
        </xsl:if>

        <xsl:if test="not(group/field[@data-type = 'string']/value)">
        <xsl:if test="group/field/values/item[@selected]">
            <span style="color:#249cc8; font-weight: bold;">Вы искали </span>
            <!--район-->
            <xsl:if test="not(group/field[@name='rajon']/values/item[@selected = 'selected']/.)">
                любой район
            </xsl:if>
            <span id="kostil">
                <xsl:apply-templates select="/udata/group/field[@name='rajon']/values/item[@selected]"/>,
            </span>
            <!--Метро    -->
            <xsl:if test="not(/udata/group/field[@name='metro']/values/item[@selected])">
                любое метро
            </xsl:if>
            <span id="kostil2">
            <xsl:apply-templates select="/udata/group/field[@name='metro']/values/item[@selected]"/>
            </span>
                </xsl:if>
        </xsl:if>
        </xsl:template>

<!--Вывод фильтруемых опций-->
    <xsl:template match="field[@data-type = 'relation']" mode="search_cat">
        <div class="std-row" style="float:left;margin-right:10px;">
            <select size="5"  name="fields_filter[{@name}]" class="style-me">
                <option value="">
                    <xsl:choose>
                        <xsl:when test="@name = 'metro'">
                            -- Любая станция метро --
                        </xsl:when>
                        <xsl:otherwise>
                           -- Любой район --
                        </xsl:otherwise>
                    </xsl:choose>
                </option>
                <xsl:apply-templates select="values/item" mode="search_options"/>
            </select>
        </div>
    </xsl:template>

    <!--Заглушка (чтобы не выводилось название)-->
    <xsl:template match="field[@data-type = 'string']" mode="search_cat">
        <input type="text"  id='example' class="std-input" name="fields_filter[{/udata/group/field[@name='nazvanie']/@name}]" >
            <xsl:if test="value">
                <xsl:attribute name="value">
                    <xsl:value-of select="normalize-space(.)" disable-output-escaping="yes" />
                </xsl:attribute>
            </xsl:if>
        </input>
    </xsl:template>

    <xsl:template match="item" mode="search_options">
        <option value="{@id}">
            <xsl:if test="@selected">
                <xsl:attribute name="selected">selected</xsl:attribute>
            </xsl:if>
            <xsl:value-of select="."/>
        </option>
    </xsl:template>

    </xsl:stylesheet>
