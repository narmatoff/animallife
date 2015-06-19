<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:choose>
                        <xsl:when test="result[@module='catalog']/page[@parentId=11]">
                            Ветклиника <xsl:value-of select="/result/page/name" />: отзывы, адреса, телефоны в Санкт-Петербурге
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=18]">
                            Зоотакси <xsl:value-of select="/result/page/name" /> отзывы посетителей в Санкт-Петербурге
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=15]">
                            Ветаптека <xsl:value-of select="/result/page/name" />: отзывы, телефоны, адрес в Санкт-Петербурге
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=14]">
                            Зоомагазин <xsl:value-of select="/result/page/name" />: отзывы, адреса, контакты, цены
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=308]">
                            Ветеринарная лаборатория <xsl:value-of select="/result/page/name" /> отзывы в Санкт-Петербурге
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=537]">
                            Питомник <xsl:value-of select="/result/page/name" /> отзывы, адреса, телефоны в Санкт-Петербурге
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=188]">
                            Аквариумистика <xsl:value-of select="/result/page/name" />: отзывы, телефоны
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=191]">
                            <xsl:value-of select="/result/page/name" /> - отзывы о ветеринарной клинике на дому | Адреса, телефоны в Санкт-Петербурге
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=16]">
                            Гостиница <xsl:value-of select="/result/page/name" />: отзывы, фото, адреса, телефоны в Санкт-Петербурге
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=17]">
                            <xsl:value-of select="/result/page/name" /> - отзывы о приюте, адрес, контакты в Санкт-Петербурге
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=508]">
                            <xsl:value-of select="/result/page/name" /> - отзывы о интернет магазине для животных в Санкт-Петерубрге
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=530]">
                            <xsl:value-of select="/result/page/name" /> парикмахерский салон для животных: отзывы, адрес, контакты в Санкт-Петербурге
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=541]">
                            <xsl:value-of select="/result/page/name" /> бассейн для животных отзывы, адреса на карте в Санкт-Петербурге
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=524]">
                            <xsl:value-of select="/result/page/name" /> - оптовая торговля зоотоварами отзывы и адреса в Санкт-Петербурге
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="/result/page/name"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </title>
                <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

                <xsl:choose>
                        <xsl:when test="result[@module='catalog']/page[@parentId=11]">
                            <meta name="description" content="Большое количество отзывов о ветклинике {result/page/name}. Оставь свой отзыв на сайте animallife.ru"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=18]">
                            <meta name="description" content="Зоотакси {result/page/name}. Независимые отзывы от посетителей на animallife.ru"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=15]">
                            <meta name="description" content="{result/page/name}, ветаптека в Санкт-Петербурге. Оставить отзыв на сайте animallife.ru"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=14]">
                            <meta name="description" content="Зоомагазин {result/page/name} подробнее о фирме. Оставьте свой отзыв animallife.ru!"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=308]">
                            <meta name="description" content="Ветеринарная лаборатория {result/page/name} отзывы и адреса. Найти магазин на карте animallife.ru!"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=537]">
                            <meta name="description" content="Отзывы о питомнике {result/page/name}. Понравилась фирма, оставь отзыв на сайте animallife.ru!"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=188]">
                            <meta name="description" content="Узнать какие отзывы оставили об аквариумистике {result/page/name}. Не согласен, оставь свой!"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=191]">
                            <meta name="description" content="Узнать что люди пишут о {result/page/name} можно здесь, рейтинг ветеринарных на дому. Оставить свой отзыв на сайте animallife.ru."/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=16]">
                            <meta name="description" content="Все хорошие и плохие стороны гостиницы {result/page/name}. Как видишь ее ты, расскажи на сайте animallife.ru?"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=17]">
                            <meta name="description" content="Отзывы о приюте {result/page/name}. Проанализируйте, какой приют лучший на сайте animallife.ru!"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=508]">
                            <meta name="description" content="Узнать об интернет магазине для животных {result/page/name}. Animallife.ru - собраны все отзывы про услуги животным!"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=530]">
                            <meta name="description" content="Парикмахерская для животных {result/page/name} адреса и телефоны. Оставьте свой отзыв на данный салон animallife.ru."/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=541]">
                            <meta name="description" content="В Санкт-Петербурге, не так много бассейнов для животных. {result/page/name} хорош, или есть лучше, узнай отзывы от посетителей."/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=524]">
                            <meta name="description" content="Отзывы о {result/page/name}. Какая фирма лучше, узнай по отзывам на сайте отзовике animallife.ru."/>
                        </xsl:when>
                        <xsl:otherwise>
                            <meta name="description" content=""/>
                        </xsl:otherwise>
                    </xsl:choose>

                    <xsl:choose>
                        <xsl:when test="result[@module='catalog']/page[@parentId=11]">
                            <meta name="keywords" content="{result/page/name}, ветклиника {result/page/name} отзыв, {result/page/name} отзыв, {result/page/name} адрес, {result/page/name} телефон, ветклиника {result/page/name} телефон"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=18]">
                            <meta name="keywords" content="{result/page/name}, зоотакси {result/page/name} отзыв, {result/page/name} отзыв"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=15]">
                            <meta name="keywords" content="{result/page/name}, ветаптека {result/page/name} отзывы, {result/page/name} отзывы"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=14]">
                            <meta name="keywords" content="{result/page/name}, зоомагазин {result/page/name} отзывы, {result/page/name} отзывы"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=308]">
                            <meta name="keywords" content="{result/page/name}, ветеринарная лаборатория {result/page/name} отзывы, {result/page/name} отзывы"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=537]">
                            <meta name="keywords" content="{result/page/name}, питомник {result/page/name} отзыв, {result/page/name} отзыв, {result/page/name} адрес, {result/page/name} телефон, питомник {result/page/name} телефон"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=188]">
                            <meta name="keywords" content="{result/page/name}, аквариумистика {result/page/name} отзыв, {result/page/name} отзыв, {result/page/name} адрес, {result/page/name} телефон, аквариумистика {result/page/name} телефон"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=191]">
                            <meta name="keywords" content="{result/page/name}, {result/page/name} отзыв, {result/page/name} адрес, {result/page/name} телефон, аквариумистика {result/page/name} телефон"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=16]">
                            <meta name="keywords" content="{result/page/name}, гостиница {result/page/name} отзыв, {result/page/name} отзыв, {result/page/name} адрес, {result/page/name} телефон, гостиница {result/page/name} телефон"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=17]">
                            <meta name="keywords" content="{result/page/name}, приют {result/page/name} отзыв, {result/page/name} отзыв, {result/page/name} адрес, {result/page/name} телефон, приют {result/page/name} телефон"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=508]">
                            <meta name="keywords" content="{result/page/name}, интернет-магазин зоотоваров {result/page/name} отзыв, интернет-магазин для животных {result/page/name} отзыв, {result/page/name} отзыв, {result/page/name} адрес, {result/page/name} телефон, интернет-магазин зоотоваров {result/page/name} телефон"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=530]">
                            <meta name="keywords" content="{result/page/name}, парикмахерская {result/page/name} отзыв, парикмахерский салон {result/page/name} отзыв, {result/page/name} отзыв, {result/page/name} адрес, {result/page/name} телефон, парикмахерский салон {result/page/name} телефон"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=541]">
                            <meta name="keywords" content="{result/page/name}, бассейн {result/page/name} отзыв, бассейн для собак {result/page/name}, {result/page/name} отзыв, {result/page/name} адрес, {result/page/name} телефон, бассейн {result/page/name} телефон"/>
                        </xsl:when>
                        <xsl:when test="result[@module='catalog']/page[@parentId=524]">
                            <meta name="keywords" content="{result/page/name}, оптовая торговля {result/page/name} отзыв, зоотовары {result/page/name}, {result/page/name} отзыв, {result/page/name} адрес, {result/page/name} телефон, зоотовары оптом {result/page/name} телефон"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <meta name="keywords" content=""/>
                        </xsl:otherwise>
                    </xsl:choose>

                <meta name="viewport" content="width=device-width"/>
                <xsl:if test="$p&gt;0 or result/@pageId='106'">
                    <meta name="robots" content="noindex,follow"/>
                </xsl:if>
                <link rel="stylesheet" href="{$template-resources}/css/boilerplate.css"/>
                <link rel="stylesheet" href="{$template-resources}/css/common.css"/>
                <link rel="stylesheet" href="{$template-resources}/css/style.css"/>
                <link rel="stylesheet" href="{$template-resources}/css/jquery-ui.min.css"/>
                <link rel="stylesheet" href="{$template-resources}/css/jquery.fancybox.css?v=2.1.5" media="screen" />
                <link href="/images/icons/favicon.ico" rel="shortcut icon" type="image/x-icon" />
                <script src="{$template-resources}/js/modernizr-2.5.3.js"></script>
                <script src="{$template-resources}/js/jquery-1.10.1.min.js"></script>
                <script src="{$template-resources}/js/jquery-ui.min.js"></script>
                <script src="{$template-resources}/js/jquery.formstyler.min.js"></script>
                <script src="{$template-resources}/js/jquery.mousewheel-3.0.6.pack.js"></script>
                <script src="{$template-resources}/js/jquery.fancybox.js"></script>

                <script src="{$template-resources}/js/main.js"></script>
                <!--Подлючаем API Yandex-->
                <script src="http://api-maps.yandex.ru/2.1/?load=package.full&amp;lang=ru-RU" type="text/javascript"></script>

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
                                <!-- <div class="h-office">
                                    <a href="#" class="i-reg">Регистрация</a> /
                                    <a class="i-reg" href="#">Вход</a>
                                </div> -->

                                    <div class="h-add_comment">
                                        <a class="underdotted" href="/comp_add"><div>Добавь компанию</div></a>
                                        <span>помоги наполнить каталог</span>
                                    </div>

                            <!--Условия вывода поиска или добавления отзывов-->
                                <xsl:choose>
                                    <xsl:when test="/result/page/@is-default = 1">
                                        <!-- <div class="h-add_comment">
                                            <div>Добавь отзыв, получи</div>
                                            <a class="underdotted" href="#">1000 рублей!</a>
                                        </div> -->
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <form class="l-search" action="/find_result" method="post">
                                            <input type="image" src="{$template-resources}/images/ok37x37.jpg" alt="GO"
                                                   class="l-search-img"/>
                                            <input type="text" name="fields_filter[{/udata/group/field[@name='nazvanie']/@name}]" class="std-input" placeholder="Поиск"/>
                                        </form>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </div>


                            <!--Левая панель -->
                            <!--Вывод меню для всех страниц кроме главной-->
<!--                             <xsl:if test="not(/result/page/@is-default = 1) ">
                                <xsl:apply-templates select="document('udata://content/menu/0/2/obyavleniya')/udata" mode = "announcements_menu_other"/>
                            </xsl:if> -->
                            <!-- Конец условия вывода левой панели-->


                        </div>

                        <div class="r-col">
                            <div class="h-comments_total">
                                <span>Компаний всего
                                <b>
                                    <!-- <a class="underdotted" href="#"> -->
                                        <xsl:value-of select="document('udata://catalog/getObjectsList/0/42/0/0/5')/udata/total" disable-output-escaping="yes" />
                                    <!-- </a> -->
                                </b>
                                </span>
                                &#160;
                                <span>Отзывов всего
                                <b>
                                    <!-- <a class="underdotted" href="#"> -->
                                        <xsl:value-of select="document('udata://comments/countComments/all')" disable-output-escaping="yes" />
                                    <!-- </a> -->
                                </b>
                                </span>
                            </div>
                            <b >
                                <!-- <a class="underdotted" href="#"> -->
                                   <span style="color:#9d9d9d" > Санкт-Петербург </span>
                                <!-- </a> -->
                            </b>
                            <!--меню -->
                            <xsl:apply-templates select="document('udata://content/menu/0/2/katalogi')/udata" mode = "menu">
                                <xsl:with-param name="uri" select="result/@request-uri"/>
                                <xsl:with-param name="otherCatList" select="(document('udata://catalog/getCategoryList/0/42/5000/1')/udata/items/item[position()>6])"/>
                            </xsl:apply-templates>

                            <!--Поиск-->
                            <xsl:if test="result/page/@is-default = 1" >
                                <xsl:apply-templates select="document('udata://catalog/search/11')" mode = 'find_catalog'/>
                            </xsl:if>

                            <!--контент остальных страниц-->
                            <xsl:if test="not(/result/page/@is-default = 1) ">
                                <xsl:apply-templates select="result"/>
                            </xsl:if>

                        </div>

                        <!--контент главноей -->
                        <xsl:if test="/result/page/@is-default = 1">
                            <xsl:apply-templates select="result"/>
                        </xsl:if>
                        <xsl:if test="/result/page/@id = 186">

                        </xsl:if>
                    </div>
                </div>
                <footer>
                    <div class="onek-wrp">
                        <nav class="f-right">
                            <ul>
<!--                                 <li>
                                    <a href="#">Написать отзыв</a>
                                </li>
                                <li>
                                    <a href="#">Добавить объявление</a>
                                </li> -->
                            </ul>
                        </nav>
                        <nav class="f-left">
                            <ul>
                                <li>
                                    <a href="/about">
                                        <b>О проекте</b>
                                    </a>
                                </li>
                                <li>
                                    <a href="/webforms">Обратная связь</a>
                                </li>
                                <li>
                                    <a href="/advertising" class="adverts">Реклама на сайте</a>
                                </li>
                            </ul>
                        </nav>
                        <div><!--DELETE THIS-->
                            <!-- <img src="{$template-resources}/images/li.jpg" alt="liveinternet"/> -->
                        </div>
                        <!-- <p class="f-soc">
                            <a href="#"></a>
                            <a class="fb" href="#"></a>
                            <a class="tw" href="#"></a>
                        </p> -->
                        <div class="f-info">2007 - 2015
                            <br/>
                            <a href="http://lum.ru/">Разработка компании ООО “Люм”</a>
                        </div>
                    </div>
                </footer>

                                <div class="popup-window">
                                    <div class="w-rightshadow">
                                    </div>
                                        <!-- <xsl:apply-templates select="document('udata://registrate')/udata" /> -->
                                        <!-- <xsl:apply-templates select="document('udata://users/auth/')/udata" /> -->
                                    </div>
<div class="popup-window">
    <div class="w-rightshadow"></div>
    <form action="/" id="reg-form"></form>
    <form action="/users/login_do/"  method="post">
         <label for="login"><b>Логин:</b></label><br />
           <input type="text" id="login" name="login" class="textinputs" value=""/><br />
           <label for="password"><b>Пароль:</b></label><br />
           <input type="password" id="password" name="password" class="textinputs" value=""/><br />
           <p>
            <input type="submit" value="Вход"/>
   </p>
    </form>
    <table>
        <tr class="w-pre-title">
            <td>для тех, кто еще не с нами</td>
            <td>добро пожаловать!</td>
        </tr>
        <tr class="w-title">
            <td>Регистрация</td>
            <td>Вход</td>
        </tr>
        <tr>
            <td><div><!--type="email"--><input type="text" class="std-input" name="text" placeholder="Ваш e-mail" form="reg-form" /><span class="r-mark col-n"></span></div></td>
            <td><div><!--type="email"--><input type="text" class="std-input" name="email" placeholder="Ваш e-mail" form="auth-form" /><span class="r-mark col-b"></span></div></td>
        </tr>
        <tr>
            <td><div><input type="password" name="password" class="std-input" placeholder="Ваш пароль" form="reg-form" /><span class="r-mark col-n"></span></div></td>
            <td><div><input type="password" name="password" class="std-input" placeholder="Ваш пароль" form="auth-form" /><span class="r-mark col-n"></span></div></td>
        </tr>
        <tr>
            <td><div><input type="password" name="password_conf" class="std-input" placeholder="Ваш пароль, еще раз" form="reg-form" /><span class="r-mark col-n"></span></div></td>
            <td></td>
        </tr>
        <tr class="w-submit">
            <td><button type="submit" class="std-btn" form="reg-form">Регистрация</button></td>
            <td><button type="submit" class="std-btn" form="auth-form">Вход</button></td>
        </tr>
        <tr class="w-error">
            <td>что-то не так с повторным вводом пароля</td>
            <td><a href="#">забыли пароль?</a></td>
        </tr>
    </table>
    <a href="#" class="w-close"><img src="{$template-resources}/images/window-close.jpg" alt="close" /></a>
</div>
<!--                 <div class="popup-window">
                    <div class="w-rightshadow"></div>

                    <form action="/" id="auth-form"></form>
                    <table>
                        <tr class="w-pre-title">
                            <td>для тех, кто еще не с нами</td>
                            <td>добро пожаловать!</td>
                        </tr>
                        <tr class="w-title">
                            <td>Регистрация</td>
                            <td>Вход</td>
                        </tr>
                        <tr>
                            <td>
                                <div> --><!--type="email"-->
                                   <!--  <input type="text" class="std-input" name="text" placeholder="Ваш e-mail"
                                           form="reg-form"/>
                                    <span class="r-mark col-n"></span>
                                </div>
                            </td>
                            <td>
                                <div> --><!--type="email"-->
<!--                                     <input type="text" class="std-input" name="email" placeholder="Ваш e-mail"
                                           form="auth-form"/>
                                    <span class="r-mark col-b"></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div>
                                    <input type="password" name="password" class="std-input" placeholder="Ваш пароль"
                                           form="reg-form"/>
                                    <span class="r-mark col-n"></span>
                                </div>
                            </td>
                            <td>
                                <div>
                                    <input type="password" name="password" class="std-input" placeholder="Ваш пароль"
                                           form="auth-form"/>
                                    <span class="r-mark col-n"></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div>
                                    <input type="password" name="password_conf" class="std-input"
                                           placeholder="Ваш пароль, еще раз" form="reg-form"/>
                                    <span class="r-mark col-n"></span>
                                </div>
                            </td>
                            <td></td>
                        </tr>
                        <tr class="w-submit">
                            <td>
                                <button type="submit" class="std-btn" form="reg-form">Регистрация</button>
                            </td>
                            <td>
                                <button type="submit" class="std-btn" form="auth-form">Вход</button>
                            </td>
                        </tr>
                        <tr class="w-error">
                            <td>что-то не так с повторным вводом пароля</td>
                            <td>
                                <a href="#">забыли пароль?</a>
                            </td>
                        </tr>
                    </table>
                    <a href="#" class="w-close">
                        <img src="{$template-resources}/images/window-close.jpg" alt="close"/>
                    </a>
                </div> -->
            </body>


<!-- Yandex.Metrika counter -->
<script type="text/javascript">
(function (d, w, c) {
    (w[c] = w[c] || []).push(function() {
        try {
            w.yaCounter9423637 = new Ya.Metrika({id:9423637,
                    webvisor:true,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true});
        } catch(e) { }
    });

    var n = d.getElementsByTagName("script")[0],
        s = d.createElement("script"),
        f = function () { n.parentNode.insertBefore(s, n); };
    s.type = "text/javascript";
    s.async = true;
    s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js";

    if (w.opera == "[object Opera]") {
        d.addEventListener("DOMContentLoaded", f, false);
    } else { f(); }
})(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="//mc.yandex.ru/watch/9423637" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
        </html>
    </xsl:template>
</xsl:stylesheet>
