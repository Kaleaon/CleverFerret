.class public final Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;
.super Ljava/lang/Object;
.source "TeamFolderArchiveJobStatus.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Serializer;,
        Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;
    }
.end annotation


# static fields
.field public static final IN_PROGRESS:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

.field private completeValue:Lcom/dropbox/core/v2/team/TeamFolderMetadata;

.field private failedValue:Lcom/dropbox/core/v2/team/TeamFolderArchiveError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 51
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;->IN_PROGRESS:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->withTag(Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;)Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->IN_PROGRESS:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;)Lcom/dropbox/core/v2/team/TeamFolderMetadata;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->completeValue:Lcom/dropbox/core/v2/team/TeamFolderMetadata;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;)Lcom/dropbox/core/v2/team/TeamFolderArchiveError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->failedValue:Lcom/dropbox/core/v2/team/TeamFolderArchiveError;

    return-object p0
.end method

.method public static complete(Lcom/dropbox/core/v2/team/TeamFolderMetadata;)Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;
    .locals 2

    if-eqz p0, :cond_0

    .line 162
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->withTagAndComplete(Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;Lcom/dropbox/core/v2/team/TeamFolderMetadata;)Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;

    move-result-object p0

    return-object p0

    .line 160
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static failed(Lcom/dropbox/core/v2/team/TeamFolderArchiveError;)Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;
    .locals 2

    if-eqz p0, :cond_0

    .line 212
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;->FAILED:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->withTagAndFailed(Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;Lcom/dropbox/core/v2/team/TeamFolderArchiveError;)Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;

    move-result-object p0

    return-object p0

    .line 210
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;)Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;
    .locals 1

    .line 69
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;-><init>()V

    .line 70
    iput-object p1, v0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->_tag:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    return-object v0
.end method

.method private withTagAndComplete(Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;Lcom/dropbox/core/v2/team/TeamFolderMetadata;)Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;
    .locals 1

    .line 84
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;-><init>()V

    .line 85
    iput-object p1, v0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->_tag:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    .line 86
    iput-object p2, v0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->completeValue:Lcom/dropbox/core/v2/team/TeamFolderMetadata;

    return-object v0
.end method

.method private withTagAndFailed(Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;Lcom/dropbox/core/v2/team/TeamFolderArchiveError;)Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;
    .locals 1

    .line 101
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;-><init>()V

    .line 102
    iput-object p1, v0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->_tag:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    .line 103
    iput-object p2, v0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->failedValue:Lcom/dropbox/core/v2/team/TeamFolderArchiveError;

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

    .line 252
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;

    if-eqz v2, :cond_9

    .line 253
    check-cast p1, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;

    .line 254
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->_tag:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->_tag:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 257
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$1;->$SwitchMap$com$dropbox$core$v2$team$TeamFolderArchiveJobStatus$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->_tag:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_8

    const/4 v3, 0x2

    if-eq v2, v3, :cond_6

    const/4 v3, 0x3

    if-eq v2, v3, :cond_3

    return v1

    .line 263
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->failedValue:Lcom/dropbox/core/v2/team/TeamFolderArchiveError;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->failedValue:Lcom/dropbox/core/v2/team/TeamFolderArchiveError;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/TeamFolderArchiveError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    .line 261
    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->completeValue:Lcom/dropbox/core/v2/team/TeamFolderMetadata;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->completeValue:Lcom/dropbox/core/v2/team/TeamFolderMetadata;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/TeamFolderMetadata;->equals(Ljava/lang/Object;)Z

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

.method public getCompleteValue()Lcom/dropbox/core/v2/team/TeamFolderMetadata;
    .locals 3

    .line 177
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->_tag:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    if-ne v0, v1, :cond_0

    .line 180
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->completeValue:Lcom/dropbox/core/v2/team/TeamFolderMetadata;

    return-object v0

    .line 178
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.COMPLETE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->_tag:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getFailedValue()Lcom/dropbox/core/v2/team/TeamFolderArchiveError;
    .locals 3

    .line 227
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->_tag:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;->FAILED:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    if-ne v0, v1, :cond_0

    .line 230
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->failedValue:Lcom/dropbox/core/v2/team/TeamFolderArchiveError;

    return-object v0

    .line 228
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.FAILED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->_tag:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 235
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->_tag:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->completeValue:Lcom/dropbox/core/v2/team/TeamFolderMetadata;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->failedValue:Lcom/dropbox/core/v2/team/TeamFolderArchiveError;

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

    .line 240
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isComplete()Z
    .locals 2

    .line 141
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->_tag:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isFailed()Z
    .locals 2

    .line 191
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->_tag:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;->FAILED:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInProgress()Z
    .locals 2

    .line 130
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->_tag:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;->IN_PROGRESS:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus;->_tag:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 275
    sget-object v0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 287
    sget-object v0, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/TeamFolderArchiveJobStatus$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
