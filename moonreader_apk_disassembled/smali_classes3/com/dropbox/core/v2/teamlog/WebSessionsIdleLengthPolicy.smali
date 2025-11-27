.class public final Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;
.super Ljava/lang/Object;
.source "WebSessionsIdleLengthPolicy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Serializer;,
        Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;

.field public static final UNDEFINED:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

.field private definedValue:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 60
    new-instance v0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;->UNDEFINED:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->withTag(Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;)Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->UNDEFINED:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;

    .line 68
    new-instance v0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->withTag(Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;)Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->OTHER:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;)Lcom/dropbox/core/v2/teamlog/DurationLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->definedValue:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;

    return-object p0
.end method

.method public static defined(Lcom/dropbox/core/v2/teamlog/DurationLogInfo;)Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;
    .locals 2

    if-eqz p0, :cond_0

    .line 154
    new-instance v0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;->DEFINED:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->withTagAndDefined(Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;Lcom/dropbox/core/v2/teamlog/DurationLogInfo;)Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;

    move-result-object p0

    return-object p0

    .line 152
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;)Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;
    .locals 1

    .line 86
    new-instance v0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;-><init>()V

    .line 87
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->_tag:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

    return-object v0
.end method

.method private withTagAndDefined(Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;Lcom/dropbox/core/v2/teamlog/DurationLogInfo;)Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;
    .locals 1

    .line 102
    new-instance v0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;-><init>()V

    .line 103
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->_tag:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

    .line 104
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->definedValue:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;

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

    .line 213
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;

    if-eqz v2, :cond_7

    .line 214
    check-cast p1, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;

    .line 215
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->_tag:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->_tag:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 218
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$1;->$SwitchMap$com$dropbox$core$v2$teamlog$WebSessionsIdleLengthPolicy$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->_tag:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_4

    const/4 p1, 0x2

    if-eq v2, p1, :cond_3

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 220
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->definedValue:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->definedValue:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/DurationLogInfo;->equals(Ljava/lang/Object;)Z

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

.method public getDefinedValue()Lcom/dropbox/core/v2/teamlog/DurationLogInfo;
    .locals 3

    .line 168
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->_tag:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;->DEFINED:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

    if-ne v0, v1, :cond_0

    .line 171
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->definedValue:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;

    return-object v0

    .line 169
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.DEFINED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->_tag:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 198
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->_tag:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->definedValue:Lcom/dropbox/core/v2/teamlog/DurationLogInfo;

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

.method public isDefined()Z
    .locals 2

    .line 134
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->_tag:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;->DEFINED:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 193
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->_tag:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUndefined()Z
    .locals 2

    .line 182
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->_tag:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;->UNDEFINED:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy;->_tag:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 236
    sget-object v0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 248
    sget-object v0, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/WebSessionsIdleLengthPolicy$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
