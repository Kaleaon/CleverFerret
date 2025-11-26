.class public final Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;
.super Ljava/lang/Object;
.source "ShareFolderLaunch.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Serializer;,
        Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;
    }
.end annotation


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

.field private asyncJobIdValue:Ljava/lang/String;

.field private completeValue:Lcom/dropbox/core/v2/sharing/SharedFolderMetadata;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;)Ljava/lang/String;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->asyncJobIdValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;)Lcom/dropbox/core/v2/sharing/SharedFolderMetadata;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->completeValue:Lcom/dropbox/core/v2/sharing/SharedFolderMetadata;

    return-object p0
.end method

.method public static asyncJobId(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;
    .locals 2

    if-eqz p0, :cond_1

    .line 141
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 144
    new-instance v0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;->ASYNC_JOB_ID:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->withTagAndAsyncJobId(Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;

    move-result-object p0

    return-object p0

    .line 142
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is shorter than 1"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 139
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static complete(Lcom/dropbox/core/v2/sharing/SharedFolderMetadata;)Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;
    .locals 2

    if-eqz p0, :cond_0

    .line 193
    new-instance v0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;->COMPLETE:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->withTagAndComplete(Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;Lcom/dropbox/core/v2/sharing/SharedFolderMetadata;)Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;

    move-result-object p0

    return-object p0

    .line 191
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;)Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;
    .locals 1

    .line 57
    new-instance v0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;-><init>()V

    .line 58
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    return-object v0
.end method

.method private withTagAndAsyncJobId(Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;
    .locals 1

    .line 74
    new-instance v0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;-><init>()V

    .line 75
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    .line 76
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->asyncJobIdValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndComplete(Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;Lcom/dropbox/core/v2/sharing/SharedFolderMetadata;)Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;
    .locals 1

    .line 89
    new-instance v0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;-><init>()V

    .line 90
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    .line 91
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->completeValue:Lcom/dropbox/core/v2/sharing/SharedFolderMetadata;

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

    .line 230
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;

    if-eqz v2, :cond_9

    .line 231
    check-cast p1, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;

    .line 232
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 235
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$1;->$SwitchMap$com$dropbox$core$v2$sharing$ShareFolderLaunch$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_6

    const/4 v3, 0x2

    if-eq v2, v3, :cond_3

    return v1

    .line 239
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->completeValue:Lcom/dropbox/core/v2/sharing/SharedFolderMetadata;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->completeValue:Lcom/dropbox/core/v2/sharing/SharedFolderMetadata;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/SharedFolderMetadata;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    .line 237
    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->asyncJobIdValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->asyncJobIdValue:Ljava/lang/String;

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

    .line 159
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;->ASYNC_JOB_ID:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    if-ne v0, v1, :cond_0

    .line 162
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->asyncJobIdValue:Ljava/lang/String;

    return-object v0

    .line 160
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ASYNC_JOB_ID, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getCompleteValue()Lcom/dropbox/core/v2/sharing/SharedFolderMetadata;
    .locals 3

    .line 205
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;->COMPLETE:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    if-ne v0, v1, :cond_0

    .line 208
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->completeValue:Lcom/dropbox/core/v2/sharing/SharedFolderMetadata;

    return-object v0

    .line 206
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.COMPLETE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 213
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->asyncJobIdValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->completeValue:Lcom/dropbox/core/v2/sharing/SharedFolderMetadata;

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

    .line 218
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isAsyncJobId()Z
    .locals 2

    .line 118
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;->ASYNC_JOB_ID:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isComplete()Z
    .locals 2

    .line 173
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;->COMPLETE:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch;->_tag:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 251
    sget-object v0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 263
    sget-object v0, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/ShareFolderLaunch$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
