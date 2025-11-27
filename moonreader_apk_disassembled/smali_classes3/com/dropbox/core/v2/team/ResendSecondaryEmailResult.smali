.class public final Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;
.super Ljava/lang/Object;
.source "ResendSecondaryEmailResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;,
        Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

.field private notPendingValue:Ljava/lang/String;

.field private rateLimitedValue:Ljava/lang/String;

.field private successValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 74
    new-instance v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;->OTHER:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->withTag(Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;)Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->OTHER:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;)Ljava/lang/String;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->successValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;)Ljava/lang/String;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->notPendingValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;)Ljava/lang/String;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->rateLimitedValue:Ljava/lang/String;

    return-object p0
.end method

.method public static notPending(Ljava/lang/String;)Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 278
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 281
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 284
    new-instance v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;->NOT_PENDING:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->withTagAndNotPending(Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    move-result-object p0

    return-object p0

    .line 282
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 279
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 276
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static rateLimited(Ljava/lang/String;)Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 336
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 339
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 342
    new-instance v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;->RATE_LIMITED:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->withTagAndRateLimited(Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    move-result-object p0

    return-object p0

    .line 340
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 337
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 334
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static success(Ljava/lang/String;)Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 220
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 223
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 226
    new-instance v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->withTagAndSuccess(Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    move-result-object p0

    return-object p0

    .line 224
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 221
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 218
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;)Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;
    .locals 1

    .line 97
    new-instance v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;-><init>()V

    .line 98
    iput-object p1, v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    return-object v0
.end method

.method private withTagAndNotPending(Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;
    .locals 1

    .line 141
    new-instance v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;-><init>()V

    .line 142
    iput-object p1, v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    .line 143
    iput-object p2, v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->notPendingValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndRateLimited(Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;
    .locals 1

    .line 164
    new-instance v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;-><init>()V

    .line 165
    iput-object p1, v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    .line 166
    iput-object p2, v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->rateLimitedValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndSuccess(Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;
    .locals 1

    .line 119
    new-instance v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;-><init>()V

    .line 120
    iput-object p1, v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    .line 121
    iput-object p2, v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->successValue:Ljava/lang/String;

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

    .line 394
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    if-eqz v2, :cond_d

    .line 395
    check-cast p1, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;

    .line 396
    iget-object v2, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 399
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$1;->$SwitchMap$com$dropbox$core$v2$team$ResendSecondaryEmailResult$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_a

    const/4 v3, 0x2

    if-eq v2, v3, :cond_7

    const/4 v3, 0x3

    if-eq v2, v3, :cond_4

    const/4 p1, 0x4

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 405
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->rateLimitedValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->rateLimitedValue:Ljava/lang/String;

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

    .line 403
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->notPendingValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->notPendingValue:Ljava/lang/String;

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

    .line 401
    :cond_a
    iget-object v2, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->successValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->successValue:Ljava/lang/String;

    if-eq v2, p1, :cond_c

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    goto :goto_2

    :cond_b
    return v1

    :cond_c
    :goto_2
    return v0

    :cond_d
    return v1
.end method

.method public getNotPendingValue()Ljava/lang/String;
    .locals 3

    .line 298
    iget-object v0, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;->NOT_PENDING:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    .line 301
    iget-object v0, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->notPendingValue:Ljava/lang/String;

    return-object v0

    .line 299
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.NOT_PENDING, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getRateLimitedValue()Ljava/lang/String;
    .locals 3

    .line 358
    iget-object v0, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;->RATE_LIMITED:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    .line 361
    iget-object v0, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->rateLimitedValue:Ljava/lang/String;

    return-object v0

    .line 359
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.RATE_LIMITED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSuccessValue()Ljava/lang/String;
    .locals 3

    .line 241
    iget-object v0, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    .line 244
    iget-object v0, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->successValue:Ljava/lang/String;

    return-object v0

    .line 242
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.SUCCESS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 6

    .line 377
    iget-object v0, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->successValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->notPendingValue:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->rateLimitedValue:Ljava/lang/String;

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    aput-object v2, v4, v0

    const/4 v0, 0x3

    aput-object v3, v4, v0

    invoke-static {v4}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isNotPending()Z
    .locals 2

    .line 255
    iget-object v0, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;->NOT_PENDING:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 372
    iget-object v0, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;->OTHER:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRateLimited()Z
    .locals 2

    .line 312
    iget-object v0, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;->RATE_LIMITED:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSuccess()Z
    .locals 2

    .line 196
    iget-object v0, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;
    .locals 1

    .line 185
    iget-object v0, p0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 419
    sget-object v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 431
    sget-object v0, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/ResendSecondaryEmailResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
