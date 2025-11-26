.class public final Lcom/dropbox/core/v2/sharing/LinkPassword;
.super Ljava/lang/Object;
.source "LinkPassword.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/LinkPassword$Serializer;,
        Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/sharing/LinkPassword;

.field public static final REMOVE_PASSWORD:Lcom/dropbox/core/v2/sharing/LinkPassword;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

.field private setPasswordValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 58
    new-instance v0, Lcom/dropbox/core/v2/sharing/LinkPassword;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/LinkPassword;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;->REMOVE_PASSWORD:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/LinkPassword;->withTag(Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;)Lcom/dropbox/core/v2/sharing/LinkPassword;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/LinkPassword;->REMOVE_PASSWORD:Lcom/dropbox/core/v2/sharing/LinkPassword;

    .line 66
    new-instance v0, Lcom/dropbox/core/v2/sharing/LinkPassword;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/LinkPassword;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/LinkPassword;->withTag(Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;)Lcom/dropbox/core/v2/sharing/LinkPassword;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/LinkPassword;->OTHER:Lcom/dropbox/core/v2/sharing/LinkPassword;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/LinkPassword;)Ljava/lang/String;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/LinkPassword;->setPasswordValue:Ljava/lang/String;

    return-object p0
.end method

.method public static setPassword(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/LinkPassword;
    .locals 2

    if-eqz p0, :cond_0

    .line 161
    new-instance v0, Lcom/dropbox/core/v2/sharing/LinkPassword;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/LinkPassword;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;->SET_PASSWORD:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/LinkPassword;->withTagAndSetPassword(Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/LinkPassword;

    move-result-object p0

    return-object p0

    .line 159
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;)Lcom/dropbox/core/v2/sharing/LinkPassword;
    .locals 1

    .line 83
    new-instance v0, Lcom/dropbox/core/v2/sharing/LinkPassword;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/LinkPassword;-><init>()V

    .line 84
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/LinkPassword;->_tag:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

    return-object v0
.end method

.method private withTagAndSetPassword(Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/LinkPassword;
    .locals 1

    .line 98
    new-instance v0, Lcom/dropbox/core/v2/sharing/LinkPassword;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/LinkPassword;-><init>()V

    .line 99
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/LinkPassword;->_tag:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

    .line 100
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/LinkPassword;->setPasswordValue:Ljava/lang/String;

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

    .line 210
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/LinkPassword;

    if-eqz v2, :cond_7

    .line 211
    check-cast p1, Lcom/dropbox/core/v2/sharing/LinkPassword;

    .line 212
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkPassword;->_tag:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/LinkPassword;->_tag:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 215
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/LinkPassword$1;->$SwitchMap$com$dropbox$core$v2$sharing$LinkPassword$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/LinkPassword;->_tag:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;->ordinal()I

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

    .line 219
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkPassword;->setPasswordValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/LinkPassword;->setPasswordValue:Ljava/lang/String;

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

.method public getSetPasswordValue()Ljava/lang/String;
    .locals 3

    .line 176
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkPassword;->_tag:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;->SET_PASSWORD:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

    if-ne v0, v1, :cond_0

    .line 179
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkPassword;->setPasswordValue:Ljava/lang/String;

    return-object v0

    .line 177
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.SET_PASSWORD, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/LinkPassword;->_tag:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 195
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkPassword;->_tag:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/LinkPassword;->setPasswordValue:Ljava/lang/String;

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

    .line 190
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkPassword;->_tag:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRemovePassword()Z
    .locals 2

    .line 130
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkPassword;->_tag:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;->REMOVE_PASSWORD:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSetPassword()Z
    .locals 2

    .line 141
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkPassword;->_tag:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;->SET_PASSWORD:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/LinkPassword;->_tag:Lcom/dropbox/core/v2/sharing/LinkPassword$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 233
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkPassword$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/LinkPassword$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/LinkPassword$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 245
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkPassword$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/LinkPassword$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/LinkPassword$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
