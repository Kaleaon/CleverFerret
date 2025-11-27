.class public final Lcom/dropbox/core/v2/auth/AccessError;
.super Ljava/lang/Object;
.source "AccessError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/auth/AccessError$Serializer;,
        Lcom/dropbox/core/v2/auth/AccessError$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/auth/AccessError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/auth/AccessError$Tag;

.field private invalidAccountTypeValue:Lcom/dropbox/core/v2/auth/InvalidAccountTypeError;

.field private paperAccessDeniedValue:Lcom/dropbox/core/v2/auth/PaperAccessError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 65
    new-instance v0, Lcom/dropbox/core/v2/auth/AccessError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/auth/AccessError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/auth/AccessError$Tag;->OTHER:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/auth/AccessError;->withTag(Lcom/dropbox/core/v2/auth/AccessError$Tag;)Lcom/dropbox/core/v2/auth/AccessError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/auth/AccessError;->OTHER:Lcom/dropbox/core/v2/auth/AccessError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/auth/AccessError;)Lcom/dropbox/core/v2/auth/InvalidAccountTypeError;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/dropbox/core/v2/auth/AccessError;->invalidAccountTypeValue:Lcom/dropbox/core/v2/auth/InvalidAccountTypeError;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/auth/AccessError;)Lcom/dropbox/core/v2/auth/PaperAccessError;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/dropbox/core/v2/auth/AccessError;->paperAccessDeniedValue:Lcom/dropbox/core/v2/auth/PaperAccessError;

    return-object p0
.end method

.method public static invalidAccountType(Lcom/dropbox/core/v2/auth/InvalidAccountTypeError;)Lcom/dropbox/core/v2/auth/AccessError;
    .locals 2

    if-eqz p0, :cond_0

    .line 172
    new-instance v0, Lcom/dropbox/core/v2/auth/AccessError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/auth/AccessError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/auth/AccessError$Tag;->INVALID_ACCOUNT_TYPE:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/auth/AccessError;->withTagAndInvalidAccountType(Lcom/dropbox/core/v2/auth/AccessError$Tag;Lcom/dropbox/core/v2/auth/InvalidAccountTypeError;)Lcom/dropbox/core/v2/auth/AccessError;

    move-result-object p0

    return-object p0

    .line 170
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static paperAccessDenied(Lcom/dropbox/core/v2/auth/PaperAccessError;)Lcom/dropbox/core/v2/auth/AccessError;
    .locals 2

    if-eqz p0, :cond_0

    .line 222
    new-instance v0, Lcom/dropbox/core/v2/auth/AccessError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/auth/AccessError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/auth/AccessError$Tag;->PAPER_ACCESS_DENIED:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/auth/AccessError;->withTagAndPaperAccessDenied(Lcom/dropbox/core/v2/auth/AccessError$Tag;Lcom/dropbox/core/v2/auth/PaperAccessError;)Lcom/dropbox/core/v2/auth/AccessError;

    move-result-object p0

    return-object p0

    .line 220
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/auth/AccessError$Tag;)Lcom/dropbox/core/v2/auth/AccessError;
    .locals 1

    .line 85
    new-instance v0, Lcom/dropbox/core/v2/auth/AccessError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/auth/AccessError;-><init>()V

    .line 86
    iput-object p1, v0, Lcom/dropbox/core/v2/auth/AccessError;->_tag:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    return-object v0
.end method

.method private withTagAndInvalidAccountType(Lcom/dropbox/core/v2/auth/AccessError$Tag;Lcom/dropbox/core/v2/auth/InvalidAccountTypeError;)Lcom/dropbox/core/v2/auth/AccessError;
    .locals 1

    .line 102
    new-instance v0, Lcom/dropbox/core/v2/auth/AccessError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/auth/AccessError;-><init>()V

    .line 103
    iput-object p1, v0, Lcom/dropbox/core/v2/auth/AccessError;->_tag:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    .line 104
    iput-object p2, v0, Lcom/dropbox/core/v2/auth/AccessError;->invalidAccountTypeValue:Lcom/dropbox/core/v2/auth/InvalidAccountTypeError;

    return-object v0
.end method

.method private withTagAndPaperAccessDenied(Lcom/dropbox/core/v2/auth/AccessError$Tag;Lcom/dropbox/core/v2/auth/PaperAccessError;)Lcom/dropbox/core/v2/auth/AccessError;
    .locals 1

    .line 120
    new-instance v0, Lcom/dropbox/core/v2/auth/AccessError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/auth/AccessError;-><init>()V

    .line 121
    iput-object p1, v0, Lcom/dropbox/core/v2/auth/AccessError;->_tag:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    .line 122
    iput-object p2, v0, Lcom/dropbox/core/v2/auth/AccessError;->paperAccessDeniedValue:Lcom/dropbox/core/v2/auth/PaperAccessError;

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

    .line 272
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/auth/AccessError;

    if-eqz v2, :cond_a

    .line 273
    check-cast p1, Lcom/dropbox/core/v2/auth/AccessError;

    .line 274
    iget-object v2, p0, Lcom/dropbox/core/v2/auth/AccessError;->_tag:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/auth/AccessError;->_tag:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 277
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/auth/AccessError$1;->$SwitchMap$com$dropbox$core$v2$auth$AccessError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/auth/AccessError;->_tag:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/auth/AccessError$Tag;->ordinal()I

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

    .line 281
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/auth/AccessError;->paperAccessDeniedValue:Lcom/dropbox/core/v2/auth/PaperAccessError;

    iget-object p1, p1, Lcom/dropbox/core/v2/auth/AccessError;->paperAccessDeniedValue:Lcom/dropbox/core/v2/auth/PaperAccessError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/auth/PaperAccessError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 279
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/auth/AccessError;->invalidAccountTypeValue:Lcom/dropbox/core/v2/auth/InvalidAccountTypeError;

    iget-object p1, p1, Lcom/dropbox/core/v2/auth/AccessError;->invalidAccountTypeValue:Lcom/dropbox/core/v2/auth/InvalidAccountTypeError;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/auth/InvalidAccountTypeError;->equals(Ljava/lang/Object;)Z

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

.method public getInvalidAccountTypeValue()Lcom/dropbox/core/v2/auth/InvalidAccountTypeError;
    .locals 3

    .line 188
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AccessError;->_tag:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/auth/AccessError$Tag;->INVALID_ACCOUNT_TYPE:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    if-ne v0, v1, :cond_0

    .line 191
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AccessError;->invalidAccountTypeValue:Lcom/dropbox/core/v2/auth/InvalidAccountTypeError;

    return-object v0

    .line 189
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.INVALID_ACCOUNT_TYPE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/auth/AccessError;->_tag:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/auth/AccessError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPaperAccessDeniedValue()Lcom/dropbox/core/v2/auth/PaperAccessError;
    .locals 3

    .line 237
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AccessError;->_tag:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/auth/AccessError$Tag;->PAPER_ACCESS_DENIED:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    if-ne v0, v1, :cond_0

    .line 240
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AccessError;->paperAccessDeniedValue:Lcom/dropbox/core/v2/auth/PaperAccessError;

    return-object v0

    .line 238
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PAPER_ACCESS_DENIED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/auth/AccessError;->_tag:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/auth/AccessError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 256
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AccessError;->_tag:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/auth/AccessError;->invalidAccountTypeValue:Lcom/dropbox/core/v2/auth/InvalidAccountTypeError;

    iget-object v2, p0, Lcom/dropbox/core/v2/auth/AccessError;->paperAccessDeniedValue:Lcom/dropbox/core/v2/auth/PaperAccessError;

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

.method public isInvalidAccountType()Z
    .locals 2

    .line 152
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AccessError;->_tag:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/auth/AccessError$Tag;->INVALID_ACCOUNT_TYPE:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 251
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AccessError;->_tag:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/auth/AccessError$Tag;->OTHER:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPaperAccessDenied()Z
    .locals 2

    .line 202
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AccessError;->_tag:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/auth/AccessError$Tag;->PAPER_ACCESS_DENIED:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/auth/AccessError$Tag;
    .locals 1

    .line 141
    iget-object v0, p0, Lcom/dropbox/core/v2/auth/AccessError;->_tag:Lcom/dropbox/core/v2/auth/AccessError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 295
    sget-object v0, Lcom/dropbox/core/v2/auth/AccessError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/auth/AccessError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/auth/AccessError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 307
    sget-object v0, Lcom/dropbox/core/v2/auth/AccessError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/auth/AccessError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/auth/AccessError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
