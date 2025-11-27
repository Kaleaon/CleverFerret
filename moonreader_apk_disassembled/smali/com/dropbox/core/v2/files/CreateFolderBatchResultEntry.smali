.class public final Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;
.super Ljava/lang/Object;
.source "CreateFolderBatchResultEntry.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Serializer;,
        Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;
    }
.end annotation


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

.field private failureValue:Lcom/dropbox/core/v2/files/CreateFolderEntryError;

.field private successValue:Lcom/dropbox/core/v2/files/CreateFolderEntryResult;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;)Lcom/dropbox/core/v2/files/CreateFolderEntryResult;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->successValue:Lcom/dropbox/core/v2/files/CreateFolderEntryResult;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;)Lcom/dropbox/core/v2/files/CreateFolderEntryError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->failureValue:Lcom/dropbox/core/v2/files/CreateFolderEntryError;

    return-object p0
.end method

.method public static failure(Lcom/dropbox/core/v2/files/CreateFolderEntryError;)Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;
    .locals 2

    if-eqz p0, :cond_0

    .line 176
    new-instance v0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;->FAILURE:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->withTagAndFailure(Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;Lcom/dropbox/core/v2/files/CreateFolderEntryError;)Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;

    move-result-object p0

    return-object p0

    .line 174
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static success(Lcom/dropbox/core/v2/files/CreateFolderEntryResult;)Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;
    .locals 2

    if-eqz p0, :cond_0

    .line 130
    new-instance v0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;->SUCCESS:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->withTagAndSuccess(Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;Lcom/dropbox/core/v2/files/CreateFolderEntryResult;)Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;

    move-result-object p0

    return-object p0

    .line 128
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;)Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;
    .locals 1

    .line 52
    new-instance v0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;-><init>()V

    .line 53
    iput-object p1, v0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    return-object v0
.end method

.method private withTagAndFailure(Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;Lcom/dropbox/core/v2/files/CreateFolderEntryError;)Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;
    .locals 1

    .line 81
    new-instance v0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;-><init>()V

    .line 82
    iput-object p1, v0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    .line 83
    iput-object p2, v0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->failureValue:Lcom/dropbox/core/v2/files/CreateFolderEntryError;

    return-object v0
.end method

.method private withTagAndSuccess(Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;Lcom/dropbox/core/v2/files/CreateFolderEntryResult;)Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;
    .locals 1

    .line 66
    new-instance v0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;-><init>()V

    .line 67
    iput-object p1, v0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    .line 68
    iput-object p2, v0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->successValue:Lcom/dropbox/core/v2/files/CreateFolderEntryResult;

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

    .line 212
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;

    if-eqz v2, :cond_9

    .line 213
    check-cast p1, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;

    .line 214
    iget-object v2, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 217
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$1;->$SwitchMap$com$dropbox$core$v2$files$CreateFolderBatchResultEntry$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_6

    const/4 v3, 0x2

    if-eq v2, v3, :cond_3

    return v1

    .line 221
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->failureValue:Lcom/dropbox/core/v2/files/CreateFolderEntryError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->failureValue:Lcom/dropbox/core/v2/files/CreateFolderEntryError;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/CreateFolderEntryError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    .line 219
    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->successValue:Lcom/dropbox/core/v2/files/CreateFolderEntryResult;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->successValue:Lcom/dropbox/core/v2/files/CreateFolderEntryResult;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/CreateFolderEntryResult;->equals(Ljava/lang/Object;)Z

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

.method public getFailureValue()Lcom/dropbox/core/v2/files/CreateFolderEntryError;
    .locals 3

    .line 188
    iget-object v0, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;->FAILURE:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    if-ne v0, v1, :cond_0

    .line 191
    iget-object v0, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->failureValue:Lcom/dropbox/core/v2/files/CreateFolderEntryError;

    return-object v0

    .line 189
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.FAILURE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSuccessValue()Lcom/dropbox/core/v2/files/CreateFolderEntryResult;
    .locals 3

    .line 142
    iget-object v0, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;->SUCCESS:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    if-ne v0, v1, :cond_0

    .line 145
    iget-object v0, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->successValue:Lcom/dropbox/core/v2/files/CreateFolderEntryResult;

    return-object v0

    .line 143
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.SUCCESS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 196
    iget-object v0, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->successValue:Lcom/dropbox/core/v2/files/CreateFolderEntryResult;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->failureValue:Lcom/dropbox/core/v2/files/CreateFolderEntryError;

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

    .line 156
    iget-object v0, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;->FAILURE:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSuccess()Z
    .locals 2

    .line 110
    iget-object v0, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;->SUCCESS:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 233
    sget-object v0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 245
    sget-object v0, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/CreateFolderBatchResultEntry$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
