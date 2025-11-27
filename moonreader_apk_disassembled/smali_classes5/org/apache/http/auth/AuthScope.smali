.class public Lorg/apache/http/auth/AuthScope;
.super Ljava/lang/Object;
.source "AuthScope.java"


# static fields
.field public static final ANY:Lorg/apache/http/auth/AuthScope;

.field public static final ANY_HOST:Ljava/lang/String; = null

.field public static final ANY_PORT:I = -0x1

.field public static final ANY_REALM:Ljava/lang/String;

.field public static final ANY_SCHEME:Ljava/lang/String;


# instance fields
.field private final host:Ljava/lang/String;

.field private final origin:Lorg/apache/http/HttpHost;

.field private final port:I

.field private final realm:Ljava/lang/String;

.field private final scheme:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 75
    new-instance v0, Lorg/apache/http/auth/AuthScope;

    const/4 v1, -0x1

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1, v2, v2}, Lorg/apache/http/auth/AuthScope;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lorg/apache/http/auth/AuthScope;->ANY:Lorg/apache/http/auth/AuthScope;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 2

    .line 174
    sget-object v0, Lorg/apache/http/auth/AuthScope;->ANY_REALM:Ljava/lang/String;

    sget-object v1, Lorg/apache/http/auth/AuthScope;->ANY_SCHEME:Ljava/lang/String;

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/apache/http/auth/AuthScope;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1

    .line 162
    sget-object v0, Lorg/apache/http/auth/AuthScope;->ANY_SCHEME:Ljava/lang/String;

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/http/auth/AuthScope;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_0

    .line 110
    sget-object p1, Lorg/apache/http/auth/AuthScope;->ANY_HOST:Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Lorg/apache/http/auth/AuthScope;->host:Ljava/lang/String;

    if-gez p2, :cond_1

    const/4 p2, -0x1

    .line 111
    :cond_1
    iput p2, p0, Lorg/apache/http/auth/AuthScope;->port:I

    if-nez p3, :cond_2

    .line 112
    sget-object p3, Lorg/apache/http/auth/AuthScope;->ANY_REALM:Ljava/lang/String;

    :cond_2
    iput-object p3, p0, Lorg/apache/http/auth/AuthScope;->realm:Ljava/lang/String;

    if-nez p4, :cond_3

    .line 113
    sget-object p1, Lorg/apache/http/auth/AuthScope;->ANY_SCHEME:Ljava/lang/String;

    goto :goto_1

    :cond_3
    sget-object p1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p4, p1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    :goto_1
    iput-object p1, p0, Lorg/apache/http/auth/AuthScope;->scheme:Ljava/lang/String;

    const/4 p1, 0x0

    .line 114
    iput-object p1, p0, Lorg/apache/http/auth/AuthScope;->origin:Lorg/apache/http/HttpHost;

    return-void
.end method

.method public constructor <init>(Lorg/apache/http/HttpHost;)V
    .locals 2

    .line 148
    sget-object v0, Lorg/apache/http/auth/AuthScope;->ANY_REALM:Ljava/lang/String;

    sget-object v1, Lorg/apache/http/auth/AuthScope;->ANY_SCHEME:Ljava/lang/String;

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/http/auth/AuthScope;-><init>(Lorg/apache/http/HttpHost;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/http/HttpHost;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 132
    const-string v0, "Host"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 133
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/auth/AuthScope;->host:Ljava/lang/String;

    .line 134
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v0

    if-gez v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v0

    :goto_0
    iput v0, p0, Lorg/apache/http/auth/AuthScope;->port:I

    if-nez p2, :cond_1

    .line 135
    sget-object p2, Lorg/apache/http/auth/AuthScope;->ANY_REALM:Ljava/lang/String;

    :cond_1
    iput-object p2, p0, Lorg/apache/http/auth/AuthScope;->realm:Ljava/lang/String;

    if-nez p3, :cond_2

    .line 136
    sget-object p2, Lorg/apache/http/auth/AuthScope;->ANY_SCHEME:Ljava/lang/String;

    goto :goto_1

    :cond_2
    sget-object p2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p3, p2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    :goto_1
    iput-object p2, p0, Lorg/apache/http/auth/AuthScope;->scheme:Ljava/lang/String;

    .line 137
    iput-object p1, p0, Lorg/apache/http/auth/AuthScope;->origin:Lorg/apache/http/HttpHost;

    return-void
.end method

.method public constructor <init>(Lorg/apache/http/auth/AuthScope;)V
    .locals 1

    .line 181
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 182
    const-string v0, "Scope"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 183
    invoke-virtual {p1}, Lorg/apache/http/auth/AuthScope;->getHost()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/auth/AuthScope;->host:Ljava/lang/String;

    .line 184
    invoke-virtual {p1}, Lorg/apache/http/auth/AuthScope;->getPort()I

    move-result v0

    iput v0, p0, Lorg/apache/http/auth/AuthScope;->port:I

    .line 185
    invoke-virtual {p1}, Lorg/apache/http/auth/AuthScope;->getRealm()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/auth/AuthScope;->realm:Ljava/lang/String;

    .line 186
    invoke-virtual {p1}, Lorg/apache/http/auth/AuthScope;->getScheme()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/auth/AuthScope;->scheme:Ljava/lang/String;

    .line 187
    invoke-virtual {p1}, Lorg/apache/http/auth/AuthScope;->getOrigin()Lorg/apache/http/HttpHost;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/http/auth/AuthScope;->origin:Lorg/apache/http/HttpHost;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x1

    if-ne p1, p0, :cond_1

    return v1

    .line 278
    :cond_1
    instance-of v2, p1, Lorg/apache/http/auth/AuthScope;

    if-nez v2, :cond_2

    .line 279
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    .line 281
    :cond_2
    check-cast p1, Lorg/apache/http/auth/AuthScope;

    .line 282
    iget-object v2, p0, Lorg/apache/http/auth/AuthScope;->host:Ljava/lang/String;

    iget-object v3, p1, Lorg/apache/http/auth/AuthScope;->host:Ljava/lang/String;

    invoke-static {v2, v3}, Lorg/apache/http/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget v2, p0, Lorg/apache/http/auth/AuthScope;->port:I

    iget v3, p1, Lorg/apache/http/auth/AuthScope;->port:I

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Lorg/apache/http/auth/AuthScope;->realm:Ljava/lang/String;

    iget-object v3, p1, Lorg/apache/http/auth/AuthScope;->realm:Ljava/lang/String;

    invoke-static {v2, v3}, Lorg/apache/http/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lorg/apache/http/auth/AuthScope;->scheme:Ljava/lang/String;

    iget-object p1, p1, Lorg/apache/http/auth/AuthScope;->scheme:Ljava/lang/String;

    invoke-static {v2, p1}, Lorg/apache/http/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    return v1

    :cond_3
    return v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .line 203
    iget-object v0, p0, Lorg/apache/http/auth/AuthScope;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getOrigin()Lorg/apache/http/HttpHost;
    .locals 1

    .line 196
    iget-object v0, p0, Lorg/apache/http/auth/AuthScope;->origin:Lorg/apache/http/HttpHost;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .line 210
    iget v0, p0, Lorg/apache/http/auth/AuthScope;->port:I

    return v0
.end method

.method public getRealm()Ljava/lang/String;
    .locals 1

    .line 217
    iget-object v0, p0, Lorg/apache/http/auth/AuthScope;->realm:Ljava/lang/String;

    return-object v0
.end method

.method public getScheme()Ljava/lang/String;
    .locals 1

    .line 224
    iget-object v0, p0, Lorg/apache/http/auth/AuthScope;->scheme:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    const/16 v0, 0x11

    .line 323
    iget-object v1, p0, Lorg/apache/http/auth/AuthScope;->host:Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/apache/http/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v0

    .line 324
    iget v1, p0, Lorg/apache/http/auth/AuthScope;->port:I

    invoke-static {v0, v1}, Lorg/apache/http/util/LangUtils;->hashCode(II)I

    move-result v0

    .line 325
    iget-object v1, p0, Lorg/apache/http/auth/AuthScope;->realm:Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/apache/http/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v0

    .line 326
    iget-object v1, p0, Lorg/apache/http/auth/AuthScope;->scheme:Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/apache/http/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public match(Lorg/apache/http/auth/AuthScope;)I
    .locals 4

    .line 236
    iget-object v0, p0, Lorg/apache/http/auth/AuthScope;->scheme:Ljava/lang/String;

    iget-object v1, p1, Lorg/apache/http/auth/AuthScope;->scheme:Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/apache/http/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    .line 239
    :cond_0
    iget-object v0, p0, Lorg/apache/http/auth/AuthScope;->scheme:Ljava/lang/String;

    sget-object v2, Lorg/apache/http/auth/AuthScope;->ANY_SCHEME:Ljava/lang/String;

    if-eq v0, v2, :cond_1

    iget-object v0, p1, Lorg/apache/http/auth/AuthScope;->scheme:Ljava/lang/String;

    if-eq v0, v2, :cond_1

    return v1

    :cond_1
    const/4 v0, 0x0

    .line 243
    :goto_0
    iget-object v2, p0, Lorg/apache/http/auth/AuthScope;->realm:Ljava/lang/String;

    iget-object v3, p1, Lorg/apache/http/auth/AuthScope;->realm:Ljava/lang/String;

    invoke-static {v2, v3}, Lorg/apache/http/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    add-int/lit8 v0, v0, 0x2

    goto :goto_1

    .line 246
    :cond_2
    iget-object v2, p0, Lorg/apache/http/auth/AuthScope;->realm:Ljava/lang/String;

    sget-object v3, Lorg/apache/http/auth/AuthScope;->ANY_REALM:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    iget-object v2, p1, Lorg/apache/http/auth/AuthScope;->realm:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    return v1

    .line 250
    :cond_3
    :goto_1
    iget v2, p0, Lorg/apache/http/auth/AuthScope;->port:I

    iget v3, p1, Lorg/apache/http/auth/AuthScope;->port:I

    if-ne v2, v3, :cond_4

    add-int/lit8 v0, v0, 0x4

    goto :goto_2

    :cond_4
    if-eq v2, v1, :cond_5

    if-eq v3, v1, :cond_5

    return v1

    .line 257
    :cond_5
    :goto_2
    iget-object v2, p0, Lorg/apache/http/auth/AuthScope;->host:Ljava/lang/String;

    iget-object v3, p1, Lorg/apache/http/auth/AuthScope;->host:Ljava/lang/String;

    invoke-static {v2, v3}, Lorg/apache/http/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    add-int/lit8 v0, v0, 0x8

    return v0

    .line 260
    :cond_6
    iget-object v2, p0, Lorg/apache/http/auth/AuthScope;->host:Ljava/lang/String;

    sget-object v3, Lorg/apache/http/auth/AuthScope;->ANY_HOST:Ljava/lang/String;

    if-eq v2, v3, :cond_7

    iget-object p1, p1, Lorg/apache/http/auth/AuthScope;->host:Ljava/lang/String;

    if-eq p1, v3, :cond_7

    return v1

    :cond_7
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 294
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 295
    iget-object v1, p0, Lorg/apache/http/auth/AuthScope;->scheme:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 296
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x20

    .line 297
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 299
    :cond_0
    iget-object v1, p0, Lorg/apache/http/auth/AuthScope;->realm:Ljava/lang/String;

    if-eqz v1, :cond_1

    const/16 v1, 0x27

    .line 300
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 301
    iget-object v2, p0, Lorg/apache/http/auth/AuthScope;->realm:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 302
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 304
    :cond_1
    const-string v1, "<any realm>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    :goto_0
    iget-object v1, p0, Lorg/apache/http/auth/AuthScope;->host:Ljava/lang/String;

    if-eqz v1, :cond_2

    const/16 v1, 0x40

    .line 307
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 308
    iget-object v1, p0, Lorg/apache/http/auth/AuthScope;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    iget v1, p0, Lorg/apache/http/auth/AuthScope;->port:I

    if-ltz v1, :cond_2

    const/16 v1, 0x3a

    .line 310
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 311
    iget v1, p0, Lorg/apache/http/auth/AuthScope;->port:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 314
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
