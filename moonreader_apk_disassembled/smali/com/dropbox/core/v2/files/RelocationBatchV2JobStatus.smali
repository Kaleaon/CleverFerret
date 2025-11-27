.class public final Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;
.super Ljava/lang/Object;
.source "RelocationBatchV2JobStatus.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Serializer;,
        Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;
    }
.end annotation


# static fields
.field public static final IN_PROGRESS:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;

.field private completeValue:Lcom/dropbox/core/v2/files/RelocationBatchV2Result;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 49
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;->IN_PROGRESS:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->withTag(Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->IN_PROGRESS:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;)Lcom/dropbox/core/v2/files/RelocationBatchV2Result;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->completeValue:Lcom/dropbox/core/v2/files/RelocationBatchV2Result;

    return-object p0
.end method

.method public static complete(Lcom/dropbox/core/v2/files/RelocationBatchV2Result;)Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;
    .locals 2

    if-eqz p0, :cond_0

    .line 147
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->withTagAndComplete(Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;Lcom/dropbox/core/v2/files/RelocationBatchV2Result;)Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;

    move-result-object p0

    return-object p0

    .line 145
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;
    .locals 1

    .line 69
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;-><init>()V

    .line 70
    iput-object p1, v0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;

    return-object v0
.end method

.method private withTagAndComplete(Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;Lcom/dropbox/core/v2/files/RelocationBatchV2Result;)Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;
    .locals 1

    .line 87
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;-><init>()V

    .line 88
    iput-object p1, v0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;

    .line 89
    iput-object p2, v0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->completeValue:Lcom/dropbox/core/v2/files/RelocationBatchV2Result;

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

    .line 185
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;

    if-eqz v2, :cond_6

    .line 186
    check-cast p1, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;

    .line 187
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 190
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$1;->$SwitchMap$com$dropbox$core$v2$files$RelocationBatchV2JobStatus$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_5

    const/4 v3, 0x2

    if-eq v2, v3, :cond_3

    return v1

    .line 194
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->completeValue:Lcom/dropbox/core/v2/files/RelocationBatchV2Result;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->completeValue:Lcom/dropbox/core/v2/files/RelocationBatchV2Result;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/RelocationBatchV2Result;->equals(Ljava/lang/Object;)Z

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

.method public getCompleteValue()Lcom/dropbox/core/v2/files/RelocationBatchV2Result;
    .locals 3

    .line 161
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;

    if-ne v0, v1, :cond_0

    .line 164
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->completeValue:Lcom/dropbox/core/v2/files/RelocationBatchV2Result;

    return-object v0

    .line 162
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.COMPLETE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 169
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->completeValue:Lcom/dropbox/core/v2/files/RelocationBatchV2Result;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 173
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isComplete()Z
    .locals 2

    .line 127
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInProgress()Z
    .locals 2

    .line 116
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;->IN_PROGRESS:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 206
    sget-object v0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 218
    sget-object v0, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchV2JobStatus$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
