<?xml version="1.0" encoding="UTF-8"?>
   <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     <xsl:output method="html" encoding="utf-8"/>
     <xsl:template match="/">
            <html>
            <head>
                <title>
                    <xsl:value-of select="/result/page/name"/>
                </title>
                <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
                <meta name="description" content=""/>
                <meta name="viewport" content="width=device-width"/>
                <link rel="stylesheet" href="{$template-resources}/css/boilerplate.css"/>
                <link rel="stylesheet" href="{$template-resources}/css/common.css"/>
                <link rel="stylesheet" href="{$template-resources}/css/style.css"/>
                <script src="{$template-resources}/js/modernizr-2.5.3.js"></script>
                <script src="{$template-resources}/js/jquery-1.10.1.min.js"></script>
                <script src="{$template-resources}/js/jquery.formstyler.min.js"></script>
                <script src="{$template-resources}/js/main.js"></script>
                <!--Подлючаем API Yandex-->
                <!-- <script src="http://api-maps.yandex.ru/2.1/?load=package.full&amp;lang=ru-RU" type="text/javascript"></script> -->

            </head>

           <body>
           <div class="main-wrp">
                <div class="onek-wrp clearfix">
                  <div class="l-col">
                    <div class="header">
                      <a href="/" title="Animal life" class="h-logo">
                        <img src="{$template-resources}/images/logo.jpg" alt="Animal life"/>
                          <div>
                            <img src="{$template-resources}/images/logos.png" alt="logos"/>
                          </div>
                        </a>
                      <div class="h-office">
                        <!--Здравствуйте, <a href="#">Ольга!</a>-->
                        <a href="#" class="i-reg">Регистрация</a>  /
                        <a class="i-reg" href="#">Вход</a>
                      </div>
                      <div class="h-add_comment">
                        <div>Добавь отзыв, получи</div>
                        <a class="underdotted" href="#">1000 рублей!</a>
                      </div>
<!--                       <form class="l-search" action="/" method="post">
                        <input type="image" src="{$template-resources}/images/ok37x37.jpg" alt="GO" class="l-search-img"/>
                        <input type="text" name="q" class="std-input" placeholder="Поиск"/>
                      </form> -->
                    </div>
                  </div>
                  <div class="r-col">
                    <div class="h-comments_total">Отзывов всего
                      <b>
                        <a class="underdotted" href="#">
                          6258
                        </a>
                      </b>
                    </div>
                    <b>
                      <a class="underdotted" href="#">
                        Санкт-Петербург
                      </a>
                    </b>
                    <xsl:apply-templates select="document('udata://content/menu/0/2/katalogi')/udata" mode = "menu"/>
                    <div class="h-search tab-me">
                      <ul class="tabs-h">
                        <li>Поиск по каталогу</li>
                        <li>Поиск по объявлениям</li>
                      </ul>
                      <div class="tabs-c std-block">
                        <div>
                          <form action="/" method="post">
                            например, <a href="#" class="underdotted">магазин Зоомама</a>
                            <div class="std-row">
                              <input type="text" class="std-input" name="text"/>
                            </div>
                            <div class="std-row">
                              <select name="district" class="style-me">
                                <option value="-1">Любой район</option>
                                <option value="1">Центральный</option>
                                <option value="2">Не очень</option>
                                <option value="3">Приморский</option>
                              </select>
                            </div>
                            <div class="std-row">
                              <select name="metro" class="style-me">
                                <option value="-1">Любое метро</option>
                                <option value="1">Адмиралтейская</option>
                                <option value="2">Большевиков проспект</option>
                                <option value="3">Василеостровская</option>
                              </select>
                              <button type="submit" class="std-btn">Найти</button>
                            </div>
                          </form>
                        </div>
                        <div>
                          <form action="/" method="post">
                            например, магазин sdsfsdfd
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                  <nav class="ads-menu">
                    <div class="l-col">Объявления:</div>
                    <div class="r-col">
                      <table>
                        <tr>
                          <td><a class="active" href="#">Брачные</a></td>
                          <td><a href="#">Куплю</a></td>
                          <td><a href="#">Продам</a></td>
                          <td><a href="#">Возьму</a></td>
                          <td><a href="#">Отдам</a></td>
                          <td><a href="#">Потеряшка</a></td>
                          <td><a href="#">Работа</a></td>
                          <td class="ads-menu-add"><a href="#">добавить</a></td>
                        </tr>
                      </table>
                    </div>
                  </nav>
                  <section class="ymap-main std-block clearfix">
                    <div class="l-col">
                      <div><input id="cb_1" type="checkbox" name="cb_1" value="1"/><label for="cb_1">Ветеринарные клиники</label></div>
                      <div><input id="cb_2" type="checkbox" name="cb_2" value="1"/><label for="cb_2">Зоомагазины</label></div>
                      <div><input id="cb_3" type="checkbox" name="cb_3" value="1"/><label for="cb_3">Гостиницы и приюты</label></div>
                      <div><input id="cb_4" type="checkbox" name="cb_4" value="1"/><label for="cb_4">Ветеринаные лабаратории</label></div>
                      <div><input id="cb_5" type="checkbox" name="cb_5" value="1"/><label for="cb_5">Ветеринарные аптеки</label></div>
                      <div><input id="cb_6" type="checkbox" name="cb_6" value="1"/><label for="cb_6">Питомники</label></div>
                      <div><input id="cb_7" type="checkbox" name="cb_7" value="1"/><label for="cb_7">Выставочные залы</label></div>
                    </div>
                    <div class="r-col" style="background-color: blue">yandex-map</div>
                  </section>
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
                </div>
              </div>
           </body>
        </html>
     </xsl:template>
</xsl:stylesheet>
