.class public Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueFormatter;
.super Ljava/lang/Object;
.source "BasicHeaderValueFormatter.java"


# static fields
.field public static final DEFAULT:Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueFormatter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    new-instance v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueFormatter;

    invoke-direct {v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueFormatter;-><init>()V

    sput-object v0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueFormatter;->DEFAULT:Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueFormatter;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected doFormatValue(Ljava/lang/StringBuilder;Ljava/lang/String;Z)V
    .locals 4

    const/4 v0, 0x0

    if-nez p3, :cond_0

    const/4 v1, 0x0

    .line 44
    :goto_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    if-nez p3, :cond_0

    .line 45
    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result p3

    invoke-virtual {p0, p3}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueFormatter;->isSeparator(C)Z

    move-result p3

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const/16 v1, 0x22

    if-eqz p3, :cond_1

    .line 50
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 53
    :cond_1
    :goto_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 54
    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 55
    invoke-virtual {p0, v2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueFormatter;->isUnsafe(C)Z

    move-result v3

    if-eqz v3, :cond_2

    const/16 v3, 0x5c

    .line 56
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 59
    :cond_2
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    if-eqz p3, :cond_4

    .line 63
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_4
    return-void
.end method

.method public formatNameValuePair(Ljava/lang/StringBuilder;Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;Z)Ljava/lang/StringBuilder;
    .locals 1

    .line 30
    invoke-interface {p2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    invoke-interface {p2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_0

    const/16 v0, 0x3d

    .line 33
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 34
    invoke-virtual {p0, p1, p2, p3}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderValueFormatter;->doFormatValue(Ljava/lang/StringBuilder;Ljava/lang/String;Z)V

    :cond_0
    return-object p1
.end method

.method protected isSeparator(C)Z
    .locals 1

    .line 70
    const-string v0, " ;,:@()<>\\\"/[]?={}\t"

    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result p1

    if-ltz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method protected isUnsafe(C)Z
    .locals 1

    .line 74
    const-string v0, "\"\\"

    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result p1

    if-ltz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
