.class public final Lcom/dropbox/core/v2/async/LaunchResultBase;
.super Ljava/lang/Object;
.source "LaunchResultBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/async/LaunchResultBase$Serializer;,
        Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;
    }
.end annotation


# instance fields
.field private _tag:Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;

.field private asyncJobIdValue:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/async/LaunchResultBase;)Ljava/lang/String;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/dropbox/core/v2/async/LaunchResultBase;->asyncJobIdValue:Ljava/lang/String;

    return-object p0
.end method

.method public static asyncJobId(Ljava/lang/String;)Lcom/dropbox/core/v2/async/LaunchResultBase;
    .locals 2

    if-eqz p0, :cond_1

    .line 139
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 142
    new-instance v0, Lcom/dropbox/core/v2/async/LaunchResultBase;

    invoke-direct {v0}, Lcom/dropbox/core/v2/async/LaunchResultBase;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;->ASYNC_JOB_ID:Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/async/LaunchResultBase;->withTagAndAsyncJobId(Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/async/LaunchResultBase;

    move-result-object p0

    return-object p0

    .line 140
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is shorter than 1"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 137
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;)Lcom/dropbox/core/v2/async/LaunchResultBase;
    .locals 1

    .line 65
    new-instance v0, Lcom/dropbox/core/v2/async/LaunchResultBase;

    invoke-direct {v0}, Lcom/dropbox/core/v2/async/LaunchResultBase;-><init>()V

    .line 66
    iput-object p1, v0, Lcom/dropbox/core/v2/async/LaunchResultBase;->_tag:Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;

    return-object v0
.end method

.method private withTagAndAsyncJobId(Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/async/LaunchResultBase;
    .locals 1

    .line 87
    new-instance v0, Lcom/dropbox/core/v2/async/LaunchResultBase;

    invoke-direct {v0}, Lcom/dropbox/core/v2/async/LaunchResultBase;-><init>()V

    .line 88
    iput-object p1, v0, Lcom/dropbox/core/v2/async/LaunchResultBase;->_tag:Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;

    .line 89
    iput-object p2, v0, Lcom/dropbox/core/v2/async/LaunchResultBase;->asyncJobIdValue:Ljava/lang/String;

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

    .line 180
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/async/LaunchResultBase;

    if-eqz v2, :cond_6

    .line 181
    check-cast p1, Lcom/dropbox/core/v2/async/LaunchResultBase;

    .line 182
    iget-object v2, p0, Lcom/dropbox/core/v2/async/LaunchResultBase;->_tag:Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/async/LaunchResultBase;->_tag:Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 185
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/async/LaunchResultBase$1;->$SwitchMap$com$dropbox$core$v2$async$LaunchResultBase$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/async/LaunchResultBase;->_tag:Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_3

    return v1

    .line 187
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/async/LaunchResultBase;->asyncJobIdValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/async/LaunchResultBase;->asyncJobIdValue:Ljava/lang/String;

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

    :cond_6
    return v1
.end method

.method public getAsyncJobIdValue()Ljava/lang/String;
    .locals 3

    .line 157
    iget-object v0, p0, Lcom/dropbox/core/v2/async/LaunchResultBase;->_tag:Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;

    sget-object v1, Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;->ASYNC_JOB_ID:Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;

    if-ne v0, v1, :cond_0

    .line 160
    iget-object v0, p0, Lcom/dropbox/core/v2/async/LaunchResultBase;->asyncJobIdValue:Ljava/lang/String;

    return-object v0

    .line 158
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ASYNC_JOB_ID, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/async/LaunchResultBase;->_tag:Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;->name()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/dropbox/core/v2/async/LaunchResultBase;->_tag:Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/async/LaunchResultBase;->asyncJobIdValue:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isAsyncJobId()Z
    .locals 2

    .line 116
    iget-object v0, p0, Lcom/dropbox/core/v2/async/LaunchResultBase;->_tag:Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;

    sget-object v1, Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;->ASYNC_JOB_ID:Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/dropbox/core/v2/async/LaunchResultBase;->_tag:Lcom/dropbox/core/v2/async/LaunchResultBase$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 199
    sget-object v0, Lcom/dropbox/core/v2/async/LaunchResultBase$Serializer;->INSTANCE:Lcom/dropbox/core/v2/async/LaunchResultBase$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/async/LaunchResultBase$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 211
    sget-object v0, Lcom/dropbox/core/v2/async/LaunchResultBase$Serializer;->INSTANCE:Lcom/dropbox/core/v2/async/LaunchResultBase$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/async/LaunchResultBase$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
