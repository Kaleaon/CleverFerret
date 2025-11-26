.class public final Lcom/dropbox/core/v2/files/ThumbnailError;
.super Ljava/lang/Object;
.source "ThumbnailError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/ThumbnailError$Serializer;,
        Lcom/dropbox/core/v2/files/ThumbnailError$Tag;
    }
.end annotation


# static fields
.field public static final CONVERSION_ERROR:Lcom/dropbox/core/v2/files/ThumbnailError;

.field public static final UNSUPPORTED_EXTENSION:Lcom/dropbox/core/v2/files/ThumbnailError;

.field public static final UNSUPPORTED_IMAGE:Lcom/dropbox/core/v2/files/ThumbnailError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

.field private pathValue:Lcom/dropbox/core/v2/files/LookupError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 53
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ThumbnailError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailError$Tag;->UNSUPPORTED_EXTENSION:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/ThumbnailError;->withTag(Lcom/dropbox/core/v2/files/ThumbnailError$Tag;)Lcom/dropbox/core/v2/files/ThumbnailError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/ThumbnailError;->UNSUPPORTED_EXTENSION:Lcom/dropbox/core/v2/files/ThumbnailError;

    .line 57
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ThumbnailError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailError$Tag;->UNSUPPORTED_IMAGE:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/ThumbnailError;->withTag(Lcom/dropbox/core/v2/files/ThumbnailError$Tag;)Lcom/dropbox/core/v2/files/ThumbnailError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/ThumbnailError;->UNSUPPORTED_IMAGE:Lcom/dropbox/core/v2/files/ThumbnailError;

    .line 61
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ThumbnailError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailError$Tag;->CONVERSION_ERROR:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/ThumbnailError;->withTag(Lcom/dropbox/core/v2/files/ThumbnailError$Tag;)Lcom/dropbox/core/v2/files/ThumbnailError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/ThumbnailError;->CONVERSION_ERROR:Lcom/dropbox/core/v2/files/ThumbnailError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/ThumbnailError;)Lcom/dropbox/core/v2/files/LookupError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/ThumbnailError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object p0
.end method

.method public static path(Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/ThumbnailError;
    .locals 2

    if-eqz p0, :cond_0

    .line 142
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ThumbnailError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailError$Tag;->PATH:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/ThumbnailError;->withTagAndPath(Lcom/dropbox/core/v2/files/ThumbnailError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/ThumbnailError;

    move-result-object p0

    return-object p0

    .line 140
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/ThumbnailError$Tag;)Lcom/dropbox/core/v2/files/ThumbnailError;
    .locals 1

    .line 78
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ThumbnailError;-><init>()V

    .line 79
    iput-object p1, v0, Lcom/dropbox/core/v2/files/ThumbnailError;->_tag:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    return-object v0
.end method

.method private withTagAndPath(Lcom/dropbox/core/v2/files/ThumbnailError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/ThumbnailError;
    .locals 1

    .line 93
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ThumbnailError;-><init>()V

    .line 94
    iput-object p1, v0, Lcom/dropbox/core/v2/files/ThumbnailError;->_tag:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    .line 95
    iput-object p2, v0, Lcom/dropbox/core/v2/files/ThumbnailError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

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

    .line 212
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/ThumbnailError;

    if-eqz v2, :cond_7

    .line 213
    check-cast p1, Lcom/dropbox/core/v2/files/ThumbnailError;

    .line 214
    iget-object v2, p0, Lcom/dropbox/core/v2/files/ThumbnailError;->_tag:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/ThumbnailError;->_tag:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 217
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/ThumbnailError$1;->$SwitchMap$com$dropbox$core$v2$files$ThumbnailError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/ThumbnailError;->_tag:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/ThumbnailError$Tag;->ordinal()I

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

    .line 219
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/ThumbnailError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/ThumbnailError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

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

    .line 156
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailError;->_tag:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailError$Tag;->PATH:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    if-ne v0, v1, :cond_0

    .line 159
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0

    .line 157
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/ThumbnailError;->_tag:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/ThumbnailError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 197
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailError;->_tag:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/ThumbnailError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

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

.method public isConversionError()Z
    .locals 2

    .line 192
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailError;->_tag:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailError$Tag;->CONVERSION_ERROR:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPath()Z
    .locals 2

    .line 122
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailError;->_tag:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailError$Tag;->PATH:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUnsupportedExtension()Z
    .locals 2

    .line 170
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailError;->_tag:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailError$Tag;->UNSUPPORTED_EXTENSION:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUnsupportedImage()Z
    .locals 2

    .line 181
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailError;->_tag:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailError$Tag;->UNSUPPORTED_IMAGE:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/ThumbnailError$Tag;
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailError;->_tag:Lcom/dropbox/core/v2/files/ThumbnailError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 237
    sget-object v0, Lcom/dropbox/core/v2/files/ThumbnailError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/ThumbnailError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 249
    sget-object v0, Lcom/dropbox/core/v2/files/ThumbnailError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/ThumbnailError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
