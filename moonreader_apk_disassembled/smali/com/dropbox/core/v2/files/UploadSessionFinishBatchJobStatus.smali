.class public final Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;
.super Ljava/lang/Object;
.source "UploadSessionFinishBatchJobStatus.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Serializer;,
        Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;
    }
.end annotation


# static fields
.field public static final IN_PROGRESS:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;

.field private completeValue:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 47
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;->IN_PROGRESS:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->withTag(Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;)Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->IN_PROGRESS:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;)Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->completeValue:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult;

    return-object p0
.end method

.method public static complete(Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult;)Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;
    .locals 2

    if-eqz p0, :cond_0

    .line 142
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->withTagAndComplete(Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult;)Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;

    move-result-object p0

    return-object p0

    .line 140
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;)Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;
    .locals 1

    .line 64
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;-><init>()V

    .line 65
    iput-object p1, v0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;

    return-object v0
.end method

.method private withTagAndComplete(Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult;)Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;
    .locals 1

    .line 80
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;-><init>()V

    .line 81
    iput-object p1, v0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;

    .line 82
    iput-object p2, v0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->completeValue:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult;

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

    .line 181
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;

    if-eqz v2, :cond_6

    .line 182
    check-cast p1, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;

    .line 183
    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 186
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$1;->$SwitchMap$com$dropbox$core$v2$files$UploadSessionFinishBatchJobStatus$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_5

    const/4 v3, 0x2

    if-eq v2, v3, :cond_3

    return v1

    .line 190
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->completeValue:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->completeValue:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    :cond_6
    return v1
.end method

.method public getCompleteValue()Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult;
    .locals 3

    .line 157
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;

    if-ne v0, v1, :cond_0

    .line 160
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->completeValue:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult;

    return-object v0

    .line 158
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.COMPLETE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 165
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->completeValue:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchResult;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 169
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isComplete()Z
    .locals 2

    .line 120
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInProgress()Z
    .locals 2

    .line 109
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;->IN_PROGRESS:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 202
    sget-object v0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 214
    sget-object v0, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/UploadSessionFinishBatchJobStatus$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
