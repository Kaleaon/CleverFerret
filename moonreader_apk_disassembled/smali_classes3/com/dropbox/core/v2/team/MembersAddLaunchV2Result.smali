.class public final Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;
.super Ljava/lang/Object;
.source "MembersAddLaunchV2Result.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;,
        Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

.field private asyncJobIdValue:Ljava/lang/String;

.field private completeValue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/MemberAddV2Result;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 62
    new-instance v0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;->OTHER:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->withTag(Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;)Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->OTHER:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;)Ljava/lang/String;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->asyncJobIdValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;)Ljava/util/List;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->completeValue:Ljava/util/List;

    return-object p0
.end method

.method public static asyncJobId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;
    .locals 2

    if-eqz p0, :cond_1

    .line 168
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 171
    new-instance v0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;->ASYNC_JOB_ID:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->withTagAndAsyncJobId(Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;

    move-result-object p0

    return-object p0

    .line 169
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is shorter than 1"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 166
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static complete(Ljava/util/List;)Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/MemberAddV2Result;",
            ">;)",
            "Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;"
        }
    .end annotation

    if-eqz p0, :cond_2

    .line 221
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/team/MemberAddV2Result;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 223
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 226
    :cond_1
    new-instance v0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;->COMPLETE:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->withTagAndComplete(Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;Ljava/util/List;)Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;

    move-result-object p0

    return-object p0

    .line 219
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;)Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;
    .locals 1

    .line 80
    new-instance v0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;-><init>()V

    .line 81
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->_tag:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    return-object v0
.end method

.method private withTagAndAsyncJobId(Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;
    .locals 1

    .line 97
    new-instance v0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;-><init>()V

    .line 98
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->_tag:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    .line 99
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->asyncJobIdValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndComplete(Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;Ljava/util/List;)Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/MemberAddV2Result;",
            ">;)",
            "Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;"
        }
    .end annotation

    .line 113
    new-instance v0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;-><init>()V

    .line 114
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->_tag:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    .line 115
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->completeValue:Ljava/util/List;

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

    .line 274
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;

    if-eqz v2, :cond_a

    .line 275
    check-cast p1, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;

    .line 276
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->_tag:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->_tag:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 279
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$1;->$SwitchMap$com$dropbox$core$v2$team$MembersAddLaunchV2Result$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->_tag:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;->ordinal()I

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

    .line 283
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->completeValue:Ljava/util/List;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->completeValue:Ljava/util/List;

    if-eq v2, p1, :cond_6

    invoke-interface {v2, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 281
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->asyncJobIdValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->asyncJobIdValue:Ljava/lang/String;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public getAsyncJobIdValue()Ljava/lang/String;
    .locals 3

    .line 186
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->_tag:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;->ASYNC_JOB_ID:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    if-ne v0, v1, :cond_0

    .line 189
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->asyncJobIdValue:Ljava/lang/String;

    return-object v0

    .line 187
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ASYNC_JOB_ID, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->_tag:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getCompleteValue()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/MemberAddV2Result;",
            ">;"
        }
    .end annotation

    .line 238
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->_tag:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;->COMPLETE:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    if-ne v0, v1, :cond_0

    .line 241
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->completeValue:Ljava/util/List;

    return-object v0

    .line 239
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.COMPLETE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->_tag:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 257
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->_tag:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->asyncJobIdValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->completeValue:Ljava/util/List;

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

    .line 262
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isAsyncJobId()Z
    .locals 2

    .line 145
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->_tag:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;->ASYNC_JOB_ID:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isComplete()Z
    .locals 2

    .line 200
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->_tag:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;->COMPLETE:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 252
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->_tag:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;->OTHER:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result;->_tag:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 297
    sget-object v0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 309
    sget-object v0, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/MembersAddLaunchV2Result$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
