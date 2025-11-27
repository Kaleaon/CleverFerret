.class public final Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;
.super Ljava/lang/Object;
.source "UploadApiRateLimitValue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Serializer;,
        Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

.field public static final UNLIMITED:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

.field private limitValue:Ljava/lang/Long;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 63
    new-instance v0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;->UNLIMITED:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->withTag(Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;)Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->UNLIMITED:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    .line 71
    new-instance v0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;->OTHER:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->withTag(Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;)Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->OTHER:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;)Ljava/lang/Long;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->limitValue:Ljava/lang/Long;

    return-object p0
.end method

.method public static limit(J)Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;
    .locals 2

    .line 159
    new-instance v0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;->LIMIT:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->withTagAndLimit(Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;Ljava/lang/Long;)Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    move-result-object p0

    return-object p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;)Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;
    .locals 1

    .line 89
    new-instance v0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;-><init>()V

    .line 90
    iput-object p1, v0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->_tag:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

    return-object v0
.end method

.method private withTagAndLimit(Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;Ljava/lang/Long;)Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;
    .locals 1

    .line 101
    new-instance v0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;-><init>()V

    .line 102
    iput-object p1, v0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->_tag:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

    .line 103
    iput-object p2, v0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->limitValue:Ljava/lang/Long;

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

    .line 207
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    if-eqz v2, :cond_7

    .line 208
    check-cast p1, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    .line 209
    iget-object v2, p0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->_tag:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->_tag:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 212
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$1;->$SwitchMap$com$dropbox$core$v2$team$UploadApiRateLimitValue$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->_tag:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;->ordinal()I

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

    .line 216
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->limitValue:Ljava/lang/Long;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->limitValue:Ljava/lang/Long;

    if-ne v2, p1, :cond_5

    return v0

    :cond_5
    return v1

    :cond_6
    return v0

    :cond_7
    return v1
.end method

.method public getLimitValue()J
    .locals 3

    .line 173
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->_tag:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;->LIMIT:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

    if-ne v0, v1, :cond_0

    .line 176
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->limitValue:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0

    .line 174
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.LIMIT, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->_tag:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 192
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->_tag:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->limitValue:Ljava/lang/Long;

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

.method public isLimit()Z
    .locals 2

    .line 144
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->_tag:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;->LIMIT:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 187
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->_tag:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;->OTHER:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUnlimited()Z
    .locals 2

    .line 133
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->_tag:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;->UNLIMITED:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->_tag:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 230
    sget-object v0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 242
    sget-object v0, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
