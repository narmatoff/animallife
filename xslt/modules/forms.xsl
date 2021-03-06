<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet  [

 <!ENTITY middot "·">
 <!ENTITY copy "©">
 <!ENTITY nbsp "  ">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="result[@module = 'webforms'][@method = 'page']">
		<h1>
			<strong>
				<xsl:value-of select="page/properties/group/property[@name='h1']/value" disable-output-escaping="yes" />
			</strong>
		</h1>
		<xsl:if test="page/properties/group/property/value = 130">
			<p>Уважаемый пользователь! Мы работаем над автомизацией процесса добавление компаний.<br/>Скоро добавление будет производится автоматически!</p>
		</xsl:if>
		<xsl:variable name="form_id" select="page/properties/group/property[@name='form_id']/value" />
		<xsl:apply-templates select="document('udata://system/listErrorMessages/udata/items')" mode="errors" />

		<xsl:apply-templates select="document(concat('udata://webforms/add/',$form_id))/udata[@form_id='111']" mode="usl" />
		<xsl:apply-templates select="document(concat('udata://webforms/add/',$form_id))/udata" mode="form" />
	</xsl:template>

	<!-- Шаблон вывода формы -->

	<xsl:template match="udata" mode="form">
    <xsl:param name="obj"/>

		<form method="post" action="/webforms/send/" id="webform" onsubmit="saveFormData(this); return true;">
			<input type="hidden" name="system_form_id" value="{@form_id}" />
			<!-- <input type="hidden" name="ref_onsuccess" value="/webforms/posted/" /> -->
			<input type="hidden" name="ref_onsuccess" value="/webforms/posted/{/udata/@form_id}/" />
			<xsl:apply-templates select="items/item[@selected= 'selected']" mode="adress" />
			<xsl:apply-templates select="groups/group [@name= 'dannye_formy']/field" mode="form-fields">
			<xsl:with-param name="object" select="$obj"/>
			</xsl:apply-templates>
			<!-- <xsl:apply-templates select="document('udata://system/captcha/')/udata" /> -->
			<p>
				<input type="submit" value="Отправить" />
			</p>
		</form>
		<script type="text/javascript">
			restoreFormData(document.getElementById('webform'));
    </script>
	</xsl:template>


	<xsl:template match="udata" mode="usl">
		<b>Форма заявки:</b>
		<br />
		<input type="radio" name="forma" value="0"/>
		краткая
		<br />
		<input  type="radio" name="forma" value="1"   checked="checked" />
		полная
		<br />
		<br />
		<br />
		<script type="text/javascript">
			$(document).ready(function() {




			$('input[name=forma]').click(function() {
			var v = parseInt($(this).attr('value'));
			if (v==0) $('div.norequired').hide();
			else $('div.norequired').show();
			});
			});
    </script>

	</xsl:template>
	<!-- Адресс, куда отправляется сообщение -->

	<xsl:template match="item" mode="adress">
		<input type="hidden" name="system_email_to" value="{@id}" />
	</xsl:template>

	<!-- ШАблоны полей -->
<xsl:template match="field[@name = 'naimenovanie_obekta']"
        mode="form-fields">
<xsl:param name="object"/>
        <div>
            <b>
                <xsl:value-of select="@title" />
                :
            </b>
            <span style="color:red">*</span>
            <br />
            <input maxlength="100" size="30" type="text" name="{@input_name}" value="{$object}" />
            <br />
            <br />
        </div>

    </xsl:template>
	<xsl:template match="field[@type = 'string' and @required='required'][@name != 'naimenovanie_obekta']"
		mode="form-fields">

		<div>
			<b>
				<xsl:value-of select="@title" />
				:
			</b>
			<span style="color:red">*</span>
			<br />
			<input maxlength="100" size="30" type="text" name="{@input_name}" placeholder="{@tip}" />
			<br />
			<br />
		</div>

	</xsl:template>
	<xsl:template match="field[@type = 'string'][not(@required)]"
		mode="form-fields">

		<div class="norequired">
			<b>
				<xsl:value-of select="@title" />
				:
			</b>

			<br />
			<input maxlength="100" size="30" type="text" name="{@input_name}" placeholder="{@tip}" />
			<br />
			<br />
		</div>

	</xsl:template>
	<xsl:template match="field[@type = 'text' and @required='required']"
		mode="form-fields">
		<div>
			<b>
				<xsl:value-of select="@title" />
				:
			</b>
			<span style="color:red">*</span>
			<br />
			<textarea rows="9" cols="50" name="{@input_name}" placeholder="{@tip}" />
			<br />
			<br />
		</div>
	</xsl:template>

	<xsl:template match="field[@type = 'text'][not(@required)]"
		mode="form-fields">
		<div class="norequired">
			<b>
				<xsl:value-of select="@title" />
				:
			</b>

			<br />
			<textarea rows="9" cols="50" name="{@input_name}" placeholder="{@tip}" />
			<br />
			<br />
		</div>
	</xsl:template>
	<xsl:template match="field[@type = 'relation' and @required='required']"
		mode="form-fields">
		<div>
			<b>
				<xsl:value-of select="@title" />
				:
			</b>
			<span style="color:red">*</span>
			<br />
			<select name="{@input_name}">
				<xsl:apply-templates select="values/item" mode="form-fields-option" />
			</select>
			<br />
			<br />
		</div>

	</xsl:template>

	<xsl:template match="field[@type = 'relation'][not(@required)]"
		mode="form-fields">
		<div class="norequired">
			<b>
				<xsl:value-of select="@title" />
				:
			</b>

			<br />
			<select name="{@input_name}">
				<xsl:apply-templates select="values/item" mode="form-fields-option" />
			</select>
			<br />
			<br />
		</div>

	</xsl:template>
	<xsl:template match="item" mode="form-fields-option">
		<option>
			<xsl:value-of select="." />
		</option>

	</xsl:template>
	<!-- Каптча  -->
	<!-- Ошибки  -->
	<xsl:template match="items " mode="errors">
<div class="errors">
		<xsl:value-of select="item" disable-output-escaping="yes" />
</div>
	</xsl:template>



	<xsl:template match="result[@module = 'webforms'][@method = 'posted']">
		<xsl:value-of select="document('udata://webforms/posted/')/udata" disable-output-escaping="yes" />
	</xsl:template>

</xsl:stylesheet>
