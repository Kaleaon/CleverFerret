.class public final Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;
.super Ljava/lang/Object;
.source "DeleteBatchJobStatus.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;,
        Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;
    }
.end annotation


# static fields
.field public static final IN_PROGRESS:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

.field public static final OTHER:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

.field private completeValue:Lcom/dropbox/core/v2/files/DeleteBatchResult;

.field private failedValue:Lcom/dropbox/core/v2/files/DeleteBatchError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 62
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;->IN_PROGRESS:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->withTag(Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;)Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->IN_PROGRESS:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    .line 70
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;->OTHER:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->withTag(Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;)Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->OTHER:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;)Lcom/dropbox/core/v2/files/DeleteBatchResult;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->completeValue:Lcom/dropbox/core/v2/files/DeleteBatchResult;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;)Lcom/dropbox/core/v2/files/DeleteBatchError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->failedValue:Lcom/dropbox/core/v2/files/DeleteBatchError;

    return-object p0
.end method

.method public static complete(Lcom/dropbox/core/v2/files/DeleteBatchResult;)Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;
    .locals 2

    if-eqz p0, :cond_0

    .line 182
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->withTagAndComplete(Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;Lcom/dropbox/core/v2/files/DeleteBatchResult;)Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    move-result-object p0

    return-object p0

    .line 180
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static failed(Lcom/dropbox/core/v2/files/DeleteBatchError;)Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;
    .locals 2

    if-eqz p0, :cond_0

    .line 230
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;->FAILED:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->withTagAndFailed(Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;Lcom/dropbox/core/v2/files/DeleteBatchError;)Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    move-result-object p0

    return-object p0

    .line 228
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;)Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;
    .locals 1

    .line 88
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;-><init>()V

    .line 89
    iput-object p1, v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    return-object v0
.end method

.method private withTagAndComplete(Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;Lcom/dropbox/core/v2/files/DeleteBatchResult;)Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;
    .locals 1

    .line 103
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;-><init>()V

    .line 104
    iput-object p1, v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    .line 105
    iput-object p2, v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->completeValue:Lcom/dropbox/core/v2/files/DeleteBatchResult;

    return-object v0
.end method

.method private withTagAndFailed(Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;Lcom/dropbox/core/v2/files/DeleteBatchError;)Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;
    .locals 1

    .line 119
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;-><init>()V

    .line 120
    iput-object p1, v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    .line 121
    iput-object p2, v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->failedValue:Lcom/dropbox/core/v2/files/DeleteBatchError;

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

    .line 280
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    if-eqz v2, :cond_a

    .line 281
    check-cast p1, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;

    .line 282
    iget-object v2, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 285
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$1;->$SwitchMap$com$dropbox$core$v2$files$DeleteBatchJobStatus$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_9

    const/4 v3, 0x2

    if-eq v2, v3, :cond_7

    const/4 v3, 0x3

    if-eq v2, v3, :cond_4

    const/4 p1, 0x4

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 291
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->failedValue:Lcom/dropbox/core/v2/files/DeleteBatchError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->failedValue:Lcom/dropbox/core/v2/files/DeleteBatchError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/DeleteBatchError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 289
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->completeValue:Lcom/dropbox/core/v2/files/DeleteBatchResult;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->completeValue:Lcom/dropbox/core/v2/files/DeleteBatchResult;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/DeleteBatchResult;->equals(Ljava/lang/Object;)Z

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

.method public getCompleteValue()Lcom/dropbox/core/v2/files/DeleteBatchResult;
    .locals 3

    .line 196
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    if-ne v0, v1, :cond_0

    .line 199
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->completeValue:Lcom/dropbox/core/v2/files/DeleteBatchResult;

    return-object v0

    .line 197
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.COMPLETE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getFailedValue()Lcom/dropbox/core/v2/files/DeleteBatchError;
    .locals 3

    .line 244
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;->FAILED:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    if-ne v0, v1, :cond_0

    .line 247
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->failedValue:Lcom/dropbox/core/v2/files/DeleteBatchError;

    return-object v0

    .line 245
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.FAILED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 263
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->completeValue:Lcom/dropbox/core/v2/files/DeleteBatchResult;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->failedValue:Lcom/dropbox/core/v2/files/DeleteBatchError;

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

    .line 268
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isComplete()Z
    .locals 2

    .line 162
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isFailed()Z
    .locals 2

    .line 210
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;->FAILED:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInProgress()Z
    .locals 2

    .line 151
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;->IN_PROGRESS:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 258
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;->OTHER:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;
    .locals 1

    .line 140
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 305
    sget-object v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 317
    sget-object v0, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/DeleteBatchJobStatus$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
