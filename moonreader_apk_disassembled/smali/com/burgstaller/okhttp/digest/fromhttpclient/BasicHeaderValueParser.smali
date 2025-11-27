.class public Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;
.super Ljava/lang/Object;
.source "BasicHeaderValueParser.java"


# static fields
.field private static final ALL_DELIMITERS:[C

.field public static final DEFAULT:Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private static final ELEM_DELIMITER:C = ','

.field public static final INSTANCE:Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;

.field private static final PARAM_DELIMITER:C = ';'


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    new-instance v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;

    invoke-direct {v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;-><init>()V

    sput-object v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->DEFAULT:Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;

    .line 28
    new-instance v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;

    invoke-direct {v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;-><init>()V

    sput-object v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->INSTANCE:Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;

    const/4 v0, 0x2

    .line 31
    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->ALL_DELIMITERS:[C

    return-void

    nop

    :array_0
    .array-data 2
        0x3bs
        0x2cs
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static isOneOf(C[C)Z
    .locals 4

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 144
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 147
    aget-char v3, p1, v2

    if-ne p0, v3, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method public static isWhitespace(C)Z
    .locals 1

    const/16 v0, 0x20

    if-eq p0, v0, :cond_1

    const/16 v0, 0x9

    if-eq p0, v0, :cond_1

    const/16 v0, 0xd

    if-eq p0, v0, :cond_1

    const/16 v0, 0xa

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static parseElements(Ljava/lang/String;Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderValueParser;)[Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/burgstaller/okhttp/digest/fromhttpclient/ParseException;
        }
    .end annotation

    .line 37
    const-string v0, "Value"

    invoke-static {p0, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 38
    new-instance v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;-><init>(I)V

    .line 39
    invoke-virtual {v0, p0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 40
    new-instance v1, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;

    const/4 v2, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-direct {v1, v2, p0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;-><init>(II)V

    if-eqz p1, :cond_0

    goto :goto_0

    .line 41
    :cond_0
    sget-object p1, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->INSTANCE:Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;

    :goto_0
    check-cast p1, Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderValueParser;

    move-object p0, p1

    check-cast p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderValueParser;

    invoke-interface {p1, v0, v1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderValueParser;->parseElements(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;)[Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;

    move-result-object p0

    return-object p0
.end method

.method public static parseHeaderElement(Ljava/lang/String;Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderValueParser;)Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/burgstaller/okhttp/digest/fromhttpclient/ParseException;
        }
    .end annotation

    .line 64
    const-string v0, "Value"

    invoke-static {p0, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 65
    new-instance v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;-><init>(I)V

    .line 66
    invoke-virtual {v0, p0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 67
    new-instance v1, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;

    const/4 v2, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-direct {v1, v2, p0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;-><init>(II)V

    if-eqz p1, :cond_0

    goto :goto_0

    .line 68
    :cond_0
    sget-object p1, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->INSTANCE:Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;

    :goto_0
    check-cast p1, Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderValueParser;

    move-object p0, p1

    check-cast p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderValueParser;

    invoke-interface {p1, v0, v1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderValueParser;->parseHeaderElement(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;)Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;

    move-result-object p0

    return-object p0
.end method

.method public static parseNameValuePair(Ljava/lang/String;Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderValueParser;)Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/burgstaller/okhttp/digest/fromhttpclient/ParseException;
        }
    .end annotation

    .line 130
    const-string v0, "Value"

    invoke-static {p0, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 131
    new-instance v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;-><init>(I)V

    .line 132
    invoke-virtual {v0, p0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 133
    new-instance v1, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;

    const/4 v2, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-direct {v1, v2, p0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;-><init>(II)V

    if-eqz p1, :cond_0

    goto :goto_0

    .line 134
    :cond_0
    sget-object p1, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->INSTANCE:Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;

    :goto_0
    check-cast p1, Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderValueParser;

    move-object p0, p1

    check-cast p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderValueParser;

    invoke-interface {p1, v0, v1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderValueParser;->parseNameValuePair(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;)Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    move-result-object p0

    return-object p0
.end method

.method public static parseParameters(Ljava/lang/String;Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderValueParser;)[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/burgstaller/okhttp/digest/fromhttpclient/ParseException;
        }
    .end annotation

    .line 91
    const-string v0, "Value"

    invoke-static {p0, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 92
    new-instance v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;-><init>(I)V

    .line 93
    invoke-virtual {v0, p0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 94
    new-instance v1, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;

    const/4 v2, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-direct {v1, v2, p0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;-><init>(II)V

    if-eqz p1, :cond_0

    goto :goto_0

    .line 95
    :cond_0
    sget-object p1, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->INSTANCE:Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;

    :goto_0
    check-cast p1, Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderValueParser;

    move-object p0, p1

    check-cast p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderValueParser;

    invoke-interface {p1, v0, v1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderValueParser;->parseParameters(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;)[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method protected createHeaderElement(Ljava/lang/String;Ljava/lang/String;[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;)Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;
    .locals 1

    .line 87
    new-instance v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;

    invoke-direct {v0, p1, p2, p3}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;-><init>(Ljava/lang/String;Ljava/lang/String;[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;)V

    return-object v0
.end method

.method protected createNameValuePair(Ljava/lang/String;Ljava/lang/String;)Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;
    .locals 1

    .line 235
    new-instance v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;

    invoke-direct {v0, p1, p2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public parseElements(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;)[Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;
    .locals 3

    .line 45
    const-string v0, "Char array buffer"

    invoke-static {p1, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 46
    const-string v0, "Parser cursor"

    invoke-static {p2, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 52
    :cond_0
    :goto_0
    invoke-virtual {p2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->atEnd()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 53
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;

    check-cast p1, [Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;

    return-object p1

    .line 56
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->parseHeaderElement(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;)Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;

    move-result-object v1

    .line 57
    invoke-interface {v1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_2

    invoke-interface {v1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 59
    :cond_2
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public parseHeaderElement(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;)Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;
    .locals 3

    .line 72
    const-string v0, "Char array buffer"

    invoke-static {p1, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 73
    const-string v0, "Parser cursor"

    invoke-static {p2, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 74
    invoke-virtual {p0, p1, p2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->parseNameValuePair(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;)Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    move-result-object v0

    .line 76
    invoke-virtual {p2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->atEnd()Z

    move-result v1

    if-nez v1, :cond_0

    .line 77
    invoke-virtual {p2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->getPos()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1, v1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->charAt(I)C

    move-result v1

    const/16 v2, 0x2c

    if-eq v1, v2, :cond_0

    .line 79
    invoke-virtual {p0, p1, p2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->parseParameters(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;)[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 83
    :goto_0
    invoke-interface {v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p2, v0, p1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->createHeaderElement(Ljava/lang/String;Ljava/lang/String;[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;)Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;

    move-result-object p1

    return-object p1
.end method

.method public parseNameValuePair(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;)Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;
    .locals 1

    .line 138
    sget-object v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->ALL_DELIMITERS:[C

    invoke-virtual {p0, p1, p2, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->parseNameValuePair(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;[C)Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    move-result-object p1

    return-object p1
.end method

.method public parseNameValuePair(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;[C)Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;
    .locals 12

    .line 158
    const-string v0, "Char array buffer"

    invoke-static {p1, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 159
    const-string v0, "Parser cursor"

    invoke-static {p2, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 161
    invoke-virtual {p2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->getPos()I

    move-result v0

    .line 162
    invoke-virtual {p2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->getPos()I

    move-result v1

    .line 165
    invoke-virtual {p2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->getUpperBound()I

    move-result v2

    :goto_0
    const/4 v3, 0x1

    const/4 v4, 0x0

    if-ge v0, v2, :cond_2

    .line 166
    invoke-virtual {p1, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->charAt(I)C

    move-result v5

    const/16 v6, 0x3d

    if-ne v5, v6, :cond_0

    goto :goto_1

    .line 171
    :cond_0
    invoke-static {v5, p3}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->isOneOf(C[C)Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v5, 0x1

    goto :goto_2

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    const/4 v5, 0x0

    :goto_2
    if-ne v0, v2, :cond_3

    .line 180
    invoke-virtual {p1, v1, v2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->substringTrimmed(II)Ljava/lang/String;

    move-result-object v1

    const/4 v5, 0x1

    goto :goto_3

    .line 182
    :cond_3
    invoke-virtual {p1, v1, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->substringTrimmed(II)Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    :goto_3
    if-eqz v5, :cond_4

    .line 187
    invoke-virtual {p2, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->updatePos(I)V

    const/4 p1, 0x0

    .line 188
    invoke-virtual {p0, v1, p1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->createNameValuePair(Ljava/lang/String;Ljava/lang/String;)Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    move-result-object p1

    return-object p1

    :cond_4
    move v6, v0

    const/4 v7, 0x0

    const/4 v8, 0x0

    :goto_4
    const/16 v9, 0x22

    if-ge v6, v2, :cond_9

    .line 194
    invoke-virtual {p1, v6}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->charAt(I)C

    move-result v10

    if-ne v10, v9, :cond_5

    if-nez v7, :cond_5

    xor-int/lit8 v8, v8, 0x1

    :cond_5
    if-nez v8, :cond_6

    if-nez v7, :cond_6

    .line 199
    invoke-static {v10, p3}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->isOneOf(C[C)Z

    move-result v11

    if-eqz v11, :cond_6

    goto :goto_6

    :cond_6
    if-eqz v7, :cond_8

    :cond_7
    const/4 v7, 0x0

    goto :goto_5

    :cond_8
    if-eqz v8, :cond_7

    const/16 v7, 0x5c

    if-ne v10, v7, :cond_7

    const/4 v7, 0x1

    :goto_5
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    :cond_9
    move v3, v5

    :goto_6
    if-ge v0, v6, :cond_a

    .line 212
    invoke-virtual {p1, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->charAt(I)C

    move-result p3

    invoke-static {p3}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HTTP;->isWhitespace(C)Z

    move-result p3

    if-eqz p3, :cond_a

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_a
    move p3, v6

    :goto_7
    if-le p3, v0, :cond_b

    add-int/lit8 v2, p3, -0x1

    .line 215
    invoke-virtual {p1, v2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HTTP;->isWhitespace(C)Z

    move-result v2

    if-eqz v2, :cond_b

    add-int/lit8 p3, p3, -0x1

    goto :goto_7

    :cond_b
    sub-int v2, p3, v0

    const/4 v4, 0x2

    if-lt v2, v4, :cond_c

    .line 219
    invoke-virtual {p1, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->charAt(I)C

    move-result v2

    if-ne v2, v9, :cond_c

    add-int/lit8 v2, p3, -0x1

    invoke-virtual {p1, v2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->charAt(I)C

    move-result v2

    if-ne v2, v9, :cond_c

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 p3, p3, -0x1

    .line 224
    :cond_c
    invoke-virtual {p1, v0, p3}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->substring(II)Ljava/lang/String;

    move-result-object p1

    if-eqz v3, :cond_d

    add-int/lit8 v6, v6, 0x1

    .line 229
    :cond_d
    invoke-virtual {p2, v6}, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->updatePos(I)V

    .line 230
    invoke-virtual {p0, v1, p1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->createNameValuePair(Ljava/lang/String;Ljava/lang/String;)Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    move-result-object p1

    return-object p1
.end method

.method public parseParameters(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;)[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;
    .locals 3

    .line 99
    const-string v0, "Char array buffer"

    invoke-static {p1, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 100
    const-string v0, "Parser cursor"

    invoke-static {p2, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 101
    invoke-virtual {p2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->getPos()I

    move-result v0

    .line 103
    invoke-virtual {p2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->getUpperBound()I

    move-result v1

    :goto_0
    if-ge v0, v1, :cond_1

    .line 104
    invoke-virtual {p1, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->charAt(I)C

    move-result v2

    .line 105
    invoke-static {v2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HTTP;->isWhitespace(C)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 110
    :cond_1
    :goto_1
    invoke-virtual {p2, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->updatePos(I)V

    .line 111
    invoke-virtual {p2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->atEnd()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 p1, 0x0

    .line 112
    new-array p1, p1, [Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    return-object p1

    .line 114
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 116
    :cond_3
    invoke-virtual {p2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->atEnd()Z

    move-result v1

    if-nez v1, :cond_4

    .line 117
    invoke-virtual {p0, p1, p2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueParser;->parseNameValuePair(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;)Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    move-result-object v1

    .line 118
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    invoke-virtual {p2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->getPos()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1, v1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->charAt(I)C

    move-result v1

    const/16 v2, 0x2c

    if-ne v1, v2, :cond_3

    .line 125
    :cond_4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    check-cast p1, [Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    return-object p1
.end method
