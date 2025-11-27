.class public final Lcom/dropbox/core/v2/team/UserDeleteResult;
.super Ljava/lang/Object;
.source "UserDeleteResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/UserDeleteResult$Serializer;,
        Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/team/UserDeleteResult;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

.field private invalidUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

.field private successValue:Lcom/dropbox/core/v2/team/UserDeleteEmailsResult;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 68
    new-instance v0, Lcom/dropbox/core/v2/team/UserDeleteResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserDeleteResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;->OTHER:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/UserDeleteResult;->withTag(Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;)Lcom/dropbox/core/v2/team/UserDeleteResult;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/UserDeleteResult;->OTHER:Lcom/dropbox/core/v2/team/UserDeleteResult;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/UserDeleteResult;)Lcom/dropbox/core/v2/team/UserDeleteEmailsResult;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/dropbox/core/v2/team/UserDeleteResult;->successValue:Lcom/dropbox/core/v2/team/UserDeleteEmailsResult;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/UserDeleteResult;)Lcom/dropbox/core/v2/team/UserSelectorArg;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/dropbox/core/v2/team/UserDeleteResult;->invalidUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    return-object p0
.end method

.method public static invalidUser(Lcom/dropbox/core/v2/team/UserSelectorArg;)Lcom/dropbox/core/v2/team/UserDeleteResult;
    .locals 2

    if-eqz p0, :cond_0

    .line 232
    new-instance v0, Lcom/dropbox/core/v2/team/UserDeleteResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserDeleteResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;->INVALID_USER:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/UserDeleteResult;->withTagAndInvalidUser(Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;Lcom/dropbox/core/v2/team/UserSelectorArg;)Lcom/dropbox/core/v2/team/UserDeleteResult;

    move-result-object p0

    return-object p0

    .line 230
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static success(Lcom/dropbox/core/v2/team/UserDeleteEmailsResult;)Lcom/dropbox/core/v2/team/UserDeleteResult;
    .locals 2

    if-eqz p0, :cond_0

    .line 182
    new-instance v0, Lcom/dropbox/core/v2/team/UserDeleteResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserDeleteResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/UserDeleteResult;->withTagAndSuccess(Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;Lcom/dropbox/core/v2/team/UserDeleteEmailsResult;)Lcom/dropbox/core/v2/team/UserDeleteResult;

    move-result-object p0

    return-object p0

    .line 180
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;)Lcom/dropbox/core/v2/team/UserDeleteResult;
    .locals 1

    .line 90
    new-instance v0, Lcom/dropbox/core/v2/team/UserDeleteResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserDeleteResult;-><init>()V

    .line 91
    iput-object p1, v0, Lcom/dropbox/core/v2/team/UserDeleteResult;->_tag:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    return-object v0
.end method

.method private withTagAndInvalidUser(Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;Lcom/dropbox/core/v2/team/UserSelectorArg;)Lcom/dropbox/core/v2/team/UserDeleteResult;
    .locals 1

    .line 129
    new-instance v0, Lcom/dropbox/core/v2/team/UserDeleteResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserDeleteResult;-><init>()V

    .line 130
    iput-object p1, v0, Lcom/dropbox/core/v2/team/UserDeleteResult;->_tag:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    .line 131
    iput-object p2, v0, Lcom/dropbox/core/v2/team/UserDeleteResult;->invalidUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    return-object v0
.end method

.method private withTagAndSuccess(Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;Lcom/dropbox/core/v2/team/UserDeleteEmailsResult;)Lcom/dropbox/core/v2/team/UserDeleteResult;
    .locals 1

    .line 109
    new-instance v0, Lcom/dropbox/core/v2/team/UserDeleteResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserDeleteResult;-><init>()V

    .line 110
    iput-object p1, v0, Lcom/dropbox/core/v2/team/UserDeleteResult;->_tag:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    .line 111
    iput-object p2, v0, Lcom/dropbox/core/v2/team/UserDeleteResult;->successValue:Lcom/dropbox/core/v2/team/UserDeleteEmailsResult;

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

    .line 282
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/UserDeleteResult;

    if-eqz v2, :cond_a

    .line 283
    check-cast p1, Lcom/dropbox/core/v2/team/UserDeleteResult;

    .line 284
    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserDeleteResult;->_tag:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/UserDeleteResult;->_tag:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 287
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/UserDeleteResult$1;->$SwitchMap$com$dropbox$core$v2$team$UserDeleteResult$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/UserDeleteResult;->_tag:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;->ordinal()I

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

    .line 291
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserDeleteResult;->invalidUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/UserDeleteResult;->invalidUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/UserSelectorArg;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 289
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserDeleteResult;->successValue:Lcom/dropbox/core/v2/team/UserDeleteEmailsResult;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/UserDeleteResult;->successValue:Lcom/dropbox/core/v2/team/UserDeleteEmailsResult;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/UserDeleteEmailsResult;->equals(Ljava/lang/Object;)Z

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

.method public getInvalidUserValue()Lcom/dropbox/core/v2/team/UserSelectorArg;
    .locals 3

    .line 247
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserDeleteResult;->_tag:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;->INVALID_USER:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    if-ne v0, v1, :cond_0

    .line 250
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserDeleteResult;->invalidUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    return-object v0

    .line 248
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.INVALID_USER, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserDeleteResult;->_tag:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSuccessValue()Lcom/dropbox/core/v2/team/UserDeleteEmailsResult;
    .locals 3

    .line 197
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserDeleteResult;->_tag:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    if-ne v0, v1, :cond_0

    .line 200
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserDeleteResult;->successValue:Lcom/dropbox/core/v2/team/UserDeleteEmailsResult;

    return-object v0

    .line 198
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.SUCCESS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserDeleteResult;->_tag:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 266
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserDeleteResult;->_tag:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/UserDeleteResult;->successValue:Lcom/dropbox/core/v2/team/UserDeleteEmailsResult;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserDeleteResult;->invalidUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

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

.method public isInvalidUser()Z
    .locals 2

    .line 211
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserDeleteResult;->_tag:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;->INVALID_USER:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 261
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserDeleteResult;->_tag:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;->OTHER:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSuccess()Z
    .locals 2

    .line 161
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserDeleteResult;->_tag:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;
    .locals 1

    .line 150
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserDeleteResult;->_tag:Lcom/dropbox/core/v2/team/UserDeleteResult$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 305
    sget-object v0, Lcom/dropbox/core/v2/team/UserDeleteResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserDeleteResult$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/UserDeleteResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 317
    sget-object v0, Lcom/dropbox/core/v2/team/UserDeleteResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserDeleteResult$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/UserDeleteResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
