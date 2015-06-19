<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet  [<!ENTITY nbsp "&#160;"> ]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="udata[@method = 'registrate']">
        <form id="registrate" enctype="multipart/form-data" method="post" action="/users/registrate_do/">
            <table>
                <tr class="w-pre-title">
                    <td>для тех, кто еще не с нами</td>
                </tr>
                <tr class="w-title">
                    <td>Регистрация</td>
                </tr>
                <tr>
                    <td>
                        <div>
                            <input type="text" class="std-input" name="email" placeholder="Ваш e-mail" form="registrate"/>
                            <span class="r-mark col-n"></span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div>
                            <input type="password" name="password" class="std-input" placeholder="Ваш пароль" form="registrate"/>
                            <span class="r-mark col-n"></span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div>
                            <input type="password" name="password_confirm" class="std-input" placeholder="Ваш пароль, еще раз" form="registrate"/>
                            <span class="r-mark col-n"></span>
                        </div>
                    </td>
                </tr>
                <tr class="w-submit">
                    <td><button type="submit" class="std-btn" form="registrate">Регистрация</button></td>
                </tr>
                <tr class="w-error">
                    <td>что-то не так с повторным вводом пароля</td>
                </tr>
            </table>
            <a href="#" class="w-close"><img src="{$template-resources}/images/window-close.jpg" alt="close"/></a>
        </form>

       <!--  <form id="registrate" enctype="multipart/form-data" method="post" action="/users/registrate_do/">
            <div>
                <xsl:text>Логин:</xsl:text>
                <input type="text" name="login" />
            </div>
            <div>
                <xsl:text>Пароль:</xsl:text>
                <input type="password" name="password" />
            </div>
            <div>
                <xsl:text>Повторите пароль:</xsl:text>
                <input type="password" name="password_confirm" />
            </div>
            <div>
                <xsl:text>Е-mail:</xsl:text>
                <input type="text" name="email" />
            </div>

            <xsl:apply-templates select="document(concat('udata://data/getCreateForm/', type_id))/udata" />

            <xsl:apply-templates select="document('udata://system/captcha')/udata" />
            <div>
                <input type="submit"  value="Зарегистрироваться" />
            </div>
        </form> -->
</xsl:template>

<xsl:template match="result[@module = 'users'][@method = 'registrate_done']">
        <h4>
            <xsl:text>Заголовок </xsl:text>
        </h4>
        <p>
            <xsl:text> Сообщение о пройденной регистрации </xsl:text>
        </p>
</xsl:template>



</xsl:stylesheet>
