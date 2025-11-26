.class public final Lcom/dropbox/core/v2/teamlog/ActorLogInfo;
.super Ljava/lang/Object;
.source "ActorLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Serializer;,
        Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;
    }
.end annotation


# static fields
.field public static final ANONYMOUS:Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

.field public static final DROPBOX:Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

.field public static final OTHER:Lcom/dropbox/core/v2/teamlog/ActorLogInfo;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

.field private adminValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

.field private appValue:Lcom/dropbox/core/v2/teamlog/AppLogInfo;

.field private resellerValue:Lcom/dropbox/core/v2/teamlog/ResellerLogInfo;

.field private userValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 76
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->ANONYMOUS:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->withTag(Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;)Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->ANONYMOUS:Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    .line 80
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->DROPBOX:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->withTag(Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;)Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->DROPBOX:Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    .line 88
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->withTag(Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;)Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->OTHER:Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/teamlog/ActorLogInfo;)Lcom/dropbox/core/v2/teamlog/UserLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->adminValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/teamlog/ActorLogInfo;)Lcom/dropbox/core/v2/teamlog/AppLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->appValue:Lcom/dropbox/core/v2/teamlog/AppLogInfo;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/teamlog/ActorLogInfo;)Lcom/dropbox/core/v2/teamlog/ResellerLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->resellerValue:Lcom/dropbox/core/v2/teamlog/ResellerLogInfo;

    return-object p0
.end method

.method static synthetic access$300(Lcom/dropbox/core/v2/teamlog/ActorLogInfo;)Lcom/dropbox/core/v2/teamlog/UserLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->userValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    return-object p0
.end method

.method public static admin(Lcom/dropbox/core/v2/teamlog/UserLogInfo;)Lcom/dropbox/core/v2/teamlog/ActorLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 226
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->ADMIN:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->withTagAndAdmin(Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/UserLogInfo;)Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    move-result-object p0

    return-object p0

    .line 224
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static app(Lcom/dropbox/core/v2/teamlog/AppLogInfo;)Lcom/dropbox/core/v2/teamlog/ActorLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 285
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->APP:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->withTagAndApp(Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/AppLogInfo;)Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    move-result-object p0

    return-object p0

    .line 283
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static reseller(Lcom/dropbox/core/v2/teamlog/ResellerLogInfo;)Lcom/dropbox/core/v2/teamlog/ActorLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 344
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->RESELLER:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->withTagAndReseller(Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/ResellerLogInfo;)Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    move-result-object p0

    return-object p0

    .line 342
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static user(Lcom/dropbox/core/v2/teamlog/UserLogInfo;)Lcom/dropbox/core/v2/teamlog/ActorLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 392
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->USER:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->withTagAndUser(Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/UserLogInfo;)Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    move-result-object p0

    return-object p0

    .line 390
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;)Lcom/dropbox/core/v2/teamlog/ActorLogInfo;
    .locals 1

    .line 109
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;-><init>()V

    .line 110
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    return-object v0
.end method

.method private withTagAndAdmin(Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/UserLogInfo;)Lcom/dropbox/core/v2/teamlog/ActorLogInfo;
    .locals 1

    .line 125
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;-><init>()V

    .line 126
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    .line 127
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->adminValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    return-object v0
.end method

.method private withTagAndApp(Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/AppLogInfo;)Lcom/dropbox/core/v2/teamlog/ActorLogInfo;
    .locals 1

    .line 142
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;-><init>()V

    .line 143
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    .line 144
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->appValue:Lcom/dropbox/core/v2/teamlog/AppLogInfo;

    return-object v0
.end method

.method private withTagAndReseller(Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/ResellerLogInfo;)Lcom/dropbox/core/v2/teamlog/ActorLogInfo;
    .locals 1

    .line 158
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;-><init>()V

    .line 159
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    .line 160
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->resellerValue:Lcom/dropbox/core/v2/teamlog/ResellerLogInfo;

    return-object v0
.end method

.method private withTagAndUser(Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/UserLogInfo;)Lcom/dropbox/core/v2/teamlog/ActorLogInfo;
    .locals 1

    .line 174
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;-><init>()V

    .line 175
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    .line 176
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->userValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

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

    .line 443
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    if-eqz v2, :cond_b

    .line 444
    check-cast p1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    .line 445
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 448
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$1;->$SwitchMap$com$dropbox$core$v2$teamlog$ActorLogInfo$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 460
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->userValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->userValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/UserLogInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    .line 458
    :pswitch_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->resellerValue:Lcom/dropbox/core/v2/teamlog/ResellerLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->resellerValue:Lcom/dropbox/core/v2/teamlog/ResellerLogInfo;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/ResellerLogInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_5
    return v1

    :cond_6
    :goto_1
    :pswitch_3
    return v0

    .line 454
    :pswitch_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->appValue:Lcom/dropbox/core/v2/teamlog/AppLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->appValue:Lcom/dropbox/core/v2/teamlog/AppLogInfo;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/AppLogInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_2

    :cond_7
    return v1

    :cond_8
    :goto_2
    :pswitch_5
    return v0

    .line 450
    :pswitch_6
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->adminValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->adminValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    if-eq v2, p1, :cond_a

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/UserLogInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_9

    goto :goto_3

    :cond_9
    return v1

    :cond_a
    :goto_3
    return v0

    :cond_b
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getAdminValue()Lcom/dropbox/core/v2/teamlog/UserLogInfo;
    .locals 3

    .line 240
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->ADMIN:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 243
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->adminValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    return-object v0

    .line 241
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ADMIN, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAppValue()Lcom/dropbox/core/v2/teamlog/AppLogInfo;
    .locals 3

    .line 299
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->APP:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 302
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->appValue:Lcom/dropbox/core/v2/teamlog/AppLogInfo;

    return-object v0

    .line 300
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.APP, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getResellerValue()Lcom/dropbox/core/v2/teamlog/ResellerLogInfo;
    .locals 3

    .line 358
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->RESELLER:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 361
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->resellerValue:Lcom/dropbox/core/v2/teamlog/ResellerLogInfo;

    return-object v0

    .line 359
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.RESELLER, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUserValue()Lcom/dropbox/core/v2/teamlog/UserLogInfo;
    .locals 3

    .line 406
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->USER:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 409
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->userValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    return-object v0

    .line 407
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.USER, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 7

    .line 425
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->adminValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->appValue:Lcom/dropbox/core/v2/teamlog/AppLogInfo;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->resellerValue:Lcom/dropbox/core/v2/teamlog/ResellerLogInfo;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->userValue:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const/4 v0, 0x1

    aput-object v1, v5, v0

    const/4 v0, 0x2

    aput-object v2, v5, v0

    const/4 v0, 0x3

    aput-object v3, v5, v0

    const/4 v0, 0x4

    aput-object v4, v5, v0

    invoke-static {v5}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isAdmin()Z
    .locals 2

    .line 206
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->ADMIN:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isAnonymous()Z
    .locals 2

    .line 254
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->ANONYMOUS:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isApp()Z
    .locals 2

    .line 265
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->APP:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isDropbox()Z
    .locals 2

    .line 313
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->DROPBOX:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 420
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isReseller()Z
    .locals 2

    .line 324
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->RESELLER:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUser()Z
    .locals 2

    .line 372
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;->USER:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;
    .locals 1

    .line 195
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 474
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 486
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/ActorLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
