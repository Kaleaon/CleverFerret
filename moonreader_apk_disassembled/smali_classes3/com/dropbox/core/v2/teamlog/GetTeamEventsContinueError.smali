.class public final Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;
.super Ljava/lang/Object;
.source "GetTeamEventsContinueError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Serializer;,
        Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;
    }
.end annotation


# static fields
.field public static final BAD_CURSOR:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;

.field public static final OTHER:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

.field private resetValue:Ljava/util/Date;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 69
    new-instance v0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;->BAD_CURSOR:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->withTag(Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;)Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->BAD_CURSOR:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;

    .line 77
    new-instance v0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->withTag(Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;)Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->OTHER:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;)Ljava/util/Date;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->resetValue:Ljava/util/Date;

    return-object p0
.end method

.method public static reset(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;
    .locals 2

    if-eqz p0, :cond_0

    .line 188
    new-instance v0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;->RESET:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->withTagAndReset(Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;

    move-result-object p0

    return-object p0

    .line 186
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;)Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;
    .locals 1

    .line 96
    new-instance v0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;-><init>()V

    .line 97
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->_tag:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

    return-object v0
.end method

.method private withTagAndReset(Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;
    .locals 1

    .line 119
    new-instance v0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;-><init>()V

    .line 120
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->_tag:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

    .line 121
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->resetValue:Ljava/util/Date;

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

    .line 242
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;

    if-eqz v2, :cond_7

    .line 243
    check-cast p1, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;

    .line 244
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->_tag:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->_tag:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 247
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$1;->$SwitchMap$com$dropbox$core$v2$teamlog$GetTeamEventsContinueError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->_tag:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_6

    const/4 v3, 0x2

    if-eq v2, v3, :cond_4

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 251
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->resetValue:Ljava/util/Date;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->resetValue:Ljava/util/Date;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    :cond_7
    return v1
.end method

.method public getResetValue()Ljava/util/Date;
    .locals 3

    .line 208
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->_tag:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;->RESET:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

    if-ne v0, v1, :cond_0

    .line 211
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->resetValue:Ljava/util/Date;

    return-object v0

    .line 209
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.RESET, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->_tag:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 227
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->_tag:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->resetValue:Ljava/util/Date;

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

.method public isBadCursor()Z
    .locals 2

    .line 151
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->_tag:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;->BAD_CURSOR:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 222
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->_tag:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isReset()Z
    .locals 2

    .line 162
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->_tag:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;->RESET:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;
    .locals 1

    .line 140
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;->_tag:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 265
    sget-object v0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 277
    sget-object v0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
