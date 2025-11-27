.class public final Lcom/dropbox/core/v2/sharing/LinkExpiry;
.super Ljava/lang/Object;
.source "LinkExpiry.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/LinkExpiry$Serializer;,
        Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/sharing/LinkExpiry;

.field public static final REMOVE_EXPIRY:Lcom/dropbox/core/v2/sharing/LinkExpiry;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

.field private setExpiryValue:Ljava/util/Date;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 60
    new-instance v0, Lcom/dropbox/core/v2/sharing/LinkExpiry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/LinkExpiry;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;->REMOVE_EXPIRY:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/LinkExpiry;->withTag(Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;)Lcom/dropbox/core/v2/sharing/LinkExpiry;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/LinkExpiry;->REMOVE_EXPIRY:Lcom/dropbox/core/v2/sharing/LinkExpiry;

    .line 68
    new-instance v0, Lcom/dropbox/core/v2/sharing/LinkExpiry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/LinkExpiry;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/LinkExpiry;->withTag(Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;)Lcom/dropbox/core/v2/sharing/LinkExpiry;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/LinkExpiry;->OTHER:Lcom/dropbox/core/v2/sharing/LinkExpiry;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/LinkExpiry;)Ljava/util/Date;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/LinkExpiry;->setExpiryValue:Ljava/util/Date;

    return-object p0
.end method

.method public static setExpiry(Ljava/util/Date;)Lcom/dropbox/core/v2/sharing/LinkExpiry;
    .locals 2

    if-eqz p0, :cond_0

    .line 163
    new-instance v0, Lcom/dropbox/core/v2/sharing/LinkExpiry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/LinkExpiry;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;->SET_EXPIRY:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/LinkExpiry;->withTagAndSetExpiry(Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;Ljava/util/Date;)Lcom/dropbox/core/v2/sharing/LinkExpiry;

    move-result-object p0

    return-object p0

    .line 161
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;)Lcom/dropbox/core/v2/sharing/LinkExpiry;
    .locals 1

    .line 85
    new-instance v0, Lcom/dropbox/core/v2/sharing/LinkExpiry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/LinkExpiry;-><init>()V

    .line 86
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/LinkExpiry;->_tag:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

    return-object v0
.end method

.method private withTagAndSetExpiry(Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;Ljava/util/Date;)Lcom/dropbox/core/v2/sharing/LinkExpiry;
    .locals 1

    .line 100
    new-instance v0, Lcom/dropbox/core/v2/sharing/LinkExpiry;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/LinkExpiry;-><init>()V

    .line 101
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/LinkExpiry;->_tag:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

    .line 102
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/LinkExpiry;->setExpiryValue:Ljava/util/Date;

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

    .line 211
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/LinkExpiry;

    if-eqz v2, :cond_7

    .line 212
    check-cast p1, Lcom/dropbox/core/v2/sharing/LinkExpiry;

    .line 213
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkExpiry;->_tag:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/LinkExpiry;->_tag:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 216
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/LinkExpiry$1;->$SwitchMap$com$dropbox$core$v2$sharing$LinkExpiry$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/LinkExpiry;->_tag:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;->ordinal()I

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

    .line 220
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkExpiry;->setExpiryValue:Ljava/util/Date;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/LinkExpiry;->setExpiryValue:Ljava/util/Date;

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

.method public getSetExpiryValue()Ljava/util/Date;
    .locals 3

    .line 177
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkExpiry;->_tag:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;->SET_EXPIRY:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

    if-ne v0, v1, :cond_0

    .line 180
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkExpiry;->setExpiryValue:Ljava/util/Date;

    return-object v0

    .line 178
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.SET_EXPIRY, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkExpiry;->_tag:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 196
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkExpiry;->_tag:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/LinkExpiry;->setExpiryValue:Ljava/util/Date;

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

.method public isOther()Z
    .locals 2

    .line 191
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkExpiry;->_tag:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRemoveExpiry()Z
    .locals 2

    .line 132
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkExpiry;->_tag:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;->REMOVE_EXPIRY:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSetExpiry()Z
    .locals 2

    .line 143
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkExpiry;->_tag:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;->SET_EXPIRY:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkExpiry;->_tag:Lcom/dropbox/core/v2/sharing/LinkExpiry$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 234
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkExpiry$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/LinkExpiry$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/LinkExpiry$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 246
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkExpiry$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/LinkExpiry$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/LinkExpiry$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
