<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" method="html" indent="yes" />

    <!--Главное меню-->
    <xsl:template match="udata[@module = 'content'][@method = 'menu']" mode="menu">
        <xsl:param name="uri" />
        <xsl:param name="otherCatList" />
        <div class="menu_wrapper">

            <nav class="h-menu">
                <table id="short">
                    <tr>
                        <td>
                            <xsl:apply-templates select="items/item">
                                <xsl:with-param name="uri" select="$uri" />
                            </xsl:apply-templates>
                        </td>
                        <td>

                            <a class="top-m-more">ещё</a>

                        </td>
                    </tr>
                </table>
            </nav>
            <div class="block" id="more">
                <xsl:apply-templates select="$otherCatList">
                   <xsl:with-param name="uri" select="$uri" />
                </xsl:apply-templates>
            </div>
        </div>
    </xsl:template>


    <!--Для всех элементов меню-->
    <xsl:template match="item">
        <xsl:param name="uri" />
        <xsl:choose>
            <xsl:when test="@link = $uri">
                <td>
                    <a class="active" href="{@link}">
                        <xsl:value-of select="." />
                    </a>
                </td>
            </xsl:when>
            <xsl:when test="@link != $uri">
                <td>
                    <a href="{@link}">
                        <xsl:value-of select="." />
                    </a>
                </td>
            </xsl:when>
        </xsl:choose>
    </xsl:template>


    <!--Меню для объявлений (главная страница)-->
    <xsl:template match="udata[@module = 'content'][@method = 'menu']" mode="announcements_menu">
        <nav class="ads-menu">
            <div class="l-col">Объявления:</div>
            <div class="r-col">
                <table>
                    <tr>
                        <xsl:apply-templates select="items/item" />
                        <td>
                            <a href="{@link}">
                                <xsl:value-of select="item" />
                            </a>
                        </td>
                        <td class="ads-menu-add"><a href="#">добавить</a>
                        </td>
                    </tr>
                </table>
            </div>
        </nav>
    </xsl:template>

    <!--Меню для объявлений (остальные страницы)-->
    <xsl:template match="udata[@module = 'content'][@method = 'menu']" mode="announcements_menu_other">

        <aside class="align-c">
            <div class="ads-brief">
                <div class="std-title">Объявления</div>
                <nav>
                    <ul>
                        <!--выдача пунктов левого меню-->
                        <xsl:apply-templates select="items/item" mode="left_links" />

                    </ul>
                </nav>
                <div class="ads-brief-add">
                    <img src="{$template-resources}/images/plus22x22.jpg" alt="добавить объявление" />
                    <a href="#">добавить объявление</a>
                </div>
            </div>
            <div class="std-title">Поиск по карте</div>
            <div class="ymap-canvas">
                <img src="{$template-resources}/images/__ymap-brief.jpg" alt="ymap" />
            </div>
        </aside>
    </xsl:template>

    <!--шаблон для левого меню-->
    <xsl:template match="item" mode="left_links">
        <li>
            <a href="{@link}">
                <xsl:value-of select="." />
            </a>
        </li>
    </xsl:template>
</xsl:stylesheet>
