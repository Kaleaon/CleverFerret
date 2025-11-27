.class public final Lcom/dropbox/core/v2/sharing/MemberSelector;
.super Ljava/lang/Object;
.source "MemberSelector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/MemberSelector$Serializer;,
        Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/sharing/MemberSelector;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

.field private dropboxIdValue:Ljava/lang/String;

.field private emailValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 65
    new-instance v0, Lcom/dropbox/core/v2/sharing/MemberSelector;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/MemberSelector;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/MemberSelector;->withTag(Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;)Lcom/dropbox/core/v2/sharing/MemberSelector;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/MemberSelector;->OTHER:Lcom/dropbox/core/v2/sharing/MemberSelector;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/MemberSelector;)Ljava/lang/String;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/MemberSelector;->dropboxIdValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/sharing/MemberSelector;)Ljava/lang/String;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/MemberSelector;->emailValue:Ljava/lang/String;

    return-object p0
.end method

.method public static dropboxId(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/MemberSelector;
    .locals 2

    if-eqz p0, :cond_1

    .line 172
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 175
    new-instance v0, Lcom/dropbox/core/v2/sharing/MemberSelector;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/MemberSelector;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;->DROPBOX_ID:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/MemberSelector;->withTagAndDropboxId(Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/MemberSelector;

    move-result-object p0

    return-object p0

    .line 173
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is shorter than 1"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 170
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static email(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/MemberSelector;
    .locals 2

    if-eqz p0, :cond_2

    .line 226
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 229
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 232
    new-instance v0, Lcom/dropbox/core/v2/sharing/MemberSelector;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/MemberSelector;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;->EMAIL:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/MemberSelector;->withTagAndEmail(Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/MemberSelector;

    move-result-object p0

    return-object p0

    .line 230
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 227
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 224
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;)Lcom/dropbox/core/v2/sharing/MemberSelector;
    .locals 1

    .line 84
    new-instance v0, Lcom/dropbox/core/v2/sharing/MemberSelector;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/MemberSelector;-><init>()V

    .line 85
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/MemberSelector;->_tag:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    return-object v0
.end method

.method private withTagAndDropboxId(Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/MemberSelector;
    .locals 1

    .line 100
    new-instance v0, Lcom/dropbox/core/v2/sharing/MemberSelector;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/MemberSelector;-><init>()V

    .line 101
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/MemberSelector;->_tag:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    .line 102
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/MemberSelector;->dropboxIdValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndEmail(Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/MemberSelector;
    .locals 1

    .line 119
    new-instance v0, Lcom/dropbox/core/v2/sharing/MemberSelector;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/MemberSelector;-><init>()V

    .line 120
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/MemberSelector;->_tag:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    .line 121
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/MemberSelector;->emailValue:Ljava/lang/String;

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

    .line 281
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/MemberSelector;

    if-eqz v2, :cond_a

    .line 282
    check-cast p1, Lcom/dropbox/core/v2/sharing/MemberSelector;

    .line 283
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/MemberSelector;->_tag:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/MemberSelector;->_tag:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 286
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/MemberSelector$1;->$SwitchMap$com$dropbox$core$v2$sharing$MemberSelector$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/MemberSelector;->_tag:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;->ordinal()I

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

    .line 290
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/MemberSelector;->emailValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/MemberSelector;->emailValue:Ljava/lang/String;

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

    .line 288
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/MemberSelector;->dropboxIdValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/MemberSelector;->dropboxIdValue:Ljava/lang/String;

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

    :cond_a
    return v1
.end method

.method public getDropboxIdValue()Ljava/lang/String;
    .locals 3

    .line 189
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/MemberSelector;->_tag:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;->DROPBOX_ID:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    if-ne v0, v1, :cond_0

    .line 192
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/MemberSelector;->dropboxIdValue:Ljava/lang/String;

    return-object v0

    .line 190
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.DROPBOX_ID, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/MemberSelector;->_tag:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getEmailValue()Ljava/lang/String;
    .locals 3

    .line 246
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/MemberSelector;->_tag:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;->EMAIL:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    if-ne v0, v1, :cond_0

    .line 249
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/MemberSelector;->emailValue:Ljava/lang/String;

    return-object v0

    .line 247
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.EMAIL, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/MemberSelector;->_tag:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 265
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/MemberSelector;->_tag:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/MemberSelector;->dropboxIdValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/MemberSelector;->emailValue:Ljava/lang/String;

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

.method public isDropboxId()Z
    .locals 2

    .line 151
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/MemberSelector;->_tag:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;->DROPBOX_ID:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isEmail()Z
    .locals 2

    .line 203
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/MemberSelector;->_tag:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;->EMAIL:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 260
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/MemberSelector;->_tag:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;
    .locals 1

    .line 140
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/MemberSelector;->_tag:Lcom/dropbox/core/v2/sharing/MemberSelector$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 304
    sget-object v0, Lcom/dropbox/core/v2/sharing/MemberSelector$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/MemberSelector$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/MemberSelector$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 316
    sget-object v0, Lcom/dropbox/core/v2/sharing/MemberSelector$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/MemberSelector$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/MemberSelector$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
