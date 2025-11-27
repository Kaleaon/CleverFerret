.class public final Lcom/dropbox/core/v2/files/ThumbnailV2Error;
.super Ljava/lang/Object;
.source "ThumbnailV2Error.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;,
        Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;
    }
.end annotation


# static fields
.field public static final ACCESS_DENIED:Lcom/dropbox/core/v2/files/ThumbnailV2Error;

.field public static final CONVERSION_ERROR:Lcom/dropbox/core/v2/files/ThumbnailV2Error;

.field public static final NOT_FOUND:Lcom/dropbox/core/v2/files/ThumbnailV2Error;

.field public static final OTHER:Lcom/dropbox/core/v2/files/ThumbnailV2Error;

.field public static final UNSUPPORTED_EXTENSION:Lcom/dropbox/core/v2/files/ThumbnailV2Error;

.field public static final UNSUPPORTED_IMAGE:Lcom/dropbox/core/v2/files/ThumbnailV2Error;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

.field private pathValue:Lcom/dropbox/core/v2/files/LookupError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 74
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ThumbnailV2Error;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;->UNSUPPORTED_EXTENSION:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->withTag(Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;)Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->UNSUPPORTED_EXTENSION:Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    .line 78
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ThumbnailV2Error;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;->UNSUPPORTED_IMAGE:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->withTag(Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;)Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->UNSUPPORTED_IMAGE:Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    .line 82
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ThumbnailV2Error;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;->CONVERSION_ERROR:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->withTag(Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;)Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->CONVERSION_ERROR:Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    .line 86
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ThumbnailV2Error;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;->ACCESS_DENIED:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->withTag(Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;)Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->ACCESS_DENIED:Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    .line 90
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ThumbnailV2Error;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;->NOT_FOUND:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->withTag(Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;)Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->NOT_FOUND:Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    .line 98
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ThumbnailV2Error;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;->OTHER:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->withTag(Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;)Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->OTHER:Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/ThumbnailV2Error;)Lcom/dropbox/core/v2/files/LookupError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object p0
.end method

.method public static path(Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/ThumbnailV2Error;
    .locals 2

    if-eqz p0, :cond_0

    .line 182
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ThumbnailV2Error;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;->PATH:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->withTagAndPath(Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    move-result-object p0

    return-object p0

    .line 180
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;)Lcom/dropbox/core/v2/files/ThumbnailV2Error;
    .locals 1

    .line 115
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ThumbnailV2Error;-><init>()V

    .line 116
    iput-object p1, v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->_tag:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    return-object v0
.end method

.method private withTagAndPath(Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/ThumbnailV2Error;
    .locals 1

    .line 130
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/ThumbnailV2Error;-><init>()V

    .line 131
    iput-object p1, v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->_tag:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    .line 132
    iput-object p2, v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

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

    .line 285
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    if-eqz v2, :cond_5

    .line 286
    check-cast p1, Lcom/dropbox/core/v2/files/ThumbnailV2Error;

    .line 287
    iget-object v2, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->_tag:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->_tag:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 290
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/ThumbnailV2Error$1;->$SwitchMap$com$dropbox$core$v2$files$ThumbnailV2Error$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->_tag:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 292
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/LookupError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    :cond_5
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getPathValue()Lcom/dropbox/core/v2/files/LookupError;
    .locals 3

    .line 196
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->_tag:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;->PATH:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    if-ne v0, v1, :cond_0

    .line 199
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0

    .line 197
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->_tag:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 270
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->_tag:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

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

.method public isAccessDenied()Z
    .locals 2

    .line 243
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->_tag:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;->ACCESS_DENIED:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isConversionError()Z
    .locals 2

    .line 232
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->_tag:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;->CONVERSION_ERROR:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNotFound()Z
    .locals 2

    .line 254
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->_tag:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;->NOT_FOUND:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 265
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->_tag:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;->OTHER:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPath()Z
    .locals 2

    .line 162
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->_tag:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;->PATH:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUnsupportedExtension()Z
    .locals 2

    .line 210
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->_tag:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;->UNSUPPORTED_EXTENSION:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUnsupportedImage()Z
    .locals 2

    .line 221
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->_tag:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;->UNSUPPORTED_IMAGE:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;
    .locals 1

    .line 151
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Error;->_tag:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 316
    sget-object v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 328
    sget-object v0, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/ThumbnailV2Error$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
