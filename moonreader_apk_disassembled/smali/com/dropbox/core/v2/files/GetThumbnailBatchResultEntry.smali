.class public final Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;
.super Ljava/lang/Object;
.source "GetThumbnailBatchResultEntry.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Serializer;,
        Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

.field private failureValue:Lcom/dropbox/core/v2/files/ThumbnailError;

.field private successValue:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 59
    new-instance v0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;->OTHER:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->withTag(Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;)Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->OTHER:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;)Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->successValue:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;)Lcom/dropbox/core/v2/files/ThumbnailError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->failureValue:Lcom/dropbox/core/v2/files/ThumbnailError;

    return-object p0
.end method

.method public static failure(Lcom/dropbox/core/v2/files/ThumbnailError;)Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;
    .locals 2

    if-eqz p0, :cond_0

    .line 205
    new-instance v0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;->FAILURE:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->withTagAndFailure(Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;Lcom/dropbox/core/v2/files/ThumbnailError;)Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;

    move-result-object p0

    return-object p0

    .line 203
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static success(Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;)Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;
    .locals 2

    if-eqz p0, :cond_0

    .line 159
    new-instance v0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;->SUCCESS:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->withTagAndSuccess(Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;)Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;

    move-result-object p0

    return-object p0

    .line 157
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;)Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;
    .locals 1

    .line 77
    new-instance v0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;-><init>()V

    .line 78
    iput-object p1, v0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    return-object v0
.end method

.method private withTagAndFailure(Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;Lcom/dropbox/core/v2/files/ThumbnailError;)Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;
    .locals 1

    .line 107
    new-instance v0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;-><init>()V

    .line 108
    iput-object p1, v0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    .line 109
    iput-object p2, v0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->failureValue:Lcom/dropbox/core/v2/files/ThumbnailError;

    return-object v0
.end method

.method private withTagAndSuccess(Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;)Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;
    .locals 1

    .line 91
    new-instance v0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;-><init>()V

    .line 92
    iput-object p1, v0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    .line 93
    iput-object p2, v0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->successValue:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;

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

    .line 254
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;

    if-eqz v2, :cond_a

    .line 255
    check-cast p1, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;

    .line 256
    iget-object v2, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 259
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$1;->$SwitchMap$com$dropbox$core$v2$files$GetThumbnailBatchResultEntry$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_7

    const/4 v3, 0x2

    if-eq v2, v3, :cond_4

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 263
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->failureValue:Lcom/dropbox/core/v2/files/ThumbnailError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->failureValue:Lcom/dropbox/core/v2/files/ThumbnailError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/ThumbnailError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 261
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->successValue:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->successValue:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;->equals(Ljava/lang/Object;)Z

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

.method public getFailureValue()Lcom/dropbox/core/v2/files/ThumbnailError;
    .locals 3

    .line 219
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;->FAILURE:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    if-ne v0, v1, :cond_0

    .line 222
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->failureValue:Lcom/dropbox/core/v2/files/ThumbnailError;

    return-object v0

    .line 220
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.FAILURE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSuccessValue()Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;
    .locals 3

    .line 171
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;->SUCCESS:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    if-ne v0, v1, :cond_0

    .line 174
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->successValue:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;

    return-object v0

    .line 172
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.SUCCESS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 238
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->successValue:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->failureValue:Lcom/dropbox/core/v2/files/ThumbnailError;

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

.method public isFailure()Z
    .locals 2

    .line 185
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;->FAILURE:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 233
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;->OTHER:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSuccess()Z
    .locals 2

    .line 139
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;->SUCCESS:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;
    .locals 1

    .line 128
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 277
    sget-object v0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 289
    sget-object v0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultEntry$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
