.class public final Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;
.super Ljava/lang/Object;
.source "AccessMethodLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Serializer;,
        Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

.field private adminConsoleValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

.field private apiValue:Lcom/dropbox/core/v2/teamlog/ApiSessionLogInfo;

.field private contentManagerValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

.field private endUserValue:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

.field private enterpriseConsoleValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

.field private signInAsValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 80
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->withTag(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->OTHER:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;)Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->adminConsoleValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;)Lcom/dropbox/core/v2/teamlog/ApiSessionLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->apiValue:Lcom/dropbox/core/v2/teamlog/ApiSessionLogInfo;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;)Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->contentManagerValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    return-object p0
.end method

.method static synthetic access$300(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;)Lcom/dropbox/core/v2/teamlog/SessionLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->endUserValue:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    return-object p0
.end method

.method static synthetic access$400(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;)Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->enterpriseConsoleValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    return-object p0
.end method

.method static synthetic access$500(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;)Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->signInAsValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    return-object p0
.end method

.method public static adminConsole(Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 254
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->ADMIN_CONSOLE:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->withTagAndAdminConsole(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    move-result-object p0

    return-object p0

    .line 252
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static api(Lcom/dropbox/core/v2/teamlog/ApiSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 303
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->API:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->withTagAndApi(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/ApiSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    move-result-object p0

    return-object p0

    .line 301
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static contentManager(Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 351
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->CONTENT_MANAGER:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->withTagAndContentManager(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    move-result-object p0

    return-object p0

    .line 349
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static endUser(Lcom/dropbox/core/v2/teamlog/SessionLogInfo;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 400
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->END_USER:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->withTagAndEndUser(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/SessionLogInfo;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    move-result-object p0

    return-object p0

    .line 398
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static enterpriseConsole(Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 448
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->ENTERPRISE_CONSOLE:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->withTagAndEnterpriseConsole(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    move-result-object p0

    return-object p0

    .line 446
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static signInAs(Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 497
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->SIGN_IN_AS:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->withTagAndSignInAs(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    move-result-object p0

    return-object p0

    .line 495
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;
    .locals 1

    .line 103
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;-><init>()V

    .line 104
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    return-object v0
.end method

.method private withTagAndAdminConsole(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;
    .locals 1

    .line 119
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;-><init>()V

    .line 120
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    .line 121
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->adminConsoleValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    return-object v0
.end method

.method private withTagAndApi(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/ApiSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;
    .locals 1

    .line 135
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;-><init>()V

    .line 136
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    .line 137
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->apiValue:Lcom/dropbox/core/v2/teamlog/ApiSessionLogInfo;

    return-object v0
.end method

.method private withTagAndContentManager(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;
    .locals 1

    .line 152
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;-><init>()V

    .line 153
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    .line 154
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->contentManagerValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    return-object v0
.end method

.method private withTagAndEndUser(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/SessionLogInfo;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;
    .locals 1

    .line 168
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;-><init>()V

    .line 169
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    .line 170
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->endUserValue:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    return-object v0
.end method

.method private withTagAndEnterpriseConsole(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;
    .locals 1

    .line 185
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;-><init>()V

    .line 186
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    .line 187
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->enterpriseConsoleValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    return-object v0
.end method

.method private withTagAndSignInAs(Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;
    .locals 1

    .line 202
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;-><init>()V

    .line 203
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    .line 204
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->signInAsValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

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

    .line 550
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    if-eqz v2, :cond_f

    .line 551
    check-cast p1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;

    .line 552
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 555
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$1;->$SwitchMap$com$dropbox$core$v2$teamlog$AccessMethodLogInfo$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 567
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->signInAsValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->signInAsValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    .line 565
    :pswitch_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->enterpriseConsoleValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->enterpriseConsoleValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_5
    return v1

    :cond_6
    :goto_1
    return v0

    .line 563
    :pswitch_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->endUserValue:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->endUserValue:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/SessionLogInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_2

    :cond_7
    return v1

    :cond_8
    :goto_2
    return v0

    .line 561
    :pswitch_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->contentManagerValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->contentManagerValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    if-eq v2, p1, :cond_a

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_9

    goto :goto_3

    :cond_9
    return v1

    :cond_a
    :goto_3
    return v0

    .line 559
    :pswitch_5
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->apiValue:Lcom/dropbox/core/v2/teamlog/ApiSessionLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->apiValue:Lcom/dropbox/core/v2/teamlog/ApiSessionLogInfo;

    if-eq v2, p1, :cond_c

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/ApiSessionLogInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    goto :goto_4

    :cond_b
    return v1

    :cond_c
    :goto_4
    return v0

    .line 557
    :pswitch_6
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->adminConsoleValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->adminConsoleValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    if-eq v2, p1, :cond_e

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d

    goto :goto_5

    :cond_d
    return v1

    :cond_e
    :goto_5
    return v0

    :cond_f
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

.method public getAdminConsoleValue()Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;
    .locals 3

    .line 269
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->ADMIN_CONSOLE:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 272
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->adminConsoleValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    return-object v0

    .line 270
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ADMIN_CONSOLE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getApiValue()Lcom/dropbox/core/v2/teamlog/ApiSessionLogInfo;
    .locals 3

    .line 317
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->API:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 320
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->apiValue:Lcom/dropbox/core/v2/teamlog/ApiSessionLogInfo;

    return-object v0

    .line 318
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.API, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getContentManagerValue()Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;
    .locals 3

    .line 366
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->CONTENT_MANAGER:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 369
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->contentManagerValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    return-object v0

    .line 367
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.CONTENT_MANAGER, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getEndUserValue()Lcom/dropbox/core/v2/teamlog/SessionLogInfo;
    .locals 3

    .line 414
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->END_USER:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 417
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->endUserValue:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    return-object v0

    .line 415
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.END_USER, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getEnterpriseConsoleValue()Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;
    .locals 3

    .line 463
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->ENTERPRISE_CONSOLE:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 466
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->enterpriseConsoleValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    return-object v0

    .line 464
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ENTERPRISE_CONSOLE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSignInAsValue()Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;
    .locals 3

    .line 511
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->SIGN_IN_AS:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 514
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->signInAsValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    return-object v0

    .line 512
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.SIGN_IN_AS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 9

    .line 530
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->adminConsoleValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->apiValue:Lcom/dropbox/core/v2/teamlog/ApiSessionLogInfo;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->contentManagerValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->endUserValue:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->enterpriseConsoleValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    iget-object v6, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->signInAsValue:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    const/4 v7, 0x7

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v0, v7, v8

    const/4 v0, 0x1

    aput-object v1, v7, v0

    const/4 v0, 0x2

    aput-object v2, v7, v0

    const/4 v0, 0x3

    aput-object v3, v7, v0

    const/4 v0, 0x4

    aput-object v4, v7, v0

    const/4 v0, 0x5

    aput-object v5, v7, v0

    const/4 v0, 0x6

    aput-object v6, v7, v0

    invoke-static {v7}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isAdminConsole()Z
    .locals 2

    .line 234
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->ADMIN_CONSOLE:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isApi()Z
    .locals 2

    .line 283
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->API:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isContentManager()Z
    .locals 2

    .line 331
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->CONTENT_MANAGER:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isEndUser()Z
    .locals 2

    .line 380
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->END_USER:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isEnterpriseConsole()Z
    .locals 2

    .line 428
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->ENTERPRISE_CONSOLE:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 525
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSignInAs()Z
    .locals 2

    .line 477
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;->SIGN_IN_AS:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;
    .locals 1

    .line 223
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 581
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 593
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/AccessMethodLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
