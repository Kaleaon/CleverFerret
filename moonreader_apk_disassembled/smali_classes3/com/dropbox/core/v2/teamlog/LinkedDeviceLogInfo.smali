.class public final Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;
.super Ljava/lang/Object;
.source "LinkedDeviceLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;,
        Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

.field private desktopDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;

.field private legacyDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;

.field private mobileDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;

.field private webDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 72
    new-instance v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->withTag(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->OTHER:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;)Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->desktopDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;)Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->legacyDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;)Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->mobileDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;

    return-object p0
.end method

.method static synthetic access$300(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;)Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->webDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;

    return-object p0
.end method

.method public static desktopDeviceSession(Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 212
    new-instance v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->DESKTOP_DEVICE_SESSION:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->withTagAndDesktopDeviceSession(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    move-result-object p0

    return-object p0

    .line 210
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static legacyDeviceSession(Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 262
    new-instance v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->LEGACY_DEVICE_SESSION:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->withTagAndLegacyDeviceSession(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    move-result-object p0

    return-object p0

    .line 260
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static mobileDeviceSession(Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 312
    new-instance v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->MOBILE_DEVICE_SESSION:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->withTagAndMobileDeviceSession(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    move-result-object p0

    return-object p0

    .line 310
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static webDeviceSession(Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 362
    new-instance v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->WEB_DEVICE_SESSION:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->withTagAndWebDeviceSession(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    move-result-object p0

    return-object p0

    .line 360
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;
    .locals 1

    .line 93
    new-instance v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;-><init>()V

    .line 94
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    return-object v0
.end method

.method private withTagAndDesktopDeviceSession(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;
    .locals 1

    .line 109
    new-instance v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;-><init>()V

    .line 110
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    .line 111
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->desktopDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;

    return-object v0
.end method

.method private withTagAndLegacyDeviceSession(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;
    .locals 1

    .line 126
    new-instance v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;-><init>()V

    .line 127
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    .line 128
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->legacyDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;

    return-object v0
.end method

.method private withTagAndMobileDeviceSession(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;
    .locals 1

    .line 143
    new-instance v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;-><init>()V

    .line 144
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    .line 145
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->mobileDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;

    return-object v0
.end method

.method private withTagAndWebDeviceSession(Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;
    .locals 1

    .line 160
    new-instance v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;-><init>()V

    .line 161
    iput-object p1, v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    .line 162
    iput-object p2, v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->webDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;

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

    .line 414
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    if-eqz v2, :cond_10

    .line 415
    check-cast p1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    .line 416
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 419
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$1;->$SwitchMap$com$dropbox$core$v2$teamlog$LinkedDeviceLogInfo$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_d

    const/4 v3, 0x2

    if-eq v2, v3, :cond_a

    const/4 v3, 0x3

    if-eq v2, v3, :cond_7

    const/4 v3, 0x4

    if-eq v2, v3, :cond_4

    const/4 p1, 0x5

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 427
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->webDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->webDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 425
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->mobileDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->mobileDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8

    goto :goto_1

    :cond_8
    return v1

    :cond_9
    :goto_1
    return v0

    .line 423
    :cond_a
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->legacyDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->legacyDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;

    if-eq v2, p1, :cond_c

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    goto :goto_2

    :cond_b
    return v1

    :cond_c
    :goto_2
    return v0

    .line 421
    :cond_d
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->desktopDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->desktopDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;

    if-eq v2, p1, :cond_f

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_e

    goto :goto_3

    :cond_e
    return v1

    :cond_f
    :goto_3
    return v0

    :cond_10
    return v1
.end method

.method public getDesktopDeviceSessionValue()Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;
    .locals 3

    .line 228
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->DESKTOP_DEVICE_SESSION:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 231
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->desktopDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;

    return-object v0

    .line 229
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.DESKTOP_DEVICE_SESSION, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getLegacyDeviceSessionValue()Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;
    .locals 3

    .line 278
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->LEGACY_DEVICE_SESSION:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 281
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->legacyDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;

    return-object v0

    .line 279
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.LEGACY_DEVICE_SESSION, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getMobileDeviceSessionValue()Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;
    .locals 3

    .line 328
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->MOBILE_DEVICE_SESSION:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 331
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->mobileDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;

    return-object v0

    .line 329
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.MOBILE_DEVICE_SESSION, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getWebDeviceSessionValue()Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;
    .locals 3

    .line 377
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->WEB_DEVICE_SESSION:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 380
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->webDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;

    return-object v0

    .line 378
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.WEB_DEVICE_SESSION, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 7

    .line 396
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->desktopDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->legacyDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->mobileDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->webDeviceSessionValue:Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;

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

.method public isDesktopDeviceSession()Z
    .locals 2

    .line 192
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->DESKTOP_DEVICE_SESSION:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isLegacyDeviceSession()Z
    .locals 2

    .line 242
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->LEGACY_DEVICE_SESSION:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isMobileDeviceSession()Z
    .locals 2

    .line 292
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->MOBILE_DEVICE_SESSION:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 391
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isWebDeviceSession()Z
    .locals 2

    .line 342
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;->WEB_DEVICE_SESSION:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;
    .locals 1

    .line 181
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;->_tag:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 441
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 453
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
