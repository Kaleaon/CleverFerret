.class public abstract Lorg/apache/commons/net/ftp/parser/RegexFTPFileEntryParserImpl;
.super Lorg/apache/commons/net/ftp/FTPFileEntryParserImpl;
.source "RegexFTPFileEntryParserImpl.java"


# instance fields
.field protected _matcher_:Ljava/util/regex/Matcher;

.field private pattern:Ljava/util/regex/Pattern;

.field private result:Ljava/util/regex/MatchResult;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 69
    invoke-direct {p0}, Lorg/apache/commons/net/ftp/FTPFileEntryParserImpl;-><init>()V

    const/4 v0, 0x0

    .line 70
    invoke-direct {p0, p1, v0}, Lorg/apache/commons/net/ftp/parser/RegexFTPFileEntryParserImpl;->compileRegex(Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 88
    invoke-direct {p0}, Lorg/apache/commons/net/ftp/FTPFileEntryParserImpl;-><init>()V

    .line 89
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/net/ftp/parser/RegexFTPFileEntryParserImpl;->compileRegex(Ljava/lang/String;I)V

    return-void
.end method

.method private compileRegex(Ljava/lang/String;I)V
    .locals 2

    .line 195
    :try_start_0
    invoke-static {p1, p2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object p2

    iput-object p2, p0, Lorg/apache/commons/net/ftp/parser/RegexFTPFileEntryParserImpl;->pattern:Ljava/util/regex/Pattern;
    :try_end_0
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 197
    :catch_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unparseable regex supplied: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method


# virtual methods
.method public getGroupCnt()I
    .locals 1

    .line 116
    iget-object v0, p0, Lorg/apache/commons/net/ftp/parser/RegexFTPFileEntryParserImpl;->result:Ljava/util/regex/MatchResult;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 119
    :cond_0
    invoke-interface {v0}, Ljava/util/regex/MatchResult;->groupCount()I

    move-result v0

    return v0
.end method

.method public getGroupsAsString()Ljava/lang/String;
    .locals 3

    .line 147
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x1

    .line 148
    :goto_0
    iget-object v2, p0, Lorg/apache/commons/net/ftp/parser/RegexFTPFileEntryParserImpl;->result:Ljava/util/regex/MatchResult;

    invoke-interface {v2}, Ljava/util/regex/MatchResult;->groupCount()I

    move-result v2

    if-gt v1, v2, :cond_0

    .line 149
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ") "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lorg/apache/commons/net/ftp/parser/RegexFTPFileEntryParserImpl;->result:Ljava/util/regex/MatchResult;

    invoke-interface {v2, v1}, Ljava/util/regex/MatchResult;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "line.separator"

    .line 150
    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 149
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 152
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public group(I)Ljava/lang/String;
    .locals 1

    .line 133
    iget-object v0, p0, Lorg/apache/commons/net/ftp/parser/RegexFTPFileEntryParserImpl;->result:Ljava/util/regex/MatchResult;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 136
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/regex/MatchResult;->group(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public matches(Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x0

    .line 101
    iput-object v0, p0, Lorg/apache/commons/net/ftp/parser/RegexFTPFileEntryParserImpl;->result:Ljava/util/regex/MatchResult;

    .line 102
    iget-object v0, p0, Lorg/apache/commons/net/ftp/parser/RegexFTPFileEntryParserImpl;->pattern:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/net/ftp/parser/RegexFTPFileEntryParserImpl;->_matcher_:Ljava/util/regex/Matcher;

    .line 103
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 104
    iget-object p1, p0, Lorg/apache/commons/net/ftp/parser/RegexFTPFileEntryParserImpl;->_matcher_:Ljava/util/regex/Matcher;

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->toMatchResult()Ljava/util/regex/MatchResult;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/net/ftp/parser/RegexFTPFileEntryParserImpl;->result:Ljava/util/regex/MatchResult;

    .line 106
    :cond_0
    iget-object p1, p0, Lorg/apache/commons/net/ftp/parser/RegexFTPFileEntryParserImpl;->result:Ljava/util/regex/MatchResult;

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public setRegex(Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x0

    .line 164
    invoke-direct {p0, p1, v0}, Lorg/apache/commons/net/ftp/parser/RegexFTPFileEntryParserImpl;->compileRegex(Ljava/lang/String;I)V

    const/4 p1, 0x1

    return p1
.end method

.method public setRegex(Ljava/lang/String;I)Z
    .locals 0

    .line 179
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/net/ftp/parser/RegexFTPFileEntryParserImpl;->compileRegex(Ljava/lang/String;I)V

    const/4 p1, 0x1

    return p1
.end method
