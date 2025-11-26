.class public final Lcom/dropbox/core/v2/sharing/InviteeInfo;
.super Ljava/lang/Object;
.source "InviteeInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/InviteeInfo$Serializer;,
        Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/sharing/InviteeInfo;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;

.field private emailValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 61
    new-instance v0, Lcom/dropbox/core/v2/sharing/InviteeInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/InviteeInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/InviteeInfo;->withTag(Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;)Lcom/dropbox/core/v2/sharing/InviteeInfo;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/InviteeInfo;->OTHER:Lcom/dropbox/core/v2/sharing/InviteeInfo;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/InviteeInfo;)Ljava/lang/String;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/InviteeInfo;->emailValue:Ljava/lang/String;

    return-object p0
.end method

.method public static email(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/InviteeInfo;
    .locals 2

    if-eqz p0, :cond_2

    .line 152
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 155
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 158
    new-instance v0, Lcom/dropbox/core/v2/sharing/InviteeInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/InviteeInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;->EMAIL:Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/InviteeInfo;->withTagAndEmail(Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/InviteeInfo;

    move-result-object p0

    return-object p0

    .line 156
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 153
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 150
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;)Lcom/dropbox/core/v2/sharing/InviteeInfo;
    .locals 1

    .line 79
    new-instance v0, Lcom/dropbox/core/v2/sharing/InviteeInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/InviteeInfo;-><init>()V

    .line 80
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/InviteeInfo;->_tag:Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;

    return-object v0
.end method

.method private withTagAndEmail(Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/InviteeInfo;
    .locals 1

    .line 97
    new-instance v0, Lcom/dropbox/core/v2/sharing/InviteeInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/InviteeInfo;-><init>()V

    .line 98
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/InviteeInfo;->_tag:Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;

    .line 99
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/InviteeInfo;->emailValue:Ljava/lang/String;

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

    .line 206
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/InviteeInfo;

    if-eqz v2, :cond_7

    .line 207
    check-cast p1, Lcom/dropbox/core/v2/sharing/InviteeInfo;

    .line 208
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/InviteeInfo;->_tag:Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/InviteeInfo;->_tag:Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 211
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/InviteeInfo$1;->$SwitchMap$com$dropbox$core$v2$sharing$InviteeInfo$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/InviteeInfo;->_tag:Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_4

    const/4 p1, 0x2

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 213
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/InviteeInfo;->emailValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/InviteeInfo;->emailValue:Ljava/lang/String;

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

.method public getEmailValue()Ljava/lang/String;
    .locals 3

    .line 172
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/InviteeInfo;->_tag:Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;->EMAIL:Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 175
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/InviteeInfo;->emailValue:Ljava/lang/String;

    return-object v0

    .line 173
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.EMAIL, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/InviteeInfo;->_tag:Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 191
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/InviteeInfo;->_tag:Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/InviteeInfo;->emailValue:Ljava/lang/String;

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

.method public isEmail()Z
    .locals 2

    .line 129
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/InviteeInfo;->_tag:Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;->EMAIL:Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 186
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/InviteeInfo;->_tag:Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;
    .locals 1

    .line 118
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/InviteeInfo;->_tag:Lcom/dropbox/core/v2/sharing/InviteeInfo$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 227
    sget-object v0, Lcom/dropbox/core/v2/sharing/InviteeInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/InviteeInfo$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/InviteeInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 239
    sget-object v0, Lcom/dropbox/core/v2/sharing/InviteeInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/InviteeInfo$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/InviteeInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
