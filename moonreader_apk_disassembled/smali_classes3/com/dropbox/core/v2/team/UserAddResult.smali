.class public final Lcom/dropbox/core/v2/team/UserAddResult;
.super Ljava/lang/Object;
.source "UserAddResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/UserAddResult$Serializer;,
        Lcom/dropbox/core/v2/team/UserAddResult$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/team/UserAddResult;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

.field private invalidUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

.field private placeholderUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

.field private successValue:Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult;

.field private unverifiedValue:Lcom/dropbox/core/v2/team/UserSelectorArg;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 76
    new-instance v0, Lcom/dropbox/core/v2/team/UserAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserAddResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->OTHER:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/UserAddResult;->withTag(Lcom/dropbox/core/v2/team/UserAddResult$Tag;)Lcom/dropbox/core/v2/team/UserAddResult;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/UserAddResult;->OTHER:Lcom/dropbox/core/v2/team/UserAddResult;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/UserAddResult;)Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/dropbox/core/v2/team/UserAddResult;->successValue:Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/UserAddResult;)Lcom/dropbox/core/v2/team/UserSelectorArg;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/dropbox/core/v2/team/UserAddResult;->invalidUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/team/UserAddResult;)Lcom/dropbox/core/v2/team/UserSelectorArg;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/dropbox/core/v2/team/UserAddResult;->unverifiedValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    return-object p0
.end method

.method static synthetic access$300(Lcom/dropbox/core/v2/team/UserAddResult;)Lcom/dropbox/core/v2/team/UserSelectorArg;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/dropbox/core/v2/team/UserAddResult;->placeholderUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    return-object p0
.end method

.method public static invalidUser(Lcom/dropbox/core/v2/team/UserSelectorArg;)Lcom/dropbox/core/v2/team/UserAddResult;
    .locals 2

    if-eqz p0, :cond_0

    .line 282
    new-instance v0, Lcom/dropbox/core/v2/team/UserAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserAddResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->INVALID_USER:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/UserAddResult;->withTagAndInvalidUser(Lcom/dropbox/core/v2/team/UserAddResult$Tag;Lcom/dropbox/core/v2/team/UserSelectorArg;)Lcom/dropbox/core/v2/team/UserAddResult;

    move-result-object p0

    return-object p0

    .line 280
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static placeholderUser(Lcom/dropbox/core/v2/team/UserSelectorArg;)Lcom/dropbox/core/v2/team/UserAddResult;
    .locals 2

    if-eqz p0, :cond_0

    .line 379
    new-instance v0, Lcom/dropbox/core/v2/team/UserAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserAddResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->PLACEHOLDER_USER:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/UserAddResult;->withTagAndPlaceholderUser(Lcom/dropbox/core/v2/team/UserAddResult$Tag;Lcom/dropbox/core/v2/team/UserSelectorArg;)Lcom/dropbox/core/v2/team/UserAddResult;

    move-result-object p0

    return-object p0

    .line 377
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static success(Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult;)Lcom/dropbox/core/v2/team/UserAddResult;
    .locals 2

    if-eqz p0, :cond_0

    .line 232
    new-instance v0, Lcom/dropbox/core/v2/team/UserAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserAddResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/UserAddResult;->withTagAndSuccess(Lcom/dropbox/core/v2/team/UserAddResult$Tag;Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult;)Lcom/dropbox/core/v2/team/UserAddResult;

    move-result-object p0

    return-object p0

    .line 230
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static unverified(Lcom/dropbox/core/v2/team/UserSelectorArg;)Lcom/dropbox/core/v2/team/UserAddResult;
    .locals 2

    if-eqz p0, :cond_0

    .line 331
    new-instance v0, Lcom/dropbox/core/v2/team/UserAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserAddResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->UNVERIFIED:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/UserAddResult;->withTagAndUnverified(Lcom/dropbox/core/v2/team/UserAddResult$Tag;Lcom/dropbox/core/v2/team/UserSelectorArg;)Lcom/dropbox/core/v2/team/UserAddResult;

    move-result-object p0

    return-object p0

    .line 329
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/UserAddResult$Tag;)Lcom/dropbox/core/v2/team/UserAddResult;
    .locals 1

    .line 100
    new-instance v0, Lcom/dropbox/core/v2/team/UserAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserAddResult;-><init>()V

    .line 101
    iput-object p1, v0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    return-object v0
.end method

.method private withTagAndInvalidUser(Lcom/dropbox/core/v2/team/UserAddResult$Tag;Lcom/dropbox/core/v2/team/UserSelectorArg;)Lcom/dropbox/core/v2/team/UserAddResult;
    .locals 1

    .line 139
    new-instance v0, Lcom/dropbox/core/v2/team/UserAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserAddResult;-><init>()V

    .line 140
    iput-object p1, v0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    .line 141
    iput-object p2, v0, Lcom/dropbox/core/v2/team/UserAddResult;->invalidUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    return-object v0
.end method

.method private withTagAndPlaceholderUser(Lcom/dropbox/core/v2/team/UserAddResult$Tag;Lcom/dropbox/core/v2/team/UserSelectorArg;)Lcom/dropbox/core/v2/team/UserAddResult;
    .locals 1

    .line 179
    new-instance v0, Lcom/dropbox/core/v2/team/UserAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserAddResult;-><init>()V

    .line 180
    iput-object p1, v0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    .line 181
    iput-object p2, v0, Lcom/dropbox/core/v2/team/UserAddResult;->placeholderUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    return-object v0
.end method

.method private withTagAndSuccess(Lcom/dropbox/core/v2/team/UserAddResult$Tag;Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult;)Lcom/dropbox/core/v2/team/UserAddResult;
    .locals 1

    .line 119
    new-instance v0, Lcom/dropbox/core/v2/team/UserAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserAddResult;-><init>()V

    .line 120
    iput-object p1, v0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    .line 121
    iput-object p2, v0, Lcom/dropbox/core/v2/team/UserAddResult;->successValue:Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult;

    return-object v0
.end method

.method private withTagAndUnverified(Lcom/dropbox/core/v2/team/UserAddResult$Tag;Lcom/dropbox/core/v2/team/UserSelectorArg;)Lcom/dropbox/core/v2/team/UserAddResult;
    .locals 1

    .line 159
    new-instance v0, Lcom/dropbox/core/v2/team/UserAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UserAddResult;-><init>()V

    .line 160
    iput-object p1, v0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    .line 161
    iput-object p2, v0, Lcom/dropbox/core/v2/team/UserAddResult;->unverifiedValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

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

    .line 431
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/UserAddResult;

    if-eqz v2, :cond_10

    .line 432
    check-cast p1, Lcom/dropbox/core/v2/team/UserAddResult;

    .line 433
    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 436
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/UserAddResult$1;->$SwitchMap$com$dropbox$core$v2$team$UserAddResult$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_d

    const/4 v3, 0x2

    if-eq v2, v3, :cond_a

    const/4 v3, 0x3

    if-eq v2, v3, :cond_7

    const/4 v3, 0x4

    if-eq v2, v3, :cond_4

    const/4 p1, 0x5

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 444
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserAddResult;->placeholderUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/UserAddResult;->placeholderUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

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

    .line 442
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserAddResult;->unverifiedValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/UserAddResult;->unverifiedValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/UserSelectorArg;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8

    goto :goto_1

    :cond_8
    return v1

    :cond_9
    :goto_1
    return v0

    .line 440
    :cond_a
    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserAddResult;->invalidUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/UserAddResult;->invalidUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    if-eq v2, p1, :cond_c

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/UserSelectorArg;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    goto :goto_2

    :cond_b
    return v1

    :cond_c
    :goto_2
    return v0

    .line 438
    :cond_d
    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserAddResult;->successValue:Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/UserAddResult;->successValue:Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult;

    if-eq v2, p1, :cond_f

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_e

    goto :goto_3

    :cond_e
    return v1

    :cond_f
    :goto_3
    return v0

    :cond_10
    return v1
.end method

.method public getInvalidUserValue()Lcom/dropbox/core/v2/team/UserSelectorArg;
    .locals 3

    .line 297
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->INVALID_USER:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    if-ne v0, v1, :cond_0

    .line 300
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserAddResult;->invalidUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    return-object v0

    .line 298
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.INVALID_USER, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPlaceholderUserValue()Lcom/dropbox/core/v2/team/UserSelectorArg;
    .locals 3

    .line 394
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->PLACEHOLDER_USER:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    if-ne v0, v1, :cond_0

    .line 397
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserAddResult;->placeholderUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    return-object v0

    .line 395
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PLACEHOLDER_USER, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSuccessValue()Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult;
    .locals 3

    .line 247
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    if-ne v0, v1, :cond_0

    .line 250
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserAddResult;->successValue:Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult;

    return-object v0

    .line 248
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.SUCCESS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUnverifiedValue()Lcom/dropbox/core/v2/team/UserSelectorArg;
    .locals 3

    .line 345
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->UNVERIFIED:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    if-ne v0, v1, :cond_0

    .line 348
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserAddResult;->unverifiedValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    return-object v0

    .line 346
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.UNVERIFIED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 7

    .line 413
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/UserAddResult;->successValue:Lcom/dropbox/core/v2/team/UserSecondaryEmailsResult;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/UserAddResult;->invalidUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/UserAddResult;->unverifiedValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    iget-object v4, p0, Lcom/dropbox/core/v2/team/UserAddResult;->placeholderUserValue:Lcom/dropbox/core/v2/team/UserSelectorArg;

    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const/4 v0, 0x1

    aput-object v1, v5, v0

    const/4 v0, 0x2

    aput-object v2, v5, v0

    const/4 v0, 0x3

    aput-object v3, v5, v0

    const/4 v0, 0x4

    aput-object v4, v5, v0

    invoke-static {v5}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isInvalidUser()Z
    .locals 2

    .line 261
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->INVALID_USER:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 408
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->OTHER:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPlaceholderUser()Z
    .locals 2

    .line 359
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->PLACEHOLDER_USER:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSuccess()Z
    .locals 2

    .line 211
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUnverified()Z
    .locals 2

    .line 311
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UserAddResult$Tag;->UNVERIFIED:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/UserAddResult$Tag;
    .locals 1

    .line 200
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UserAddResult;->_tag:Lcom/dropbox/core/v2/team/UserAddResult$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 458
    sget-object v0, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserAddResult$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 470
    sget-object v0, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UserAddResult$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/UserAddResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
