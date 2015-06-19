<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" method="html" indent="yes"/>

    <!--Вывод каталога ветклиник-->
    <xsl:template match="item" mode="catalog">
        <table>
            <tr>
                <td>
                    <xsl:choose>
                        <xsl:when test="document(concat('upage://',@id,'.logo'))/udata/property/value">
                            <img src="{document(concat('udata://system/makeThumbnail/(.',document(concat('upage://',@id,'.logo'))/udata/property/value,')/95/(auto)'))/udata/src}" alt="logo"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <img src="{$template-resources}/images/__clinik.jpg" alt="nologo"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
                <td>
                    <h2><a class="underdotted" href="{@link}"><xsl:value-of select="."/></a></h2>

                    <p><xsl:value-of select="document(concat('upage://',@id,'.adres'))/udata/property/value" disable-output-escaping="yes"/>
                        <br/>
                        <a rel="nofollow" href="{document(concat('upage://',@id,'.web-adress'))/udata/property/value}"  target="_blank">
                            <xsl:value-of select="document(concat('upage://',@id,'.web-adress'))/udata/property/value" disable-output-escaping="yes" /></a>
                    </p>
                    <div class="companies-widgets">
                        <div class="rating-total">
                            <xsl:variable name="countcoment" select="document(concat('udata://comments/countComments/', @id)) /udata" />
                            <xsl:value-of select="$countcoment" disable-output-escaping= "yes" />
                            <!-- <xsl:value-of select="document(concat('udata://comments/countComments/', @id))/udata" disable-output-escaping= "yes" /> -->
                        </div>
                        <b>отзывов</b>
                        <a href="{@link}#addcomment"><img src="{$template-resources}/images/plus22x22.jpg" alt=""/><b>добавить отзыв</b>
                        </a>
                        <xsl:call-template name="raiting">
                            <xsl:with-param name="pageid" select="@id"/>
                            <xsl:with-param name="countcoment" select="document(concat('udata://comments/countComments/', @id)) /udata"/>
                        </xsl:call-template>
                    </div>
                </td>
            </tr>
        </table>
    </xsl:template>

    <!--Вывод страницы фирмы-->
    <xsl:template match="result[@module='catalog'][@method='object']">
        <xsl:apply-templates select="document('udata://core/navibar')/udata"/>
        <section>
            <h1><xsl:value-of select="/result/page/name"/></h1>
            <article class="list firm-info">
                <table>
                    <tr>
                        <td>
                            <xsl:if test="/result/page/properties/group/property[@name='logo']/value">
                                <img src="{document(concat('udata://system/makeThumbnail/(.', /result/page/properties/group/property[@name='logo']/value,')/200/(auto)'))/udata/src}" alt="logo"/>
                                <!-- <img src="{/result/page/properties/group/property[@name='logo']/value}" alt="logo"/> -->
                            </xsl:if>
                            <xsl:if test="not(/result/page/properties/group/property[@name='logo']/value)">
                                <img src="{$template-resources}/images/__clinik.jpg" alt="nologo"/>
                            </xsl:if>
                            <!-- <img src="{/result/page/properties/group/property[@name='izobrazhenie']/value}" alt="asdasd"/> -->
                        </td>
                        <td>
                            <p>
                                <xsl:value-of select="/result/page/properties/group/property[@name='address']/value" disable-output-escaping="yes" />
                                <br/>
                                <xsl:value-of select="/result/page/properties/group/property[@name='telefon']/value" disable-output-escaping="yes" />
                                <br/>
                                <xsl:value-of select="/result/page/properties/group/property[@name='metro']/title" disable-output-escaping="yes" />
                                &#160;
                                <xsl:value-of select="/result/page/properties/group/property[@name='metro']/value/item/@name" disable-output-escaping="yes" />
                                <br/>
                                <a rel="nofollow" href="{/result/page/properties/group/property[@name='web-adress']/value}" target="_blank">
                                <xsl:value-of select="/result/page/properties/group/property[@name='web-adress']/value" disable-output-escaping="yes" /></a>
                            </p>
                            <!--социальные сети-->
                            <p class="firm-socials">
                                <xsl:if test="/result/page/properties/group/property[@name = 'vk']/value">
                                    <a rel="nofollow" href="{/result/page/properties/group/property[@name = 'vk']/value}" target="_blank"></a>
                                </xsl:if>
                                <xsl:if test="/result/page/properties/group/property[@name = 'facebook']/value">
                                    <a rel="nofollow" class="fb" href="{/result/page/properties/group/property[@name = 'facebook']/value}" target="_blank"></a>
                                </xsl:if>
                                <xsl:if test="/result/page/properties/group/property[@name = 'twitter']/value">
                                    <a rel="nofollow" class="tw" href="{/result/page/properties/group/property[@name = 'twitter']/value}" target="_blank"></a>
                                </xsl:if>
                            </p>
                            <div class="std-title">Режим работы:</div>
                            <div class="firm-schedule">
                                <div class="day">Пн - Пт<br/>Сб<br/>Вс</div>
                                <div class="time">
                                    <div>
                                        <!-- Ебака, если ничего не заполнено -->
                                        <xsl:choose>
                                            <xsl:when test="/result/page/properties/group[@name='rezhim_raboty']/property[@name='budnij_den_s']/value and /result/page/properties/group[@name='rezhim_raboty']/property[@name='budnij_den_do']/value">
                                                <span class="r-mark col-g"></span>
                                                <xsl:value-of select="/result/page/properties/group[@name='rezhim_raboty']/property[@name='budnij_den_s']/value" disable-output-escaping="yes" />
                                                -
                                                <xsl:value-of select="/result/page/properties/group[@name='rezhim_raboty']/property[@name='budnij_den_do']/value" disable-output-escaping="yes" />
                                            </xsl:when>
                                            <xsl:when test="not(/result/page/properties/group[@name='rezhim_raboty']/property[@name='budnij_den_s']/value)">
                                                <span class="r-mark col-b"></span><br/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </div>
                                    <div>
                                        <xsl:choose>
                                            <xsl:when test="/result/page/properties/group[@name='rezhim_raboty']/property[@name='subbota_s']/value and /result/page/properties/group[@name='rezhim_raboty']/property[@name='subbota_do']/value">
                                                <span class="r-mark col-g"></span>
                                                <xsl:value-of select="/result/page/properties/group[@name='rezhim_raboty']/property[@name='subbota_s']/value" disable-output-escaping="yes" />
                                                -
                                                <xsl:value-of select="/result/page/properties/group[@name='rezhim_raboty']/property[@name='subbota_do']/value" disable-output-escaping="yes" />
                                            </xsl:when>
                                            <xsl:when test="not(/result/page/properties/group[@name='rezhim_raboty']/property[@name='subbota_s']/value)">
                                                <span class="r-mark col-b"></span><br/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </div>
                                    <div>
                                        <xsl:choose>
                                            <xsl:when test="/result/page/properties/group[@name='rezhim_raboty']/property[@name='voskresene_s']/value and /result/page/properties/group[@name='rezhim_raboty']/property[@name='voskresene_do']/value">
                                                <span class="r-mark col-g"></span>
                                                <xsl:value-of select="/result/page/properties/group[@name='rezhim_raboty']/property[@name='voskresene_s']/value" disable-output-escaping="yes" />
                                                -
                                                <xsl:value-of select="/result/page/properties/group[@name='rezhim_raboty']/property[@name='voskresene_do']/value" disable-output-escaping="yes" />
                                            </xsl:when>
                                            <xsl:when test="not(/result/page/properties/group[@name='rezhim_raboty']/property[@name='voskresene_s']/value)">
                                                <span class="r-mark col-b"></span>
                                            </xsl:when>
                                        </xsl:choose>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </article>
            <article class="firm-ymap">
                <a class="underdotted" href="#">скрыть карту</a>
                <div class="ymap" style="width: 444px; height: 400px" id="ymap">
                    <script type="text/javascript" charset="utf-8">
                        function init() {
                         var coord = ['<xsl:value-of select="/result/page/properties/group/property[@name='yandex_x']/value" disable-output-escaping="yes"/>', '<xsl:value-of select="/result/page/properties/group/property[@name='yandex_y']/value" disable-output-escaping="yes"/>'];
                         var myMap = new ymaps.Map("ymap", {
                             center: coord,
                             zoom: 15,
                             controls: ['zoomControl', 'typeSelector']
                         });
                         myMap.geoObjects.add(new ymaps.Placemark(coord, {
                                    balloonContentHeader: '<h3><xsl:value-of select="/result/page/name"/></h3>',
                                    balloonContentBody: '<xsl:value-of select="/result/page/properties/group/property[@name='address']/value" disable-output-escaping="yes" />',
                                    balloonContentFooter: '<xsl:value-of select="/result/parents/page[@parentId='42']/name" disable-output-escaping="yes" />'
                                }, {
                                    preset: 'islands#icon',
                                    iconColor: '#249CC8'
                                }));

                         }
                         ymaps.ready(init);
                    </script>
                </div>
            </article>
            <article class="firm-specs">
                <h2 class="std-title">Специализация</h2>
                <div class="list">
                    <xsl:apply-templates select="/result/page/properties/group/property[@name = 'specialization']/value/item/@name" mode='list'/>
                </div>
            </article>
            <article>
                <h2 class="std-title">Описание</h2>
                <div class="list"><xsl:value-of select="/result/page/properties/group/property[@name='description']/value" disable-output-escaping="yes" /></div>
            </article>
            <article>
                <h2 class="std-title">Фотогалерея</h2>
                <div class="list">
                <xsl:if test="/result/page/properties/group/property[@name='foto1']/value">
                    <a class="fancybox" href="{/result/page/properties/group/property[@name='foto1']/value}" data-fancybox-group="gallery">
                    <img src="{document(concat('udata://system/makeThumbnail/(.',/result/page/properties/group/property[@name='foto1']/value,')/200/(auto)'))/udata/src}" />
                    </a>
                </xsl:if>
                <xsl:if test="/result/page/properties/group/property[@name='foto2']/value">
                    <a class="fancybox" href="{/result/page/properties/group/property[@name='foto2']/value}" data-fancybox-group="gallery">
                    <img src="{document(concat('udata://system/makeThumbnail/(.',/result/page/properties/group/property[@name='foto2']/value,')/200/(auto)'))/udata/src}" />
                    </a>
                </xsl:if>
                </div>
            </article>
            <article class="list">
                <h2 class="std-title">Отзывы</h2>
                <a name="addcomment"></a>
                <div class="tab-me">
                    <ul class="tabs-h">
                        <li class="active">С оценками</li>
                        <!-- <li>Из социальных сетей</li> -->
                    </ul>
                    <div class="tabs-c">
                        <div>
                            <div class="firm-rating">
                                <div class="rating-total">
                                    <xsl:variable name="countcoment" select="document(concat('udata://comments/countComments/', page/@id)) /udata" />
                                    <xsl:value-of select="$countcoment" disable-output-escaping= "yes" />
                                </div>
                                <b>отзывов</b>
                                <xsl:call-template name="raiting">
                                    <xsl:with-param name="pageid" select="page/@id"/>
                                    <xsl:with-param name="countcoment" select="document(concat('udata://comments/countComments/', page/@id)) /udata"/>
                                </xsl:call-template>
                                <div class="tooltip-legend">
                                    <img src="{$template-resources}/images/notice.jpg" alt="Legend"/>
                                    <div class="tooltip">
                                        <ul class="legend">
                                            <li><div class="r-mark col-b"></div>оранжевый цвет показывает количество отрицательных отзывов</li>
                                            <li><div class="r-mark col-g"></div>зеленый цвет показывает количество положительных отзывов</li>
                                            <li><div class="r-mark col-n"></div>серый цвет показывает количество нейтральных отзывов</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <xsl:apply-templates select="user" mode="addcomment"/>
                        </div>
                        <!-- <div>Тут что-то из социальных сетей</div> -->
                    </div>
                </div>
            </article>
            <article>
                    <xsl:apply-templates select="document('udata://comments/insert/')/udata"/>
            </article>
        </section>

    </xsl:template>

    <xsl:template match="item/@name" mode="list">
        <p><span class="r-mark col-g"></span><xsl:value-of select="."/></p>
    </xsl:template>

    <!--Вывод объявлений-->
    <xsl:template match="item" mode="announcements">
        <section>
            <div class="list">
                <table>
                    <tr>
                        <td>
                            <img src="{$template-resources}/images/__clinik.jpg" alt="asdasd"/>
                        </td>
                        <td>
                            <h2>
                                <!--<a class="underdotted" href="{@link}">-->
                                    <xsl:value-of select="."/>
                                <!--</a>-->
                            </h2>
                            <p>
                                <b><xsl:value-of select="document(concat('upage://',@id,'.telefon'))/udata/property/value" disable-output-escaping ="yes"/><br/>
                                    <xsl:value-of select="document(concat('upage://',@id,'.imya'))/udata/property/value" disable-output-escaping ="yes"/>
                                </b>
                            </p>
                            <div class="list-item-merged">
                                <xsl:value-of select="document(concat('upage://',@id,'.soobwenie_polzovatelya'))/udata/property/value" disable-output-escaping ="yes"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </section>
    </xsl:template>


</xsl:stylesheet>
