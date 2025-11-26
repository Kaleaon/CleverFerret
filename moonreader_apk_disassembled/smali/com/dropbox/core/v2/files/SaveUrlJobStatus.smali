.class public final Lcom/dropbox/core/v2/files/SaveUrlJobStatus;
.super Ljava/lang/Object;
.source "SaveUrlJobStatus.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Serializer;,
        Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;
    }
.end annotation


# static fields
.field public static final IN_PROGRESS:Lcom/dropbox/core/v2/files/SaveUrlJobStatus;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

.field private completeValue:Lcom/dropbox/core/v2/files/FileMetadata;

.field private failedValue:Lcom/dropbox/core/v2/files/SaveUrlError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 46
    new-instance v0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;->IN_PROGRESS:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->withTag(Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;)Lcom/dropbox/core/v2/files/SaveUrlJobStatus;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->IN_PROGRESS:Lcom/dropbox/core/v2/files/SaveUrlJobStatus;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/SaveUrlJobStatus;)Lcom/dropbox/core/v2/files/FileMetadata;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->completeValue:Lcom/dropbox/core/v2/files/FileMetadata;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/files/SaveUrlJobStatus;)Lcom/dropbox/core/v2/files/SaveUrlError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->failedValue:Lcom/dropbox/core/v2/files/SaveUrlError;

    return-object p0
.end method

.method public static complete(Lcom/dropbox/core/v2/files/FileMetadata;)Lcom/dropbox/core/v2/files/SaveUrlJobStatus;
    .locals 2

    if-eqz p0, :cond_0

    .line 154
    new-instance v0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->withTagAndComplete(Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;Lcom/dropbox/core/v2/files/FileMetadata;)Lcom/dropbox/core/v2/files/SaveUrlJobStatus;

    move-result-object p0

    return-object p0

    .line 152
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static failed(Lcom/dropbox/core/v2/files/SaveUrlError;)Lcom/dropbox/core/v2/files/SaveUrlJobStatus;
    .locals 2

    if-eqz p0, :cond_0

    .line 202
    new-instance v0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;->FAILED:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->withTagAndFailed(Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;Lcom/dropbox/core/v2/files/SaveUrlError;)Lcom/dropbox/core/v2/files/SaveUrlJobStatus;

    move-result-object p0

    return-object p0

    .line 200
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;)Lcom/dropbox/core/v2/files/SaveUrlJobStatus;
    .locals 1

    .line 64
    new-instance v0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;-><init>()V

    .line 65
    iput-object p1, v0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->_tag:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    return-object v0
.end method

.method private withTagAndComplete(Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;Lcom/dropbox/core/v2/files/FileMetadata;)Lcom/dropbox/core/v2/files/SaveUrlJobStatus;
    .locals 1

    .line 79
    new-instance v0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;-><init>()V

    .line 80
    iput-object p1, v0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->_tag:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    .line 81
    iput-object p2, v0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->completeValue:Lcom/dropbox/core/v2/files/FileMetadata;

    return-object v0
.end method

.method private withTagAndFailed(Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;Lcom/dropbox/core/v2/files/SaveUrlError;)Lcom/dropbox/core/v2/files/SaveUrlJobStatus;
    .locals 1

    .line 94
    new-instance v0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;-><init>()V

    .line 95
    iput-object p1, v0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->_tag:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    .line 96
    iput-object p2, v0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->failedValue:Lcom/dropbox/core/v2/files/SaveUrlError;

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

    .line 239
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;

    if-eqz v2, :cond_9

    .line 240
    check-cast p1, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;

    .line 241
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->_tag:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->_tag:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 244
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/SaveUrlJobStatus$1;->$SwitchMap$com$dropbox$core$v2$files$SaveUrlJobStatus$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->_tag:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_8

    const/4 v3, 0x2

    if-eq v2, v3, :cond_6

    const/4 v3, 0x3

    if-eq v2, v3, :cond_3

    return v1

    .line 250
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->failedValue:Lcom/dropbox/core/v2/files/SaveUrlError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->failedValue:Lcom/dropbox/core/v2/files/SaveUrlError;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/SaveUrlError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    .line 248
    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->completeValue:Lcom/dropbox/core/v2/files/FileMetadata;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->completeValue:Lcom/dropbox/core/v2/files/FileMetadata;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/FileMetadata;->equals(Ljava/lang/Object;)Z

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

.method public getCompleteValue()Lcom/dropbox/core/v2/files/FileMetadata;
    .locals 3

    .line 168
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->_tag:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    if-ne v0, v1, :cond_0

    .line 171
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->completeValue:Lcom/dropbox/core/v2/files/FileMetadata;

    return-object v0

    .line 169
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.COMPLETE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->_tag:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getFailedValue()Lcom/dropbox/core/v2/files/SaveUrlError;
    .locals 3

    .line 214
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->_tag:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;->FAILED:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    if-ne v0, v1, :cond_0

    .line 217
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->failedValue:Lcom/dropbox/core/v2/files/SaveUrlError;

    return-object v0

    .line 215
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.FAILED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->_tag:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 222
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->_tag:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->completeValue:Lcom/dropbox/core/v2/files/FileMetadata;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->failedValue:Lcom/dropbox/core/v2/files/SaveUrlError;

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

    .line 227
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isComplete()Z
    .locals 2

    .line 134
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->_tag:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isFailed()Z
    .locals 2

    .line 182
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->_tag:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;->FAILED:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInProgress()Z
    .locals 2

    .line 123
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->_tag:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;->IN_PROGRESS:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus;->_tag:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 262
    sget-object v0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 274
    sget-object v0, Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/SaveUrlJobStatus$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
