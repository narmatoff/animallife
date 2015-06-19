<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">


<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<!-- Список товаров -->

	<xsl:template match="result[@module = 'catalog' and @method = 'category'][page/@parentId='0']">
		<xsl:param name="catId" select="document('udata://catalog/getCategoryList/')/udata/items/item[position()=1]/@id"/>


		<xsl:apply-templates select="document('udata://catalog/getCategoryList/')/udata/items/item" mode="category_list_parrent"/>

	</xsl:template>




	<xsl:template match="item" mode="category_list_main">
        <xsl:variable name="page" select="document(concat('upage://', @id))/udata/page"/>
        <li><a href="{@link}" title="{.}">
        	<xsl:call-template name="thumbing">
                                            <xsl:with-param name="source" select="$page/properties/group/property[@name='menu_pic_a']/value" />
                                            <xsl:with-param name="width" select="140" />
                                            <xsl:with-param name="height">140</xsl:with-param>
            </xsl:call-template>

        	</a>
        </li>


    </xsl:template>


    <xsl:template match="item" mode="category_list_parrent">
        <xsl:variable name="page" select="document(concat('upage://', @id))/udata/page"/>
      <div class="product-section">
                <xsl:if test="$page/properties/group/property[@name='header_pic']">
        <xsl:attribute name="style">background:url('<xsl:value-of select="$page/properties/group/property[@name='header_pic']/value" />')</xsl:attribute>
        </xsl:if>
                        <!-- <img src="{$template-resources}images/__section1.png" alt="some section" align="right"/> -->
                        <div class="name"><xsl:value-of select="."/></div>
                        <div class="opener">
                            <xsl:choose>
                                <xsl:when test="position()=1">
                                    Развернуть
                                </xsl:when>
                                <xsl:otherwise>
                                    Развернуть
                                </xsl:otherwise>
                            </xsl:choose>
                        </div>
                       <!--  <a href="#">Перейти в раздел</a> -->
        </div>
                    <div class="product-section-items">
                        <xsl:if test="position()=1">
                           <xsl:attribute name="style">display:none</xsl:attribute>
                        </xsl:if>
                        <xsl:apply-templates select="document(concat('udata://catalog/getCategoryList/notemplate/', @id))/udata/items/item" mode="category_list_level2"/>



                    </div>

    </xsl:template>

    <xsl:template match="item" mode="category_list">
        <xsl:variable name="page" select="document(concat('upage://', @id))/udata/page"/>
      <div class="product-section">
                <xsl:if test="$page/properties/group/property[@name='header_pic']">
        <xsl:attribute name="style">background:url('<xsl:value-of select="$page/properties/group/property[@name='header_pic']/value" />')</xsl:attribute>
        </xsl:if>
                        <!-- <img src="{$template-resources}images/__section1.png" alt="some section" align="right"/> -->
                        <div class="name"><xsl:value-of select="."/></div>
                        <div class="opener">
                            <xsl:choose>
                                <xsl:when test="position()=1">
                                    Свернуть
                                </xsl:when>
                                <xsl:otherwise>
                                    Развернуть
                                </xsl:otherwise>
                            </xsl:choose>
                        </div>
                       <!--  <a href="#">Перейти в раздел</a> -->
        </div>
                    <div class="product-section-items">
                        <xsl:if test="position()=1">
                           <xsl:attribute name="style">display:block</xsl:attribute>
                        </xsl:if>
                        <xsl:apply-templates select="document(concat('udata://catalog/getCategoryList/notemplate/', @id))/udata/items/item" mode="category_list_level2"/>



                    </div>

    </xsl:template>

     <xsl:template match="item" mode="category_list_level2">

         <span style="color: #4D4D4D; font-size: 24px; display: block;  margin-bottom: 13px;">
                            <xsl:value-of select="."/>
                        </span>
                        <xsl:apply-templates select="document(concat('udata://catalog/getObjectsList//',@id,'/20//10/'))/udata" mode="catalogus">

                            </xsl:apply-templates>
         <div style="clear:both"></div>

    </xsl:template>


	<xsl:template match="result[@module = 'catalog' and @method = 'category'][page/@parentId!='0']">
	<xsl:variable name="cat" select="document(concat('udata://catalog/getCategoryList/notemplate/', @pageId))/udata/items/item"/>
	<div class="product-section">
        <xsl:if test="page/properties/group/property[@name='header_pic']">
             <xsl:attribute name="style">background:url('<xsl:value-of select="page/properties/group/property[@name='header_pic']/value" />')</xsl:attribute>
        </xsl:if>

                        <!-- <img src="{$template-resources}images/__section1.png" alt="some section" align="right"/> -->
                        <div class="name"><xsl:value-of select="@header"/></div>

                       <!--  <a href="#">Перейти в раздел</a> -->
        </div>

        <div class="product-section-items" style="display:block">
            <xsl:choose>
            	<xsl:when test="$cat">
            		 <xsl:apply-templates select="document(concat('udata://catalog/getCategoryList/notemplate/', @pageId))/udata/items/item" mode="category_list_level2"/>
            	</xsl:when>
            	<xsl:otherwise>
            		<xsl:apply-templates select="document(concat('udata://catalog/getObjectsList//',@pageId))/udata" mode="catalogus"/>
            	</xsl:otherwise>
            </xsl:choose>




        </div>
	</xsl:template>



	<xsl:template match="field" mode="properties_title">
		<th><xsl:value-of select="@title"  disable-output-escaping="yes"/></th>
	</xsl:template>


	<xsl:template match="udata[lines|items]" mode="catalogus">

		<xsl:apply-templates select="lines/item" mode="catalog_item" />
		<xsl:apply-templates select="items/item" mode="catalog_item" />

	</xsl:template>
	<xsl:template match="udata" mode="catalogus">

		<p>К сожалению таких товаров не найдено!</p>

	</xsl:template>

<!-- Товар в списке -->
		<xsl:template match="item|page" mode="catalog_item">
		<xsl:variable name="item" select="document(concat('upage://', @id))/udata" />
		<xsl:variable name="item_spec" select="document(concat('uobject://',$item/page/properties/group/property[@name='tip_specpredlozheniya']/value/item/@id))/udata/object/properties/group/property[@name='class']/value" />
		<xsl:variable name="par_link" select="document(concat('upage://', $item/page/@parentId))/udata/page/@link"/>

             <a class="product-block" href="{@link}" title="item-name">

                            <xsl:call-template name="thumbing">
                                            <xsl:with-param name="source" select="$item/page/properties/group/property[@name='kartinka_1']/value" />
                                            <xsl:with-param name="width" select="160" />
                                            <xsl:with-param name="height">159</xsl:with-param>
                            </xsl:call-template>
                           <!--  <img src="{$template-resources}images/__selectDeviceItem.jpg" alt="item-name"/> -->
                            <div class="description">
                                <xsl:if test="not (@id&#062;891 and @id&#060;1034)">
                                    <p><xsl:value-of select="."/></p>
                                </xsl:if>

                                <xsl:value-of select="$item/page/properties/group/property[@name='short_opisanie']/value" disable-output-escaping="yes"/>
                            </div>
                            <xsl:if test="$item/page/properties/group/property[@name='tip_specpredlozheniya']">
                            	<div>

		                        	<xsl:attribute name="class">list&nbsp;l-<xsl:value-of select="$item_spec"/></xsl:attribute>

		                        	<xsl:value-of select="$item/page/properties/group/property[@name='tip_specpredlozheniya']/value/item/@name" disable-output-escaping="yes"/>

	                        </div>
                            </xsl:if>


                        </a>



	</xsl:template>


	<xsl:template match="item|page" mode="catalog_item_main">

		<xsl:variable name="item" select="document(concat('upage://', @id))/udata" />
		<xsl:variable name="item_spec" select="document(concat('uobject://',$item/page/properties/group/property[@name='tip_specpredlozheniya']/value/item/@id))/udata/object/properties/group/property[@name='class']/value" />
		<xsl:variable name="item_size" select="document(concat('uobject://',$item/page/properties/group/property[@name='ramer_bloka']/value/item/@id))/udata/object/properties/group/property[@name='class']/value" />

			 <a href="{$item/page/@link}" style="background-image: url('{$template-resources}images/__main-baner1.jpg')">
			 	<xsl:attribute name="class"><xsl:value-of select="$item_size"/>-baner&nbsp;b-<xsl:value-of select="$item_spec"/>&nbsp;main-block</xsl:attribute>
                <xsl:attribute name="style">
                    background-image: url('<xsl:value-of select="$item/page/properties/group/property[@name='kartinka_dlya_akcii']/value" disable-output-escaping="no"/>')
                </xsl:attribute>
                    <div class="description">
                        <p><xsl:value-of select="$item/page/properties/group/property[@name='zagolovok_dlya_glavnoj']/value" disable-output-escaping="yes"/></p>
                        <xsl:value-of select="$item/page/properties/group/property[@name='tekst']/value" disable-output-escaping="yes"/>
                        <xsl:value-of select="$item/page/properties/group/property[@name='anons']/value" disable-output-escaping="yes"/>

                    </div>
                    <div class="title">
                        <div>
                        	<xsl:attribute name="class">list&nbsp;l-<xsl:value-of select="$item_spec"/></xsl:attribute>

                        	<xsl:value-of select="$item/page/properties/group/property[@name='tip_specpredlozheniya']/value/item/@name" disable-output-escaping="yes"/>

                        </div>
                    </div>
             </a>

	</xsl:template>



<!--поиск товара -->

<xsl:template match="result[@module = 'catalog' and @method = 'category'][@pageId='24']">
<xsl:apply-templates select="document('udata://catalog/search/(/ceny/ceny1/1_etazh/)/')/udata" mode="search_form"/>
<xsl:variable name="text" select="document('udata://catalog/search/(/produkciya/vertex_premium/szu/)')/udata"/>
                    <h1>Для <xsl:value-of select="$text/group/field[@name='novoe_pole']/values/item[@selected='selected']"/><xsl:text>&nbsp; </xsl:text><xsl:value-of select="$text/group/field[@name='model_ustrojstva']/values/item[@selected='selected']"/></h1>
                    По вашему запросу найдено <xsl:value-of select="document('udata://catalog/getObjectsList/notemplate/(mode=all)')/udata/total"/> аксессуаров


                    <xsl:apply-templates select="document('udata://catalog/getCategoryList//5/')/udata/items/item" mode="catalog_item_podbor"/>


</xsl:template>




    <xsl:template match="item|page" mode="catalog_item_podbor">
        <xsl:if test="document(concat('udata://catalog/getObjectsList//',@id,'///10/'))/udata/lines">
            <h2> <xsl:value-of select="."/></h2>
                    <xsl:apply-templates select="document(concat('udata://catalog/getObjectsList//',@id,'///10/'))/udata" mode="catalogus"/>
        </xsl:if>


    </xsl:template>



	<!-- Страница товара -->
	<xsl:template match="result[@module = 'catalog' and @method = 'object']">
		<xsl:variable name="item_spec" select="document(concat('uobject://',page/properties/group/property[@name='tip_specpredlozheniya']/value/item/@id))/udata/object/properties/group/property[@name='class']/value" />
		<div class="card-images">
                        <a class="fancy" id="bigimaga" href="{page/properties/group/property[@name='kartinka_1']/value}">
                        	<xsl:call-template name="thumbing">
                                            <xsl:with-param name="source" select="page/properties/group/property[@name='kartinka_1']/value" />
                                            <xsl:with-param name="width" select="279" />
                                            <xsl:with-param name="height">auto</xsl:with-param>
                            </xsl:call-template>
                        </a>
                        <div class="thumbs">
                            <xsl:apply-templates select="page/properties/group[@name='kartinki']/property" mode="property_image"/>


                        </div>
                        <xsl:if test="page/properties/group/property[@name='tip_specpredlozheniya']">
                            	<div>

		                        	<xsl:attribute name="class">list&nbsp;l-<xsl:value-of select="$item_spec"/></xsl:attribute>

		                        	<xsl:value-of select="page/properties/group/property[@name='tip_specpredlozheniya']/value/item/@name" disable-output-escaping="yes"/>

	                        	</div>
                        </xsl:if>

                    </div>
                    <div class="card-description">
                        <h1 class="border-delimiter"><xsl:value-of select="page/name" /></h1>
                        <div id="tabs-wraper">
                            <ul>
                                <xsl:apply-templates select="page/properties/group[@name='slajdy']/property" mode="property_link"/>
                                <xsl:if test="page/properties/group/property[@name='model_ustrojstva']">
                                    <li>Совместимость</li>
                                </xsl:if>
                            </ul>
                           <xsl:apply-templates select="page/properties/group[@name='slajdy']/property" mode="property"/>
                           <div>
                                <ul>
                                    <xsl:apply-templates select="page/properties/group/property[@name='model_ustrojstva']/value/item" mode="model_ustrojstva"/>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="social">
                        <script type="text/javascript">(function() {
          if (window.pluso)if (typeof window.pluso.start == "function") return;
          var d = document, s = d.createElement('script'), g = 'getElementsByTagName';
          s.type = 'text/javascript'; s.charset='UTF-8'; s.async = true;
          s.src = ('https:' == window.location.protocol ? 'https' : 'http')  + '://share.pluso.ru/pluso-like.js';
          var h=d[g]('head')[0] || d[g]('body')[0];
          h.appendChild(s);
          })();</script>
        <div class="pluso" data-options="medium,square,line,horizontal,counter,theme=01" data-services="vkontakte,facebook,twitter,google" data-background="transparent"></div>
                    </div>
	</xsl:template>

    <xsl:template match="item" mode="model_ustrojstva">
        <xsl:variable name="model" select="document(concat('uobject://',@id))/udata/object/properties/group/property[@name='marka']/value/item/@name"/>
            <li>
                <strong style="margin-right:10px"><xsl:value-of select="$model"/>:</strong>&nbsp;&nbsp; <xsl:value-of select="@name"/>
            </li>
    </xsl:template>

    <xsl:template match="property" mode="property_link">
            <li>
                <xsl:value-of select="title"/>
            </li>
    </xsl:template>

    <xsl:template match="property" mode="property">
            <div>
                 <xsl:value-of select="value"  disable-output-escaping="yes"/>
            </div>
    </xsl:template>
	<xsl:template match="udata" mode="search_form">
			<form class="popup" action="/podbor" method="GET">
				<input type="hidden" name="fields_filter[non_filtered]" value="0" />
					<xsl:apply-templates select="group" mode="search" />
					<!-- <xsl:apply-templates select="document('udata://catalog/search/(/katalog/proizvoditel_1/)/')/udata" mode="search_form"/>	 -->

                </form>


	</xsl:template>

    <xsl:template match="property" mode="property_image">
            <div class="small" rel="{value}" style="cursor:pointer">
                <xsl:attribute name="val">
                    <xsl:call-template name="thumsrc">
                                            <xsl:with-param name="source" select="value" />
                                            <xsl:with-param name="width" select="279" />
                                            <xsl:with-param name="height">auto</xsl:with-param>
                            </xsl:call-template>
                </xsl:attribute>
                <xsl:call-template name="thumbing">
                    <xsl:with-param name="source" select="value" />
                    <xsl:with-param name="width" select="80" />
                    <xsl:with-param name="height">80</xsl:with-param>
                </xsl:call-template>
            </div>
    </xsl:template>





	<xsl:template match="group" mode="search">

				<div>
					<xsl:apply-templates select="field" mode="search" />
				</div>
	</xsl:template>
	<xsl:template match="group[@name='podbor_2']" mode="search">

				<div>
					<xsl:apply-templates select="field" mode="search" />
					<button type="submit">Искать</button>
				</div>
	</xsl:template>




	<xsl:template match="field[@data-type = 'boolean']" mode="search">
		<div class="box">
			<input id="n{@id}" name="fields_filter[{@name}]" type="checkbox" value="1" class="check">
			<xsl:if test="checked">
					<xsl:attribute name="checked">checked</xsl:attribute>
			</xsl:if>
		</input>
			<label for="n{@id}"><xsl:value-of select="@title" /></label>
		</div>
	</xsl:template>

	<xsl:template match="field[ @data-type = 'int' or @data-type = 'float' or @data-type = 'string' ]" mode="search">

		<div class="block slider-block">
		 	<span class="name"><xsl:value-of select="@title"/></span>
				<div class="filtr-hold">
					<label>от</label>
						<input type="text" class="input-text min" name="fields_filter[{@name}][0]" value="{value_from}"/>
					<label>до</label>
						<input type="text" class="input-text max" name="fields_filter[{@name}][1]" value="{value_to}"/>
					<span class="sm">см</span>
				</div>
				<div class="slider-el">
					<input type="hidden" name="min" value="0" />
					<input type="hidden" name="max" value="300" />
				</div>
		</div>



	</xsl:template>






	<!-- <xsl:template
		match="field[@data-type = 'relation' or @data-type = 'symlink'][@name!='pennyj' or @name!='koncentrat']" mode="search">
		<span class="name"><xsl:value-of select="@title"/></span>
				<xsl:apply-templates select="values/item" mode="search">
					<xsl:sort select="@id"/>
					<xsl:with-param name="name" select="@name"/>
				</xsl:apply-templates>


	</xsl:template> -->

	<xsl:template match="field[@data-type = 'relation']" mode="search">

		<select id="{@name}" style="float: left; width:46%; margin: 5px;" name="fields_filter[{@name}]">
                <option value=""><xsl:value-of select="@title"/></option>
				<xsl:apply-templates select="values/item" mode="search_select"/>
		</select>




	</xsl:template>

	<xsl:template match="field/values/item" mode="search_select">
		<option value="{@id}">
			<xsl:value-of select="." />
		</option>



	</xsl:template>


	<xsl:template match="field/values/item" mode="search">
		<xsl:param name="name"/>
		<div class="box">

			<input id="n{@id}" name="fields_filter[{$name}][]" type="checkbox" value="{@id}" class="check">
				<xsl:if test="@selected">
						<xsl:attribute name="checked"></xsl:attribute>
				</xsl:if>
			</input>
			<label for="n{@id}"><xsl:value-of select="." /></label>
		</div>


	</xsl:template>










	<!--
		<xsl:template match="udata[@module = 'catalog' and @method =
		'getCategoryList']/items"> <ul umi:module="catalog"
		umi:element-id="{../@category-id}" umi:method="getCategoryList"
		umi:button-position="bottom left" umi:region="list"
		umi:sortable="sortable"> <xsl:apply-templates /> </ul> <br /> <br />
		</xsl:template> <xsl:template match="result[@module = 'catalog' and
		@method = 'object']"> <p> <xsl:apply-templates
		select="document(concat('udata://emarket/price/', page/@id))/udata" />
		</p> <p> <xsl:apply-templates
		select="document(concat('udata://emarket/stores/', page/@id))/udata"
		/> </p> <form method="post"
		action="/emarket/basket/put/element/{page/@id}/"> <input type="hidden"
		name="redirect-uri" value="{$request-uri}" /> <xsl:apply-templates
		select="page//group[@name = 'catalog_option_props']" /> <div
		class="buttons"> <input type="submit" value="Положить в корзину" />
		<xsl:text> </xsl:text> <input type="button" value="Добавить к
		сравнению" /> </div> </form> </xsl:template> <xsl:template
		match="group[@name = 'catalog_option_props']"> <h2> <xsl:text>Выберите
		дополнительные опции</xsl:text> </h2> <input type="hidden"
		name="redirect-uri" value="{$request-uri}" /> <xsl:apply-templates
		select="property[@type = 'optioned']" /> </xsl:template>
	-->
</xsl:stylesheet>
