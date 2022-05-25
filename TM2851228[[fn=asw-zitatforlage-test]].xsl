<?xml version="1.0" encoding="utf-8" ?>
<!--List of the external resources that we are referencing-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:b="http://schemas.openxmlformats.org/officeDocument/2006/bibliography">
	<!--When the bibliography or citation is in your document, it's just HTML-->
	<xsl:output method="html" encoding="us-ascii"/>
	<!--Match the root element, and dispatch to its children-->
	<xsl:template match="/">
		<xsl:apply-templates select="*"/>
		<xsl:choose>
			<xsl:when test="b:StyleNameLocalized">
				<xsl:choose>
					<xsl:when test="b:StyleNameLocalized/b:Lcid='1031'">
						<xsl:text>ASW</xsl:text>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!--Set an optional version number for this style-->
	<xsl:template match="b:version">
		<xsl:text>2006.5.07</xsl:text>
	</xsl:template>
	
	
	<!--  -->
	<!-- Bücher -->
	<!--  -->

	<!--Specifies which fields should appear in the Create Source dialog box when in a collapsed state (The Show All Bibliography Fields check box is cleared)-->
	<xsl:template match="b:GetImportantFields[b:SourceType = 'Book']">
		<b:ImportantFields>
			<b:ImportantField>
				<xsl:text>b:Author/b:Author/b:NameList</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:Title</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:Edition</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:Year</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:City</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:Publisher</xsl:text>
			</b:ImportantField>
		</b:ImportantFields>
	</xsl:template>
	
	<!--Defines the output format for a simple Book (in the Bibliography) with important fields defined-->
	<xsl:template match="b:Source[b:SourceType = 'Book']">
		<!--Label the paragraph as an Office Bibliography paragraph-->
		<p>
			<xsl:for-each select="b:Author/b:Author/b:NameList/b:Person">
				<xsl:value-of select="b:Last"/>
				<xsl:text>, </xsl:text>
				<xsl:value-of select="b:First"/>
				<xsl:if test="not(position() = last ())">
					<xsl:text>/</xsl:text>
				</xsl:if>
			</xsl:for-each>
			<xsl:text>: </xsl:text>
			<i>
				<xsl:value-of select="b:Title"/>
			</i>
			<xsl:if test="b:Edition !=''">
				<xsl:text>. </xsl:text>
				<xsl:value-of select="b:Edition"/>
				<xsl:text>. Auflage</xsl:text>
			</xsl:if>
			<xsl:text>, </xsl:text>
			<xsl:value-of select="b:City"/>
			<xsl:text>: </xsl:text>
			<xsl:value-of select="b:Publisher"/>
			<xsl:text>, </xsl:text>
			<xsl:value-of select="b:Year"/>
		</p>
	</xsl:template>
	
	<!--  -->
	<!-- /Bücher -->
	<!--  -->
	
	
	<!--  -->
	<!-- Internet-Quelle -->
	<!--  -->

	<!--Specifies which fields should appear in the Create Source dialog box when in a collapsed state (The Show All Bibliography Fields check box is cleared)-->
	<xsl:template match="b:GetImportantFields[b:SourceType = 'DocumentFromInternetSite']">
		<b:ImportantFields>
			<b:ImportantField>
				<xsl:text>b:Author/b:Author/b:NameList</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:Author/b:Editor/b:NameList</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:Title</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:Year</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:Month</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:Day</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:InternetSiteTitle</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:YearAccessed</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:MonthAccessed</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:DayAccessed</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:URL</xsl:text>
			</b:ImportantField>
		</b:ImportantFields>
	</xsl:template>
	
	<!--Defines the output format for a simple DocumentFromInternetSite (in the Bibliography) with important fields defined-->
	<xsl:template match="b:Source[b:SourceType = 'DocumentFromInternetSite']| b:Source[b:BIBTEX_Entry = 'documentfrominternetsite']">
		<!--Label the paragraph as an Office Bibliography paragraph-->
		<p>
			<xsl:for-each select="b:Author/b:Author/b:NameList/b:Person">
				<xsl:value-of select="b:Last"/>
				<xsl:text>, </xsl:text>
				<xsl:value-of select="b:First"/>
				<xsl:if test="not(position() = last ())">
					<xsl:text>/</xsl:text>
				</xsl:if>
			</xsl:for-each>
			<xsl:text>: </xsl:text>
			<i>
				<xsl:value-of select="b:Title"/>
			</i>
			<xsl:text>. </xsl:text>
			<xsl:if test="b:Day !=''">
				<xsl:value-of select="b:Day"/>
				<xsl:text>.</xsl:text>
			</xsl:if>
			<xsl:if test="b:Month !=''">
				<xsl:value-of select="b:Month"/>
				<xsl:text>.</xsl:text>
			</xsl:if>
			<xsl:value-of select="b:Year"/>
			<xsl:text>, </xsl:text>
			<xsl:value-of select="b:URL"/>
			<xsl:text>, (Zugriff </xsl:text>
			<xsl:if test="b:DayAccessed != ''">
				<xsl:value-of select="b:DayAccessed"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="b:MonthAccessed"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="b:YearAccessed"/>
			</xsl:if>
			<xsl:if test="b:Issue != ''">
				<xsl:value-of select="b:Issue"/>
			</xsl:if>
			<xsl:text>)</xsl:text>
		</p>
	</xsl:template>
	
	<!--  -->
	<!-- /Internet-Quelle -->
	<!--  -->
	
	<!--  -->
	<!-- ArticleInAPeriodical -->
	<!--  -->

	<!--Specifies which fields should appear in the Create Source dialog box when in a collapsed state (The Show All Bibliography Fields check box is cleared)-->
	<xsl:template match="b:GetImportantFields[b:SourceType = 'ArticleInAPeriodical']">
		<b:ImportantFields>
			<b:ImportantField>
				<xsl:text>b:Author/b:Author/b:NameList</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:Title</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:PeriodicalTitle</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:Year</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:Pages</xsl:text>
			</b:ImportantField>
			<b:ImportantField>
				<xsl:text>b:Edition</xsl:text>
			</b:ImportantField>
		</b:ImportantFields>
	</xsl:template>
	
	<!--Defines the output format for a simple Book (in the Bibliography) with important fields defined-->
	<xsl:template match="b:Source[b:SourceType = 'ArticleInAPeriodical']| b:Source[b:BIBTEX_Entry = 'articleinaperiodical']">
		<!--Label the paragraph as an Office Bibliography paragraph-->
		<p>
			<xsl:for-each select="b:Author/b:Author/b:NameList/b:Person">
				<xsl:value-of select="b:Last"/>
				<xsl:text>, </xsl:text>
				<xsl:value-of select="b:First"/>
				<xsl:if test="not(position() = last ())">
					<xsl:text>/</xsl:text>
				</xsl:if>
			</xsl:for-each>
			<xsl:text>: </xsl:text>
			<i>
				<xsl:value-of select="b:Title"/>
			</i>
			<xsl:text>. In: </xsl:text>
			<xsl:value-of select="b:PeriodicalTitle | b:JournalName"/>
			<xsl:text>, </xsl:text>
			<xsl:value-of select="b:Year"/>
				<xsl:if test="b:Edition !=''">
					<xsl:text>, </xsl:text>
				<xsl:value-of select="b:Edition"/>
			</xsl:if>
			<xsl:text>, S. </xsl:text>
			<xsl:value-of select="b:Pages"/>
		</p>
	</xsl:template>
	
	<!--  -->
	<!-- /ArticleInAPeriodical -->
	<!--  -->
	
	
	
	<!--Defines the output of the entire Bibliography-->
	<xsl:template match="b:Bibliography">
		<html xmlns="http://www.w3.org/TR/REC-html40">
			<body>
			<!--	<xsl:apply-templates select="b:Source[b:SourceType = 'Book']"/>
				<xsl:apply-templates select="b:Source[b:SourceType = 'ArticleInAPeriodical']"/>
				<xsl:apply-templates select="b:Source[b:SourceType = 'DocumentFromInternetSite']"/>
			-->
			
			<xsl:apply-templates select="b:Source">
				<xsl:sort order="ascending" select="b:Author/b:Author/b:NameList/b:Person[1]/b:Last"/>
			</xsl:apply-templates>
			</body>
		</html>
	</xsl:template>
	<!--Defines the output of the Citation-->
	<xsl:template match="b:Citation/b:Source[b:SourceType = 'Book']|b:Citation/b:Source[b:SourceType = 'DocumentFromInternetSite']|b:Citation/b:Source[b:SourceType = 'ArticleInAPeriodical'] |b:Citation/b:Source[b:BIBTEX_Entry = 'articleinaperiodical'] |b:Citation/b:Source[b:BIBTEX_Entry = 'documentfrominternetsite']">
		<html xmlns="http://www.w3.org/TR/REC-html40">
			<body>
				<xsl:if test="count(b:Author/b:Author/b:NameList/b:Person) &lt; 3">
					<!-- Defines the output format as Author, Year-->
					<xsl:for-each select="b:Author/b:Author/b:NameList/b:Person">
						<xsl:value-of select="b:Last"/>
						<xsl:if test="not(position() = last ())">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
					<xsl:text> (</xsl:text>
					<xsl:value-of select="b:Year"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
				<xsl:if test="count(b:Author/b:Author/b:NameList/b:Person) &gt; 2" >
					<!-- Defines the output format as Author, Year-->
						<xsl:value-of select="b:Author/b:Author/b:NameList/b:Person/b:Last[1]"/>
							<xsl:text> et al. </xsl:text>
					<xsl:text> (</xsl:text>
					<xsl:value-of select="b:Year"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="text()"/>
	
	
	<xsl:template match="text()"/>
</xsl:stylesheet>