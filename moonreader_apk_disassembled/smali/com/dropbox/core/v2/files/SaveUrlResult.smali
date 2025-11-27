.class public final Lcom/dropbox/core/v2/files/SaveUrlResult;
.super Ljava/lang/Object;
.source "SaveUrlResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/SaveUrlResult$Serializer;,
        Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;
    }
.end annotation


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

.field private asyncJobIdValue:Ljava/lang/String;

.field private completeValue:Lcom/dropbox/core/v2/files/FileMetadata;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/SaveUrlResult;)Ljava/lang/String;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/SaveUrlResult;->asyncJobIdValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/files/SaveUrlResult;)Lcom/dropbox/core/v2/files/FileMetadata;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/SaveUrlResult;->completeValue:Lcom/dropbox/core/v2/files/FileMetadata;

    return-object p0
.end method

.method public static asyncJobId(Ljava/lang/String;)Lcom/dropbox/core/v2/files/SaveUrlResult;
    .locals 2

    if-eqz p0, :cond_1

    .line 145
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 148
    new-instance v0, Lcom/dropbox/core/v2/files/SaveUrlResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SaveUrlResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;->ASYNC_JOB_ID:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/SaveUrlResult;->withTagAndAsyncJobId(Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/files/SaveUrlResult;

    move-result-object p0

    return-object p0

    .line 146
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is shorter than 1"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 143
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static complete(Lcom/dropbox/core/v2/files/FileMetadata;)Lcom/dropbox/core/v2/files/SaveUrlResult;
    .locals 2

    if-eqz p0, :cond_0

    .line 197
    new-instance v0, Lcom/dropbox/core/v2/files/SaveUrlResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SaveUrlResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;->COMPLETE:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/SaveUrlResult;->withTagAndComplete(Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;Lcom/dropbox/core/v2/files/FileMetadata;)Lcom/dropbox/core/v2/files/SaveUrlResult;

    move-result-object p0

    return-object p0

    .line 195
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;)Lcom/dropbox/core/v2/files/SaveUrlResult;
    .locals 1

    .line 60
    new-instance v0, Lcom/dropbox/core/v2/files/SaveUrlResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SaveUrlResult;-><init>()V

    .line 61
    iput-object p1, v0, Lcom/dropbox/core/v2/files/SaveUrlResult;->_tag:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    return-object v0
.end method

.method private withTagAndAsyncJobId(Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/files/SaveUrlResult;
    .locals 1

    .line 77
    new-instance v0, Lcom/dropbox/core/v2/files/SaveUrlResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SaveUrlResult;-><init>()V

    .line 78
    iput-object p1, v0, Lcom/dropbox/core/v2/files/SaveUrlResult;->_tag:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    .line 79
    iput-object p2, v0, Lcom/dropbox/core/v2/files/SaveUrlResult;->asyncJobIdValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndComplete(Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;Lcom/dropbox/core/v2/files/FileMetadata;)Lcom/dropbox/core/v2/files/SaveUrlResult;
    .locals 1

    .line 93
    new-instance v0, Lcom/dropbox/core/v2/files/SaveUrlResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SaveUrlResult;-><init>()V

    .line 94
    iput-object p1, v0, Lcom/dropbox/core/v2/files/SaveUrlResult;->_tag:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    .line 95
    iput-object p2, v0, Lcom/dropbox/core/v2/files/SaveUrlResult;->completeValue:Lcom/dropbox/core/v2/files/FileMetadata;

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

    .line 236
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/SaveUrlResult;

    if-eqz v2, :cond_9

    .line 237
    check-cast p1, Lcom/dropbox/core/v2/files/SaveUrlResult;

    .line 238
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SaveUrlResult;->_tag:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/SaveUrlResult;->_tag:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 241
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/SaveUrlResult$1;->$SwitchMap$com$dropbox$core$v2$files$SaveUrlResult$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/SaveUrlResult;->_tag:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_6

    const/4 v3, 0x2

    if-eq v2, v3, :cond_3

    return v1

    .line 245
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SaveUrlResult;->completeValue:Lcom/dropbox/core/v2/files/FileMetadata;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/SaveUrlResult;->completeValue:Lcom/dropbox/core/v2/files/FileMetadata;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/FileMetadata;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    .line 243
    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SaveUrlResult;->asyncJobIdValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/SaveUrlResult;->asyncJobIdValue:Ljava/lang/String;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public getAsyncJobIdValue()Ljava/lang/String;
    .locals 3

    .line 163
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveUrlResult;->_tag:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;->ASYNC_JOB_ID:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    if-ne v0, v1, :cond_0

    .line 166
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveUrlResult;->asyncJobIdValue:Ljava/lang/String;

    return-object v0

    .line 164
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ASYNC_JOB_ID, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/SaveUrlResult;->_tag:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getCompleteValue()Lcom/dropbox/core/v2/files/FileMetadata;
    .locals 3

    .line 211
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveUrlResult;->_tag:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;->COMPLETE:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    if-ne v0, v1, :cond_0

    .line 214
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveUrlResult;->completeValue:Lcom/dropbox/core/v2/files/FileMetadata;

    return-object v0

    .line 212
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.COMPLETE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/SaveUrlResult;->_tag:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 219
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveUrlResult;->_tag:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/SaveUrlResult;->asyncJobIdValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/SaveUrlResult;->completeValue:Lcom/dropbox/core/v2/files/FileMetadata;

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

    .line 224
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isAsyncJobId()Z
    .locals 2

    .line 122
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveUrlResult;->_tag:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;->ASYNC_JOB_ID:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isComplete()Z
    .locals 2

    .line 177
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveUrlResult;->_tag:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;->COMPLETE:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SaveUrlResult;->_tag:Lcom/dropbox/core/v2/files/SaveUrlResult$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 257
    sget-object v0, Lcom/dropbox/core/v2/files/SaveUrlResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SaveUrlResult$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/SaveUrlResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 269
    sget-object v0, Lcom/dropbox/core/v2/files/SaveUrlResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SaveUrlResult$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/SaveUrlResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
