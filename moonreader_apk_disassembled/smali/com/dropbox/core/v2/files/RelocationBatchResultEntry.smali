.class public final Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;
.super Ljava/lang/Object;
.source "RelocationBatchResultEntry.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Serializer;,
        Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

.field private failureValue:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

.field private successValue:Lcom/dropbox/core/v2/files/Metadata;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 56
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;->OTHER:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->withTag(Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->OTHER:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;)Lcom/dropbox/core/v2/files/Metadata;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->successValue:Lcom/dropbox/core/v2/files/Metadata;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;)Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->failureValue:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    return-object p0
.end method

.method public static failure(Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;)Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;
    .locals 2

    if-eqz p0, :cond_0

    .line 201
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;->FAILURE:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->withTagAndFailure(Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;)Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;

    move-result-object p0

    return-object p0

    .line 199
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static success(Lcom/dropbox/core/v2/files/Metadata;)Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;
    .locals 2

    if-eqz p0, :cond_0

    .line 155
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;->SUCCESS:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->withTagAndSuccess(Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;Lcom/dropbox/core/v2/files/Metadata;)Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;

    move-result-object p0

    return-object p0

    .line 153
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;)Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;
    .locals 1

    .line 74
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;-><init>()V

    .line 75
    iput-object p1, v0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    return-object v0
.end method

.method private withTagAndFailure(Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;)Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;
    .locals 1

    .line 103
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;-><init>()V

    .line 104
    iput-object p1, v0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    .line 105
    iput-object p2, v0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->failureValue:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    return-object v0
.end method

.method private withTagAndSuccess(Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;Lcom/dropbox/core/v2/files/Metadata;)Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;
    .locals 1

    .line 88
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;-><init>()V

    .line 89
    iput-object p1, v0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    .line 90
    iput-object p2, v0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->successValue:Lcom/dropbox/core/v2/files/Metadata;

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

    .line 248
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;

    if-eqz v2, :cond_a

    .line 249
    check-cast p1, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;

    .line 250
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 253
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$1;->$SwitchMap$com$dropbox$core$v2$files$RelocationBatchResultEntry$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;->ordinal()I

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

    .line 257
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->failureValue:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->failureValue:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 255
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->successValue:Lcom/dropbox/core/v2/files/Metadata;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->successValue:Lcom/dropbox/core/v2/files/Metadata;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/Metadata;->equals(Ljava/lang/Object;)Z

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

.method public getFailureValue()Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;
    .locals 3

    .line 213
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;->FAILURE:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    if-ne v0, v1, :cond_0

    .line 216
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->failureValue:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

    return-object v0

    .line 214
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.FAILURE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSuccessValue()Lcom/dropbox/core/v2/files/Metadata;
    .locals 3

    .line 167
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;->SUCCESS:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    if-ne v0, v1, :cond_0

    .line 170
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->successValue:Lcom/dropbox/core/v2/files/Metadata;

    return-object v0

    .line 168
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.SUCCESS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 232
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->successValue:Lcom/dropbox/core/v2/files/Metadata;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->failureValue:Lcom/dropbox/core/v2/files/RelocationBatchErrorEntry;

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

    .line 181
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;->FAILURE:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 227
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;->OTHER:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSuccess()Z
    .locals 2

    .line 135
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;->SUCCESS:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry;->_tag:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 271
    sget-object v0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 283
    sget-object v0, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchResultEntry$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
