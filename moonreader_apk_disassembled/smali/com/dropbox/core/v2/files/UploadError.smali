.class public final Lcom/dropbox/core/v2/files/UploadError;
.super Ljava/lang/Object;
.source "UploadError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/UploadError$Serializer;,
        Lcom/dropbox/core/v2/files/UploadError$Tag;
    }
.end annotation


# static fields
.field public static final CONTENT_HASH_MISMATCH:Lcom/dropbox/core/v2/files/UploadError;

.field public static final OTHER:Lcom/dropbox/core/v2/files/UploadError;

.field public static final PAYLOAD_TOO_LARGE:Lcom/dropbox/core/v2/files/UploadError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/UploadError$Tag;

.field private pathValue:Lcom/dropbox/core/v2/files/UploadWriteFailed;

.field private propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 69
    new-instance v0, Lcom/dropbox/core/v2/files/UploadError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadError$Tag;->PAYLOAD_TOO_LARGE:Lcom/dropbox/core/v2/files/UploadError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadError;->withTag(Lcom/dropbox/core/v2/files/UploadError$Tag;)Lcom/dropbox/core/v2/files/UploadError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadError;->PAYLOAD_TOO_LARGE:Lcom/dropbox/core/v2/files/UploadError;

    .line 74
    new-instance v0, Lcom/dropbox/core/v2/files/UploadError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadError$Tag;->CONTENT_HASH_MISMATCH:Lcom/dropbox/core/v2/files/UploadError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadError;->withTag(Lcom/dropbox/core/v2/files/UploadError$Tag;)Lcom/dropbox/core/v2/files/UploadError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadError;->CONTENT_HASH_MISMATCH:Lcom/dropbox/core/v2/files/UploadError;

    .line 82
    new-instance v0, Lcom/dropbox/core/v2/files/UploadError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadError$Tag;->OTHER:Lcom/dropbox/core/v2/files/UploadError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadError;->withTag(Lcom/dropbox/core/v2/files/UploadError$Tag;)Lcom/dropbox/core/v2/files/UploadError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadError;->OTHER:Lcom/dropbox/core/v2/files/UploadError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/UploadError;)Lcom/dropbox/core/v2/files/UploadWriteFailed;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/dropbox/core/v2/files/UploadError;->pathValue:Lcom/dropbox/core/v2/files/UploadWriteFailed;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/files/UploadError;)Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/dropbox/core/v2/files/UploadError;->propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;

    return-object p0
.end method

.method public static path(Lcom/dropbox/core/v2/files/UploadWriteFailed;)Lcom/dropbox/core/v2/files/UploadError;
    .locals 2

    if-eqz p0, :cond_0

    .line 183
    new-instance v0, Lcom/dropbox/core/v2/files/UploadError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadError$Tag;->PATH:Lcom/dropbox/core/v2/files/UploadError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/UploadError;->withTagAndPath(Lcom/dropbox/core/v2/files/UploadError$Tag;Lcom/dropbox/core/v2/files/UploadWriteFailed;)Lcom/dropbox/core/v2/files/UploadError;

    move-result-object p0

    return-object p0

    .line 181
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static propertiesError(Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;)Lcom/dropbox/core/v2/files/UploadError;
    .locals 2

    if-eqz p0, :cond_0

    .line 232
    new-instance v0, Lcom/dropbox/core/v2/files/UploadError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadError$Tag;->PROPERTIES_ERROR:Lcom/dropbox/core/v2/files/UploadError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/UploadError;->withTagAndPropertiesError(Lcom/dropbox/core/v2/files/UploadError$Tag;Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;)Lcom/dropbox/core/v2/files/UploadError;

    move-result-object p0

    return-object p0

    .line 230
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/UploadError$Tag;)Lcom/dropbox/core/v2/files/UploadError;
    .locals 1

    .line 100
    new-instance v0, Lcom/dropbox/core/v2/files/UploadError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadError;-><init>()V

    .line 101
    iput-object p1, v0, Lcom/dropbox/core/v2/files/UploadError;->_tag:Lcom/dropbox/core/v2/files/UploadError$Tag;

    return-object v0
.end method

.method private withTagAndPath(Lcom/dropbox/core/v2/files/UploadError$Tag;Lcom/dropbox/core/v2/files/UploadWriteFailed;)Lcom/dropbox/core/v2/files/UploadError;
    .locals 1

    .line 115
    new-instance v0, Lcom/dropbox/core/v2/files/UploadError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadError;-><init>()V

    .line 116
    iput-object p1, v0, Lcom/dropbox/core/v2/files/UploadError;->_tag:Lcom/dropbox/core/v2/files/UploadError$Tag;

    .line 117
    iput-object p2, v0, Lcom/dropbox/core/v2/files/UploadError;->pathValue:Lcom/dropbox/core/v2/files/UploadWriteFailed;

    return-object v0
.end method

.method private withTagAndPropertiesError(Lcom/dropbox/core/v2/files/UploadError$Tag;Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;)Lcom/dropbox/core/v2/files/UploadError;
    .locals 1

    .line 131
    new-instance v0, Lcom/dropbox/core/v2/files/UploadError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadError;-><init>()V

    .line 132
    iput-object p1, v0, Lcom/dropbox/core/v2/files/UploadError;->_tag:Lcom/dropbox/core/v2/files/UploadError$Tag;

    .line 133
    iput-object p2, v0, Lcom/dropbox/core/v2/files/UploadError;->propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;

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

    .line 305
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/UploadError;

    if-eqz v2, :cond_a

    .line 306
    check-cast p1, Lcom/dropbox/core/v2/files/UploadError;

    .line 307
    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadError;->_tag:Lcom/dropbox/core/v2/files/UploadError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/UploadError;->_tag:Lcom/dropbox/core/v2/files/UploadError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 310
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/UploadError$1;->$SwitchMap$com$dropbox$core$v2$files$UploadError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/UploadError;->_tag:Lcom/dropbox/core/v2/files/UploadError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/UploadError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_7

    const/4 v3, 0x2

    if-eq v2, v3, :cond_4

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    const/4 p1, 0x4

    if-eq v2, p1, :cond_3

    const/4 p1, 0x5

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 314
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadError;->propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/UploadError;->propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 312
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadError;->pathValue:Lcom/dropbox/core/v2/files/UploadWriteFailed;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/UploadError;->pathValue:Lcom/dropbox/core/v2/files/UploadWriteFailed;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/UploadWriteFailed;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8

    goto :goto_1

    :cond_8
    return v1

    :cond_9
    :goto_1
    return v0

    :cond_a
    return v1
.end method

.method public getPathValue()Lcom/dropbox/core/v2/files/UploadWriteFailed;
    .locals 3

    .line 197
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadError;->_tag:Lcom/dropbox/core/v2/files/UploadError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadError$Tag;->PATH:Lcom/dropbox/core/v2/files/UploadError$Tag;

    if-ne v0, v1, :cond_0

    .line 200
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadError;->pathValue:Lcom/dropbox/core/v2/files/UploadWriteFailed;

    return-object v0

    .line 198
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadError;->_tag:Lcom/dropbox/core/v2/files/UploadError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/UploadError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPropertiesErrorValue()Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;
    .locals 3

    .line 248
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadError;->_tag:Lcom/dropbox/core/v2/files/UploadError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadError$Tag;->PROPERTIES_ERROR:Lcom/dropbox/core/v2/files/UploadError$Tag;

    if-ne v0, v1, :cond_0

    .line 251
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadError;->propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;

    return-object v0

    .line 249
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PROPERTIES_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadError;->_tag:Lcom/dropbox/core/v2/files/UploadError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/UploadError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 289
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadError;->_tag:Lcom/dropbox/core/v2/files/UploadError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/UploadError;->pathValue:Lcom/dropbox/core/v2/files/UploadWriteFailed;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadError;->propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    invoke-static {v3}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isContentHashMismatch()Z
    .locals 2

    .line 273
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadError;->_tag:Lcom/dropbox/core/v2/files/UploadError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadError$Tag;->CONTENT_HASH_MISMATCH:Lcom/dropbox/core/v2/files/UploadError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 284
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadError;->_tag:Lcom/dropbox/core/v2/files/UploadError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadError$Tag;->OTHER:Lcom/dropbox/core/v2/files/UploadError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPath()Z
    .locals 2

    .line 163
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadError;->_tag:Lcom/dropbox/core/v2/files/UploadError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadError$Tag;->PATH:Lcom/dropbox/core/v2/files/UploadError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPayloadTooLarge()Z
    .locals 2

    .line 262
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadError;->_tag:Lcom/dropbox/core/v2/files/UploadError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadError$Tag;->PAYLOAD_TOO_LARGE:Lcom/dropbox/core/v2/files/UploadError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPropertiesError()Z
    .locals 2

    .line 211
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadError;->_tag:Lcom/dropbox/core/v2/files/UploadError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadError$Tag;->PROPERTIES_ERROR:Lcom/dropbox/core/v2/files/UploadError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/UploadError$Tag;
    .locals 1

    .line 152
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadError;->_tag:Lcom/dropbox/core/v2/files/UploadError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 332
    sget-object v0, Lcom/dropbox/core/v2/files/UploadError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/UploadError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 344
    sget-object v0, Lcom/dropbox/core/v2/files/UploadError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/UploadError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
