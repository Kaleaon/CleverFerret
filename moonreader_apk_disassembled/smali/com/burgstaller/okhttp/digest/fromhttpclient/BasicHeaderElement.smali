.class public Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;
.super Ljava/lang/Object;
.source "BasicHeaderElement.java"

# interfaces
.implements Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;
.implements Ljava/lang/Cloneable;


# instance fields
.field private final name:Ljava/lang/String;

.field private final parameters:[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

.field private final value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 44
    invoke-direct {p0, p1, p2, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;-><init>(Ljava/lang/String;Ljava/lang/String;[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 32
    iput-object p1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->name:Ljava/lang/String;

    .line 33
    iput-object p2, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->value:Ljava/lang/String;

    if-eqz p3, :cond_0

    .line 35
    iput-object p3, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->parameters:[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    return-void

    :cond_0
    const/4 p1, 0x0

    .line 37
    new-array p1, p1, [Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    iput-object p1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->parameters:[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    return-void

    .line 30
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Name may not be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 127
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x1

    if-ne p0, p1, :cond_1

    return v1

    .line 90
    :cond_1
    instance-of v2, p1, Lcom/burgstaller/okhttp/digest/fromhttpclient/HeaderElement;

    if-nez v2, :cond_2

    return v0

    .line 93
    :cond_2
    check-cast p1, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;

    .line 94
    iget-object v2, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->name:Ljava/lang/String;

    iget-object v3, p1, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->value:Ljava/lang/String;

    iget-object v3, p1, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->value:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/burgstaller/okhttp/digest/fromhttpclient/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->parameters:[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    iget-object p1, p1, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->parameters:[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    invoke-static {v2, p1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/LangUtils;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    return v1

    :cond_3
    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getParameter(I)Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->parameters:[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getParameterByName(Ljava/lang/String;)Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;
    .locals 3

    if-eqz p1, :cond_2

    const/4 v0, 0x0

    .line 73
    :goto_0
    iget-object v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->parameters:[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 74
    aget-object v1, v1, v0

    .line 75
    invoke-interface {v1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1

    .line 69
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Name may not be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getParameterCount()I
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->parameters:[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    array-length v0, v0

    return v0
.end method

.method public getParameters()[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->parameters:[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    invoke-virtual {v0}, [Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->value:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    const/16 v0, 0x11

    .line 100
    iget-object v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->name:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v0

    .line 101
    iget-object v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->value:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v0

    const/4 v1, 0x0

    .line 103
    :goto_0
    iget-object v2, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->parameters:[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    array-length v3, v2

    if-ge v1, v3, :cond_0

    .line 104
    aget-object v2, v2, v1

    invoke-static {v0, v2}, Lcom/burgstaller/okhttp/digest/fromhttpclient/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 112
    iget-object v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    iget-object v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->value:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 114
    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    iget-object v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    const/4 v1, 0x0

    .line 118
    :goto_0
    iget-object v2, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->parameters:[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    array-length v2, v2

    if-ge v1, v2, :cond_1

    .line 119
    const-string v2, "; "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    iget-object v2, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/BasicHeaderElement;->parameters:[Lcom/burgstaller/okhttp/digest/fromhttpclient/NameValuePair;

    aget-object v2, v2, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 123
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
