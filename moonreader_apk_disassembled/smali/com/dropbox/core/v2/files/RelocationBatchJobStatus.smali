.class public final Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;
.super Ljava/lang/Object;
.source "RelocationBatchJobStatus.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Serializer;,
        Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;
    }
.end annotation


# static fields
.field public static final IN_PROGRESS:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

.field private completeValue:Lcom/dropbox/core/v2/files/RelocationBatchResult;

.field private failedValue:Lcom/dropbox/core/v2/files/RelocationBatchError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 49
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;->IN_PROGRESS:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->withTag(Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->IN_PROGRESS:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;)Lcom/dropbox/core/v2/files/RelocationBatchResult;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->completeValue:Lcom/dropbox/core/v2/files/RelocationBatchResult;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;)Lcom/dropbox/core/v2/files/RelocationBatchError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->failedValue:Lcom/dropbox/core/v2/files/RelocationBatchError;

    return-object p0
.end method

.method public static complete(Lcom/dropbox/core/v2/files/RelocationBatchResult;)Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;
    .locals 2

    if-eqz p0, :cond_0

    .line 158
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->withTagAndComplete(Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;Lcom/dropbox/core/v2/files/RelocationBatchResult;)Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;

    move-result-object p0

    return-object p0

    .line 156
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static failed(Lcom/dropbox/core/v2/files/RelocationBatchError;)Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;
    .locals 2

    if-eqz p0, :cond_0

    .line 206
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;->FAILED:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->withTagAndFailed(Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;Lcom/dropbox/core/v2/files/RelocationBatchError;)Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;

    move-result-object p0

    return-object p0

    .line 204
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;
    .locals 1

    .line 67
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;-><init>()V

    .line 68
    iput-object p1, v0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    return-object v0
.end method

.method private withTagAndComplete(Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;Lcom/dropbox/core/v2/files/RelocationBatchResult;)Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;
    .locals 1

    .line 82
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;-><init>()V

    .line 83
    iput-object p1, v0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    .line 84
    iput-object p2, v0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->completeValue:Lcom/dropbox/core/v2/files/RelocationBatchResult;

    return-object v0
.end method

.method private withTagAndFailed(Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;Lcom/dropbox/core/v2/files/RelocationBatchError;)Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;
    .locals 1

    .line 98
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;-><init>()V

    .line 99
    iput-object p1, v0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    .line 100
    iput-object p2, v0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->failedValue:Lcom/dropbox/core/v2/files/RelocationBatchError;

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

    .line 245
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;

    if-eqz v2, :cond_9

    .line 246
    check-cast p1, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;

    .line 247
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 250
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$1;->$SwitchMap$com$dropbox$core$v2$files$RelocationBatchJobStatus$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_8

    const/4 v3, 0x2

    if-eq v2, v3, :cond_6

    const/4 v3, 0x3

    if-eq v2, v3, :cond_3

    return v1

    .line 256
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->failedValue:Lcom/dropbox/core/v2/files/RelocationBatchError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->failedValue:Lcom/dropbox/core/v2/files/RelocationBatchError;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/RelocationBatchError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    .line 254
    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->completeValue:Lcom/dropbox/core/v2/files/RelocationBatchResult;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->completeValue:Lcom/dropbox/core/v2/files/RelocationBatchResult;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/RelocationBatchResult;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_1

    :cond_7
    return v1

    :cond_8
    :goto_1
    return v0

    :cond_9
    return v1
.end method

.method public getCompleteValue()Lcom/dropbox/core/v2/files/RelocationBatchResult;
    .locals 3

    .line 172
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    if-ne v0, v1, :cond_0

    .line 175
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->completeValue:Lcom/dropbox/core/v2/files/RelocationBatchResult;

    return-object v0

    .line 173
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.COMPLETE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getFailedValue()Lcom/dropbox/core/v2/files/RelocationBatchError;
    .locals 3

    .line 220
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;->FAILED:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    if-ne v0, v1, :cond_0

    .line 223
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->failedValue:Lcom/dropbox/core/v2/files/RelocationBatchError;

    return-object v0

    .line 221
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.FAILED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 228
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->completeValue:Lcom/dropbox/core/v2/files/RelocationBatchResult;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->failedValue:Lcom/dropbox/core/v2/files/RelocationBatchError;

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

    .line 233
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isComplete()Z
    .locals 2

    .line 138
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isFailed()Z
    .locals 2

    .line 186
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;->FAILED:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInProgress()Z
    .locals 2

    .line 127
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;->IN_PROGRESS:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 268
    sget-object v0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 280
    sget-object v0, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchJobStatus$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
