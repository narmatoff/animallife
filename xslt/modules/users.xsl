<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.01" encoding="utf-8" indent="yes"/>

  <xsl:template match="users">
    <html>
      <head>...</head>
      <body>
        <div class="greeting">
          <xsl:apply-templates select="result/user"/>
        </div>

        <div class="content">
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="user">
    <p>Здравствуйте, гость!</p>
  </xsl:template>


  <xsl:template match="user[@status = 'auth']">

    <xsl:apply-templates select="document(concat('uobject://', @id))/udata/object"/>
  </xsl:template>

  <xsl:template match="object">
    <p>Здравствуйте,
        <xsl:value-of select=".//property[@name = 'fname']/value"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select=".//property[@name = 'lname']/value"/>!
    </p>
    <p>Ваш логин:
        <xsl:value-of select=".//property[@name = 'login']/value"/>
    </p>
    <p>Последний раз вы были здесь:
       <xsl:value-of select="document(concat('udata://system/convertDate/',
        .//property[@name = 'last_request_time']/value, '/(d.m.Y%20(H:i))'))"/>
    </p>
  </xsl:template>

</xsl:stylesheet>
