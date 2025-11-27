.class public final Lcom/dropbox/core/v2/files/DownloadZipError;
.super Ljava/lang/Object;
.source "DownloadZipError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/DownloadZipError$Serializer;,
        Lcom/dropbox/core/v2/files/DownloadZipError$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/files/DownloadZipError;

.field public static final TOO_LARGE:Lcom/dropbox/core/v2/files/DownloadZipError;

.field public static final TOO_MANY_FILES:Lcom/dropbox/core/v2/files/DownloadZipError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

.field private pathValue:Lcom/dropbox/core/v2/files/LookupError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 59
    new-instance v0, Lcom/dropbox/core/v2/files/DownloadZipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DownloadZipError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/DownloadZipError$Tag;->TOO_LARGE:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/DownloadZipError;->withTag(Lcom/dropbox/core/v2/files/DownloadZipError$Tag;)Lcom/dropbox/core/v2/files/DownloadZipError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/DownloadZipError;->TOO_LARGE:Lcom/dropbox/core/v2/files/DownloadZipError;

    .line 63
    new-instance v0, Lcom/dropbox/core/v2/files/DownloadZipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DownloadZipError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/DownloadZipError$Tag;->TOO_MANY_FILES:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/DownloadZipError;->withTag(Lcom/dropbox/core/v2/files/DownloadZipError$Tag;)Lcom/dropbox/core/v2/files/DownloadZipError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/DownloadZipError;->TOO_MANY_FILES:Lcom/dropbox/core/v2/files/DownloadZipError;

    .line 71
    new-instance v0, Lcom/dropbox/core/v2/files/DownloadZipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DownloadZipError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/DownloadZipError$Tag;->OTHER:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/DownloadZipError;->withTag(Lcom/dropbox/core/v2/files/DownloadZipError$Tag;)Lcom/dropbox/core/v2/files/DownloadZipError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/DownloadZipError;->OTHER:Lcom/dropbox/core/v2/files/DownloadZipError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/DownloadZipError;)Lcom/dropbox/core/v2/files/LookupError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/DownloadZipError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object p0
.end method

.method public static path(Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/DownloadZipError;
    .locals 2

    if-eqz p0, :cond_0

    .line 154
    new-instance v0, Lcom/dropbox/core/v2/files/DownloadZipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DownloadZipError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/DownloadZipError$Tag;->PATH:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/DownloadZipError;->withTagAndPath(Lcom/dropbox/core/v2/files/DownloadZipError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/DownloadZipError;

    move-result-object p0

    return-object p0

    .line 152
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/DownloadZipError$Tag;)Lcom/dropbox/core/v2/files/DownloadZipError;
    .locals 1

    .line 88
    new-instance v0, Lcom/dropbox/core/v2/files/DownloadZipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DownloadZipError;-><init>()V

    .line 89
    iput-object p1, v0, Lcom/dropbox/core/v2/files/DownloadZipError;->_tag:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    return-object v0
.end method

.method private withTagAndPath(Lcom/dropbox/core/v2/files/DownloadZipError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/DownloadZipError;
    .locals 1

    .line 102
    new-instance v0, Lcom/dropbox/core/v2/files/DownloadZipError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DownloadZipError;-><init>()V

    .line 103
    iput-object p1, v0, Lcom/dropbox/core/v2/files/DownloadZipError;->_tag:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    .line 104
    iput-object p2, v0, Lcom/dropbox/core/v2/files/DownloadZipError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 222
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/DownloadZipError;

    if-eqz v2, :cond_7

    .line 223
    check-cast p1, Lcom/dropbox/core/v2/files/DownloadZipError;

    .line 224
    iget-object v2, p0, Lcom/dropbox/core/v2/files/DownloadZipError;->_tag:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/DownloadZipError;->_tag:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 227
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/DownloadZipError$1;->$SwitchMap$com$dropbox$core$v2$files$DownloadZipError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/DownloadZipError;->_tag:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/DownloadZipError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_4

    const/4 p1, 0x2

    if-eq v2, p1, :cond_3

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    const/4 p1, 0x4

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 229
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/DownloadZipError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/DownloadZipError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/LookupError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    :cond_7
    return v1
.end method

.method public getPathValue()Lcom/dropbox/core/v2/files/LookupError;
    .locals 3

    .line 166
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DownloadZipError;->_tag:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/DownloadZipError$Tag;->PATH:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    if-ne v0, v1, :cond_0

    .line 169
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DownloadZipError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0

    .line 167
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/DownloadZipError;->_tag:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/DownloadZipError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 207
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DownloadZipError;->_tag:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/DownloadZipError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 202
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DownloadZipError;->_tag:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/DownloadZipError$Tag;->OTHER:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPath()Z
    .locals 2

    .line 134
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DownloadZipError;->_tag:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/DownloadZipError$Tag;->PATH:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooLarge()Z
    .locals 2

    .line 180
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DownloadZipError;->_tag:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/DownloadZipError$Tag;->TOO_LARGE:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooManyFiles()Z
    .locals 2

    .line 191
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DownloadZipError;->_tag:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/DownloadZipError$Tag;->TOO_MANY_FILES:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/DownloadZipError$Tag;
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DownloadZipError;->_tag:Lcom/dropbox/core/v2/files/DownloadZipError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 247
    sget-object v0, Lcom/dropbox/core/v2/files/DownloadZipError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DownloadZipError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/DownloadZipError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 259
    sget-object v0, Lcom/dropbox/core/v2/files/DownloadZipError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DownloadZipError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/DownloadZipError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
