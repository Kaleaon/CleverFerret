.class public final Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;
.super Ljava/lang/Object;
.source "DeleteSecondaryEmailResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;,
        Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

.field private cannotRemovePrimaryValue:Ljava/lang/String;

.field private notFoundValue:Ljava/lang/String;

.field private successValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 73
    new-instance v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;->OTHER:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->withTag(Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;)Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->OTHER:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;)Ljava/lang/String;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->successValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;)Ljava/lang/String;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->notFoundValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;)Ljava/lang/String;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->cannotRemovePrimaryValue:Ljava/lang/String;

    return-object p0
.end method

.method public static cannotRemovePrimary(Ljava/lang/String;)Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 332
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 335
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 338
    new-instance v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;->CANNOT_REMOVE_PRIMARY:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->withTagAndCannotRemovePrimary(Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    move-result-object p0

    return-object p0

    .line 336
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 333
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 330
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static notFound(Ljava/lang/String;)Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 274
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 277
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 280
    new-instance v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;->NOT_FOUND:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->withTagAndNotFound(Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    move-result-object p0

    return-object p0

    .line 278
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 275
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 272
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static success(Ljava/lang/String;)Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 217
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 220
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 223
    new-instance v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->withTagAndSuccess(Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    move-result-object p0

    return-object p0

    .line 221
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 218
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 215
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;)Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;
    .locals 1

    .line 96
    new-instance v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;-><init>()V

    .line 97
    iput-object p1, v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    return-object v0
.end method

.method private withTagAndCannotRemovePrimary(Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;
    .locals 1

    .line 162
    new-instance v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;-><init>()V

    .line 163
    iput-object p1, v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    .line 164
    iput-object p2, v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->cannotRemovePrimaryValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndNotFound(Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;
    .locals 1

    .line 139
    new-instance v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;-><init>()V

    .line 140
    iput-object p1, v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    .line 141
    iput-object p2, v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->notFoundValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndSuccess(Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;
    .locals 1

    .line 117
    new-instance v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;-><init>()V

    .line 118
    iput-object p1, v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    .line 119
    iput-object p2, v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->successValue:Ljava/lang/String;

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

    .line 391
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    if-eqz v2, :cond_d

    .line 392
    check-cast p1, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;

    .line 393
    iget-object v2, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 396
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$1;->$SwitchMap$com$dropbox$core$v2$team$DeleteSecondaryEmailResult$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;->ordinal()I

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

    .line 402
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->cannotRemovePrimaryValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->cannotRemovePrimaryValue:Ljava/lang/String;

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

    .line 400
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->notFoundValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->notFoundValue:Ljava/lang/String;

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

    .line 398
    :cond_a
    iget-object v2, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->successValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->successValue:Ljava/lang/String;

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

.method public getCannotRemovePrimaryValue()Ljava/lang/String;
    .locals 3

    .line 355
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;->CANNOT_REMOVE_PRIMARY:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    .line 358
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->cannotRemovePrimaryValue:Ljava/lang/String;

    return-object v0

    .line 356
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.CANNOT_REMOVE_PRIMARY, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getNotFoundValue()Ljava/lang/String;
    .locals 3

    .line 294
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;->NOT_FOUND:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    .line 297
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->notFoundValue:Ljava/lang/String;

    return-object v0

    .line 295
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.NOT_FOUND, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSuccessValue()Ljava/lang/String;
    .locals 3

    .line 237
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    .line 240
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->successValue:Ljava/lang/String;

    return-object v0

    .line 238
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.SUCCESS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 6

    .line 374
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->successValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->notFoundValue:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->cannotRemovePrimaryValue:Ljava/lang/String;

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

.method public isCannotRemovePrimary()Z
    .locals 2

    .line 308
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;->CANNOT_REMOVE_PRIMARY:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNotFound()Z
    .locals 2

    .line 251
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;->NOT_FOUND:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 369
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;->OTHER:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSuccess()Z
    .locals 2

    .line 194
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;
    .locals 1

    .line 183
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult;->_tag:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 416
    sget-object v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 428
    sget-object v0, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/DeleteSecondaryEmailResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
