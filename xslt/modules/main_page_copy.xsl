<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" method="html" indent="yes"/>
    <xsl:template match="result[@module='content'][@method = 'content']">


        <!--Объявления-->

        <!--меню -->
        <xsl:apply-templates select="document('udata://content/menu/0/2/obyavleniya')/udata" mode = "announcements_menu"/>

        <!--поиск ветклиник по карте-->
        <section class="ymap-main std-block clearfix">
            <div class="l-col categories_class">
                <!--Список инпутов-->
             <xsl:apply-templates select="document('udata://catalog/getCategoryList/notemplate/42')/udata/items" mode = "category_catalog"/>
            </div>


            <div class="r-col" style="background-color: white">
                <ul id='points' style='display:none'>
                <xsl:apply-templates select="document('udata://catalog/getObjectsList/0/42/0/0/5')/udata/lines/item" mode="address_maps"/>
                </ul>

                <script type="text/javascript">

                    ymaps.ready(init);
                    var myMap, myPlacemark;

                    function init(){
                    myMap = new ymaps.Map ("map", {
                    center: [59.939095, 30.315868],
                    zoom: 10,
                    });
                    }

                    function drawPoint() {
                    myMap.geoObjects.each(function(context) {
                    myMap.geoObjects.remove(context);
                    });

                    $('#points li.OnMap').each(function(key, value){

                    var myGeocoder = ymaps.geocode($(value).text());

                    myGeocoder.then(
                    function (res) {
                    myMap.geoObjects.add(res.geoObjects);

                    }
                    );
                    });
                    }

                    $(function(){

                    $('.categories_class').on('change', 'input', function(){
                    $('#points li').removeClass('OnMap');

                    $('.categories_class input:checked').each(function(key, value){

                    var parentId = $(value).attr('id');
                    $('#points li[data-parent-id='+parentId+']').addClass('OnMap');

                    })
                    drawPoint();


                    });
                    })

                </script>

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
                <table>
                    <tr>
                        <td class="list-item-name"><a href="#">Конный супермаркет Фаворит</a><span>зоо магазин</span></td>
                        <td class="list-item-rating"><div class="rating-total">0</div><div class="rating-bar"><div class="col-b"></div><div class="col-n"></div><div class="col-g"></div></div></td>
                        <td>пока нет отзывов, <a href="#">вы можете стать первым</a>!</td>
                    </tr>
                    <tr>
                        <td class="list-item-name"><a href="#">Зоо Мама</a><span>ветклиника</span></td>
                        <td class="list-item-rating"><div class="rating-total">25</div><div class="rating-bar"><div class="col-b" data-tooltip="17" style="width:65%"></div><div class="col-n" data-tooltip="1" style="width:4%"></div><div data-tooltip="7" class="col-g" style="width:31%"></div></div></td>
                        <td>была в магазине, довольно просторный, правда, консервов хилс там нет(<div><a href="#">читать полностью</a></div></td>
                    </tr>
                </table>
            </div>
        </section>
    </xsl:template>

    <!--Шаблон вывода адресов-->
    <xsl:template match="item" mode="address_maps">
        <xsl:if test="document(concat('upage://',@id,'.adres'))/udata/property/value">
        <li data-parent-id="{document(concat('upage://',@id))/udata/page/@parentId}">
        <xsl:value-of select="document(concat('upage://',@id,'.adres'))/udata/property/value"  />
            <!--parent_id = <xsl:value-of select="document(concat('upage://',@id))/udata/page/@parentId" />-->

        </li>

    </xsl:if>
    </xsl:template>

    <!--Шаблон списка интпутов-->
    <xsl:template match="item" mode="category_catalog">
        <div >
            <input id="{@id}" type="checkbox" name="{@id}" value="1"/>
            <label for="{@id}"><xsl:value-of select="."/></label>
        </div>
    </xsl:template>


</xsl:stylesheet>

