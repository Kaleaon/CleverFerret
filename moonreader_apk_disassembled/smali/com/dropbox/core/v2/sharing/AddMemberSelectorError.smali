.class public final Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;
.super Ljava/lang/Object;
.source "AddMemberSelectorError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Serializer;,
        Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;
    }
.end annotation


# static fields
.field public static final AUTOMATIC_GROUP:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

.field public static final GROUP_DELETED:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

.field public static final GROUP_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

.field public static final OTHER:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

.field private invalidDropboxIdValue:Ljava/lang/String;

.field private invalidEmailValue:Ljava/lang/String;

.field private unverifiedDropboxIdValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 78
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->AUTOMATIC_GROUP:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->withTag(Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;)Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->AUTOMATIC_GROUP:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    .line 83
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->GROUP_DELETED:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->withTag(Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;)Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->GROUP_DELETED:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    .line 87
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->GROUP_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->withTag(Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;)Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->GROUP_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    .line 95
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->withTag(Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;)Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->OTHER:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;)Ljava/lang/String;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->invalidDropboxIdValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;)Ljava/lang/String;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->invalidEmailValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;)Ljava/lang/String;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->unverifiedDropboxIdValue:Ljava/lang/String;

    return-object p0
.end method

.method public static invalidDropboxId(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;
    .locals 2

    if-eqz p0, :cond_1

    .line 229
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 232
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->INVALID_DROPBOX_ID:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->withTagAndInvalidDropboxId(Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    move-result-object p0

    return-object p0

    .line 230
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is shorter than 1"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 227
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static invalidEmail(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;
    .locals 2

    if-eqz p0, :cond_2

    .line 284
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 287
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 290
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->INVALID_EMAIL:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->withTagAndInvalidEmail(Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    move-result-object p0

    return-object p0

    .line 288
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 285
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 282
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static unverifiedDropboxId(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;
    .locals 2

    if-eqz p0, :cond_1

    .line 342
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 345
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->UNVERIFIED_DROPBOX_ID:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->withTagAndUnverifiedDropboxId(Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    move-result-object p0

    return-object p0

    .line 343
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is shorter than 1"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 340
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;)Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;
    .locals 1

    .line 114
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;-><init>()V

    .line 115
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    return-object v0
.end method

.method private withTagAndInvalidDropboxId(Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;
    .locals 1

    .line 129
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;-><init>()V

    .line 130
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    .line 131
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->invalidDropboxIdValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndInvalidEmail(Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;
    .locals 1

    .line 147
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;-><init>()V

    .line 148
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    .line 149
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->invalidEmailValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndUnverifiedDropboxId(Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;
    .locals 1

    .line 165
    new-instance v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;-><init>()V

    .line 166
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    .line 167
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->unverifiedDropboxIdValue:Ljava/lang/String;

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

    .line 420
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    if-eqz v2, :cond_9

    .line 421
    check-cast p1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;

    .line 422
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 425
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$1;->$SwitchMap$com$dropbox$core$v2$sharing$AddMemberSelectorError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 433
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->unverifiedDropboxIdValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->unverifiedDropboxIdValue:Ljava/lang/String;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    .line 431
    :pswitch_2
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->invalidEmailValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->invalidEmailValue:Ljava/lang/String;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_5
    return v1

    :cond_6
    :goto_1
    return v0

    .line 429
    :pswitch_3
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->invalidDropboxIdValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->invalidDropboxIdValue:Ljava/lang/String;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_2

    :cond_7
    return v1

    :cond_8
    :goto_2
    :pswitch_4
    return v0

    :cond_9
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getInvalidDropboxIdValue()Ljava/lang/String;
    .locals 3

    .line 247
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->INVALID_DROPBOX_ID:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    if-ne v0, v1, :cond_0

    .line 250
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->invalidDropboxIdValue:Ljava/lang/String;

    return-object v0

    .line 248
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.INVALID_DROPBOX_ID, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getInvalidEmailValue()Ljava/lang/String;
    .locals 3

    .line 305
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->INVALID_EMAIL:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    if-ne v0, v1, :cond_0

    .line 308
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->invalidEmailValue:Ljava/lang/String;

    return-object v0

    .line 306
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.INVALID_EMAIL, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUnverifiedDropboxIdValue()Ljava/lang/String;
    .locals 3

    .line 362
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->UNVERIFIED_DROPBOX_ID:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    if-ne v0, v1, :cond_0

    .line 365
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->unverifiedDropboxIdValue:Ljava/lang/String;

    return-object v0

    .line 363
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.UNVERIFIED_DROPBOX_ID, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 6

    .line 403
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->invalidDropboxIdValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->invalidEmailValue:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->unverifiedDropboxIdValue:Ljava/lang/String;

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

.method public isAutomaticGroup()Z
    .locals 2

    .line 197
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->AUTOMATIC_GROUP:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isGroupDeleted()Z
    .locals 2

    .line 376
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->GROUP_DELETED:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isGroupNotOnTeam()Z
    .locals 2

    .line 387
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->GROUP_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInvalidDropboxId()Z
    .locals 2

    .line 208
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->INVALID_DROPBOX_ID:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInvalidEmail()Z
    .locals 2

    .line 261
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->INVALID_EMAIL:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 398
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUnverifiedDropboxId()Z
    .locals 2

    .line 319
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;->UNVERIFIED_DROPBOX_ID:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;
    .locals 1

    .line 186
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError;->_tag:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 451
    sget-object v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 463
    sget-object v0, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/AddMemberSelectorError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
