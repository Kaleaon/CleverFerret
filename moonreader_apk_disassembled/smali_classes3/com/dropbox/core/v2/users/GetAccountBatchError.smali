.class public final Lcom/dropbox/core/v2/users/GetAccountBatchError;
.super Ljava/lang/Object;
.source "GetAccountBatchError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/users/GetAccountBatchError$Serializer;,
        Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/users/GetAccountBatchError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;

.field private noAccountValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 59
    new-instance v0, Lcom/dropbox/core/v2/users/GetAccountBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/GetAccountBatchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;->OTHER:Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/users/GetAccountBatchError;->withTag(Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;)Lcom/dropbox/core/v2/users/GetAccountBatchError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/users/GetAccountBatchError;->OTHER:Lcom/dropbox/core/v2/users/GetAccountBatchError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/users/GetAccountBatchError;)Ljava/lang/String;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/users/GetAccountBatchError;->noAccountValue:Ljava/lang/String;

    return-object p0
.end method

.method public static noAccount(Ljava/lang/String;)Lcom/dropbox/core/v2/users/GetAccountBatchError;
    .locals 2

    if-eqz p0, :cond_2

    .line 147
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x28

    if-lt v0, v1, :cond_1

    .line 150
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, v1, :cond_0

    .line 153
    new-instance v0, Lcom/dropbox/core/v2/users/GetAccountBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/GetAccountBatchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;->NO_ACCOUNT:Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/users/GetAccountBatchError;->withTagAndNoAccount(Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/users/GetAccountBatchError;

    move-result-object p0

    return-object p0

    .line 151
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 40"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 148
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is shorter than 40"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 145
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;)Lcom/dropbox/core/v2/users/GetAccountBatchError;
    .locals 1

    .line 76
    new-instance v0, Lcom/dropbox/core/v2/users/GetAccountBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/GetAccountBatchError;-><init>()V

    .line 77
    iput-object p1, v0, Lcom/dropbox/core/v2/users/GetAccountBatchError;->_tag:Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;

    return-object v0
.end method

.method private withTagAndNoAccount(Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/users/GetAccountBatchError;
    .locals 1

    .line 93
    new-instance v0, Lcom/dropbox/core/v2/users/GetAccountBatchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/users/GetAccountBatchError;-><init>()V

    .line 94
    iput-object p1, v0, Lcom/dropbox/core/v2/users/GetAccountBatchError;->_tag:Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;

    .line 95
    iput-object p2, v0, Lcom/dropbox/core/v2/users/GetAccountBatchError;->noAccountValue:Ljava/lang/String;

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

    .line 202
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/users/GetAccountBatchError;

    if-eqz v2, :cond_7

    .line 203
    check-cast p1, Lcom/dropbox/core/v2/users/GetAccountBatchError;

    .line 204
    iget-object v2, p0, Lcom/dropbox/core/v2/users/GetAccountBatchError;->_tag:Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/GetAccountBatchError;->_tag:Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 207
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/users/GetAccountBatchError$1;->$SwitchMap$com$dropbox$core$v2$users$GetAccountBatchError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/users/GetAccountBatchError;->_tag:Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_4

    const/4 p1, 0x2

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 209
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/users/GetAccountBatchError;->noAccountValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/users/GetAccountBatchError;->noAccountValue:Ljava/lang/String;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public getNoAccountValue()Ljava/lang/String;
    .locals 3

    .line 168
    iget-object v0, p0, Lcom/dropbox/core/v2/users/GetAccountBatchError;->_tag:Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;->NO_ACCOUNT:Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;

    if-ne v0, v1, :cond_0

    .line 171
    iget-object v0, p0, Lcom/dropbox/core/v2/users/GetAccountBatchError;->noAccountValue:Ljava/lang/String;

    return-object v0

    .line 169
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.NO_ACCOUNT, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/users/GetAccountBatchError;->_tag:Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 187
    iget-object v0, p0, Lcom/dropbox/core/v2/users/GetAccountBatchError;->_tag:Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/users/GetAccountBatchError;->noAccountValue:Ljava/lang/String;

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

.method public isNoAccount()Z
    .locals 2

    .line 125
    iget-object v0, p0, Lcom/dropbox/core/v2/users/GetAccountBatchError;->_tag:Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;->NO_ACCOUNT:Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 182
    iget-object v0, p0, Lcom/dropbox/core/v2/users/GetAccountBatchError;->_tag:Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;->OTHER:Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/dropbox/core/v2/users/GetAccountBatchError;->_tag:Lcom/dropbox/core/v2/users/GetAccountBatchError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 223
    sget-object v0, Lcom/dropbox/core/v2/users/GetAccountBatchError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/GetAccountBatchError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/users/GetAccountBatchError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 235
    sget-object v0, Lcom/dropbox/core/v2/users/GetAccountBatchError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/GetAccountBatchError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/users/GetAccountBatchError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
