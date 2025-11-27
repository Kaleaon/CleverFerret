.class public final Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;
.super Ljava/lang/Object;
.source "RevokeDeviceSessionArg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Serializer;,
        Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;
    }
.end annotation


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

.field private desktopClientValue:Lcom/dropbox/core/v2/team/RevokeDesktopClientArg;

.field private mobileClientValue:Lcom/dropbox/core/v2/team/DeviceSessionArg;

.field private webSessionValue:Lcom/dropbox/core/v2/team/DeviceSessionArg;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;)Lcom/dropbox/core/v2/team/DeviceSessionArg;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->webSessionValue:Lcom/dropbox/core/v2/team/DeviceSessionArg;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;)Lcom/dropbox/core/v2/team/RevokeDesktopClientArg;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->desktopClientValue:Lcom/dropbox/core/v2/team/RevokeDesktopClientArg;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;)Lcom/dropbox/core/v2/team/DeviceSessionArg;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->mobileClientValue:Lcom/dropbox/core/v2/team/DeviceSessionArg;

    return-object p0
.end method

.method public static desktopClient(Lcom/dropbox/core/v2/team/RevokeDesktopClientArg;)Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;
    .locals 2

    if-eqz p0, :cond_0

    .line 206
    new-instance v0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;->DESKTOP_CLIENT:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->withTagAndDesktopClient(Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;Lcom/dropbox/core/v2/team/RevokeDesktopClientArg;)Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;

    move-result-object p0

    return-object p0

    .line 204
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static mobileClient(Lcom/dropbox/core/v2/team/DeviceSessionArg;)Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;
    .locals 2

    if-eqz p0, :cond_0

    .line 255
    new-instance v0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;->MOBILE_CLIENT:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->withTagAndMobileClient(Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;Lcom/dropbox/core/v2/team/DeviceSessionArg;)Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;

    move-result-object p0

    return-object p0

    .line 253
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static webSession(Lcom/dropbox/core/v2/team/DeviceSessionArg;)Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;
    .locals 2

    if-eqz p0, :cond_0

    .line 158
    new-instance v0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;->WEB_SESSION:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->withTagAndWebSession(Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;Lcom/dropbox/core/v2/team/DeviceSessionArg;)Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;

    move-result-object p0

    return-object p0

    .line 156
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;)Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;
    .locals 1

    .line 63
    new-instance v0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;-><init>()V

    .line 64
    iput-object p1, v0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->_tag:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    return-object v0
.end method

.method private withTagAndDesktopClient(Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;Lcom/dropbox/core/v2/team/RevokeDesktopClientArg;)Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;
    .locals 1

    .line 93
    new-instance v0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;-><init>()V

    .line 94
    iput-object p1, v0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->_tag:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    .line 95
    iput-object p2, v0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->desktopClientValue:Lcom/dropbox/core/v2/team/RevokeDesktopClientArg;

    return-object v0
.end method

.method private withTagAndMobileClient(Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;Lcom/dropbox/core/v2/team/DeviceSessionArg;)Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;
    .locals 1

    .line 109
    new-instance v0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;-><init>()V

    .line 110
    iput-object p1, v0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->_tag:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    .line 111
    iput-object p2, v0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->mobileClientValue:Lcom/dropbox/core/v2/team/DeviceSessionArg;

    return-object v0
.end method

.method private withTagAndWebSession(Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;Lcom/dropbox/core/v2/team/DeviceSessionArg;)Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;
    .locals 1

    .line 77
    new-instance v0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;-><init>()V

    .line 78
    iput-object p1, v0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->_tag:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    .line 79
    iput-object p2, v0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->webSessionValue:Lcom/dropbox/core/v2/team/DeviceSessionArg;

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

    .line 295
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;

    if-eqz v2, :cond_c

    .line 296
    check-cast p1, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;

    .line 297
    iget-object v2, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->_tag:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->_tag:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 300
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$1;->$SwitchMap$com$dropbox$core$v2$team$RevokeDeviceSessionArg$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->_tag:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_9

    const/4 v3, 0x2

    if-eq v2, v3, :cond_6

    const/4 v3, 0x3

    if-eq v2, v3, :cond_3

    return v1

    .line 306
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->mobileClientValue:Lcom/dropbox/core/v2/team/DeviceSessionArg;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->mobileClientValue:Lcom/dropbox/core/v2/team/DeviceSessionArg;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/DeviceSessionArg;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    .line 304
    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->desktopClientValue:Lcom/dropbox/core/v2/team/RevokeDesktopClientArg;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->desktopClientValue:Lcom/dropbox/core/v2/team/RevokeDesktopClientArg;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/RevokeDesktopClientArg;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_1

    :cond_7
    return v1

    :cond_8
    :goto_1
    return v0

    .line 302
    :cond_9
    iget-object v2, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->webSessionValue:Lcom/dropbox/core/v2/team/DeviceSessionArg;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->webSessionValue:Lcom/dropbox/core/v2/team/DeviceSessionArg;

    if-eq v2, p1, :cond_b

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/DeviceSessionArg;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_a

    goto :goto_2

    :cond_a
    return v1

    :cond_b
    :goto_2
    return v0

    :cond_c
    return v1
.end method

.method public getDesktopClientValue()Lcom/dropbox/core/v2/team/RevokeDesktopClientArg;
    .locals 3

    .line 221
    iget-object v0, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->_tag:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;->DESKTOP_CLIENT:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    if-ne v0, v1, :cond_0

    .line 224
    iget-object v0, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->desktopClientValue:Lcom/dropbox/core/v2/team/RevokeDesktopClientArg;

    return-object v0

    .line 222
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.DESKTOP_CLIENT, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->_tag:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getMobileClientValue()Lcom/dropbox/core/v2/team/DeviceSessionArg;
    .locals 3

    .line 270
    iget-object v0, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->_tag:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;->MOBILE_CLIENT:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    if-ne v0, v1, :cond_0

    .line 273
    iget-object v0, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->mobileClientValue:Lcom/dropbox/core/v2/team/DeviceSessionArg;

    return-object v0

    .line 271
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.MOBILE_CLIENT, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->_tag:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getWebSessionValue()Lcom/dropbox/core/v2/team/DeviceSessionArg;
    .locals 3

    .line 172
    iget-object v0, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->_tag:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;->WEB_SESSION:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    if-ne v0, v1, :cond_0

    .line 175
    iget-object v0, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->webSessionValue:Lcom/dropbox/core/v2/team/DeviceSessionArg;

    return-object v0

    .line 173
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.WEB_SESSION, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->_tag:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 6

    .line 278
    iget-object v0, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->_tag:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->webSessionValue:Lcom/dropbox/core/v2/team/DeviceSessionArg;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->desktopClientValue:Lcom/dropbox/core/v2/team/RevokeDesktopClientArg;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->mobileClientValue:Lcom/dropbox/core/v2/team/DeviceSessionArg;

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

.method public isDesktopClient()Z
    .locals 2

    .line 186
    iget-object v0, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->_tag:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;->DESKTOP_CLIENT:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isMobileClient()Z
    .locals 2

    .line 235
    iget-object v0, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->_tag:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;->MOBILE_CLIENT:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isWebSession()Z
    .locals 2

    .line 138
    iget-object v0, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->_tag:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;->WEB_SESSION:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;
    .locals 1

    .line 127
    iget-object v0, p0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg;->_tag:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 318
    sget-object v0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 330
    sget-object v0, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/RevokeDeviceSessionArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
