.class public final Lcom/dropbox/core/v2/team/MembersAddJobStatus;
.super Ljava/lang/Object;
.source "MembersAddJobStatus.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/MembersAddJobStatus$Serializer;,
        Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;
    }
.end annotation


# static fields
.field public static final IN_PROGRESS:Lcom/dropbox/core/v2/team/MembersAddJobStatus;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

.field private completeValue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/MemberAddResult;",
            ">;"
        }
    .end annotation
.end field

.field private failedValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 54
    new-instance v0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersAddJobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;->IN_PROGRESS:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->withTag(Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;)Lcom/dropbox/core/v2/team/MembersAddJobStatus;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->IN_PROGRESS:Lcom/dropbox/core/v2/team/MembersAddJobStatus;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/MembersAddJobStatus;)Ljava/util/List;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->completeValue:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/MembersAddJobStatus;)Ljava/lang/String;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->failedValue:Ljava/lang/String;

    return-object p0
.end method

.method public static complete(Ljava/util/List;)Lcom/dropbox/core/v2/team/MembersAddJobStatus;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/MemberAddResult;",
            ">;)",
            "Lcom/dropbox/core/v2/team/MembersAddJobStatus;"
        }
    .end annotation

    if-eqz p0, :cond_2

    .line 170
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/team/MemberAddResult;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 172
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 175
    :cond_1
    new-instance v0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersAddJobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->withTagAndComplete(Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;Ljava/util/List;)Lcom/dropbox/core/v2/team/MembersAddJobStatus;

    move-result-object p0

    return-object p0

    .line 168
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static failed(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersAddJobStatus;
    .locals 2

    if-eqz p0, :cond_0

    .line 227
    new-instance v0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersAddJobStatus;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;->FAILED:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->withTagAndFailed(Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersAddJobStatus;

    move-result-object p0

    return-object p0

    .line 225
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;)Lcom/dropbox/core/v2/team/MembersAddJobStatus;
    .locals 1

    .line 72
    new-instance v0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersAddJobStatus;-><init>()V

    .line 73
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->_tag:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    return-object v0
.end method

.method private withTagAndComplete(Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;Ljava/util/List;)Lcom/dropbox/core/v2/team/MembersAddJobStatus;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/MemberAddResult;",
            ">;)",
            "Lcom/dropbox/core/v2/team/MembersAddJobStatus;"
        }
    .end annotation

    .line 90
    new-instance v0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersAddJobStatus;-><init>()V

    .line 91
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->_tag:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    .line 92
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->completeValue:Ljava/util/List;

    return-object v0
.end method

.method private withTagAndFailed(Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersAddJobStatus;
    .locals 1

    .line 106
    new-instance v0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersAddJobStatus;-><init>()V

    .line 107
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->_tag:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    .line 108
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->failedValue:Ljava/lang/String;

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

    .line 267
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/MembersAddJobStatus;

    if-eqz v2, :cond_9

    .line 268
    check-cast p1, Lcom/dropbox/core/v2/team/MembersAddJobStatus;

    .line 269
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->_tag:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->_tag:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 272
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/MembersAddJobStatus$1;->$SwitchMap$com$dropbox$core$v2$team$MembersAddJobStatus$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->_tag:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_8

    const/4 v3, 0x2

    if-eq v2, v3, :cond_6

    const/4 v3, 0x3

    if-eq v2, v3, :cond_3

    return v1

    .line 278
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->failedValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->failedValue:Ljava/lang/String;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    .line 276
    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->completeValue:Ljava/util/List;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->completeValue:Ljava/util/List;

    if-eq v2, p1, :cond_8

    invoke-interface {v2, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

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

.method public getCompleteValue()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/MemberAddResult;",
            ">;"
        }
    .end annotation

    .line 192
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->_tag:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    if-ne v0, v1, :cond_0

    .line 195
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->completeValue:Ljava/util/List;

    return-object v0

    .line 193
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.COMPLETE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->_tag:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getFailedValue()Ljava/lang/String;
    .locals 3

    .line 242
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->_tag:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;->FAILED:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    if-ne v0, v1, :cond_0

    .line 245
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->failedValue:Ljava/lang/String;

    return-object v0

    .line 243
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.FAILED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->_tag:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 250
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->_tag:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->completeValue:Ljava/util/List;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->failedValue:Ljava/lang/String;

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

    .line 255
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isComplete()Z
    .locals 2

    .line 146
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->_tag:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isFailed()Z
    .locals 2

    .line 206
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->_tag:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;->FAILED:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInProgress()Z
    .locals 2

    .line 135
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->_tag:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;->IN_PROGRESS:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus;->_tag:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 290
    sget-object v0, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 302
    sget-object v0, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
