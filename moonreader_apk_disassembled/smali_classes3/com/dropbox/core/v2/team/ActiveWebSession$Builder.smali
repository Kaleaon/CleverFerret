.class public Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;
.super Lcom/dropbox/core/v2/team/DeviceSession$Builder;
.source "ActiveWebSession.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/ActiveWebSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final browser:Ljava/lang/String;

.field protected expires:Ljava/util/Date;

.field protected final os:Ljava/lang/String;

.field protected final userAgent:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 220
    invoke-direct {p0, p1}, Lcom/dropbox/core/v2/team/DeviceSession$Builder;-><init>(Ljava/lang/String;)V

    if-eqz p2, :cond_2

    .line 224
    iput-object p2, p0, Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;->userAgent:Ljava/lang/String;

    if-eqz p3, :cond_1

    .line 228
    iput-object p3, p0, Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;->os:Ljava/lang/String;

    if-eqz p4, :cond_0

    .line 232
    iput-object p4, p0, Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;->browser:Ljava/lang/String;

    const/4 p1, 0x0

    .line 233
    iput-object p1, p0, Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;->expires:Ljava/util/Date;

    return-void

    .line 230
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'browser\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 226
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'os\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 222
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'userAgent\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/team/ActiveWebSession;
    .locals 10

    .line 305
    new-instance v0, Lcom/dropbox/core/v2/team/ActiveWebSession;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;->sessionId:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;->userAgent:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;->os:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;->browser:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;->ipAddress:Ljava/lang/String;

    iget-object v6, p0, Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;->country:Ljava/lang/String;

    iget-object v7, p0, Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;->created:Ljava/util/Date;

    iget-object v8, p0, Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;->updated:Ljava/util/Date;

    iget-object v9, p0, Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;->expires:Ljava/util/Date;

    invoke-direct/range {v0 .. v9}, Lcom/dropbox/core/v2/team/ActiveWebSession;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;)V

    return-object v0
.end method

.method public bridge synthetic build()Lcom/dropbox/core/v2/team/DeviceSession;
    .locals 1

    .line 212
    invoke-virtual {p0}, Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;->build()Lcom/dropbox/core/v2/team/ActiveWebSession;

    move-result-object v0

    return-object v0
.end method

.method public withCountry(Ljava/lang/String;)Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;
    .locals 0

    .line 270
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/team/DeviceSession$Builder;->withCountry(Ljava/lang/String;)Lcom/dropbox/core/v2/team/DeviceSession$Builder;

    return-object p0
.end method

.method public bridge synthetic withCountry(Ljava/lang/String;)Lcom/dropbox/core/v2/team/DeviceSession$Builder;
    .locals 0

    .line 212
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;->withCountry(Ljava/lang/String;)Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withCreated(Ljava/util/Date;)Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;
    .locals 0

    .line 282
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/team/DeviceSession$Builder;->withCreated(Ljava/util/Date;)Lcom/dropbox/core/v2/team/DeviceSession$Builder;

    return-object p0
.end method

.method public bridge synthetic withCreated(Ljava/util/Date;)Lcom/dropbox/core/v2/team/DeviceSession$Builder;
    .locals 0

    .line 212
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;->withCreated(Ljava/util/Date;)Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withExpires(Ljava/util/Date;)Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;
    .locals 0

    .line 244
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;->expires:Ljava/util/Date;

    return-object p0
.end method

.method public withIpAddress(Ljava/lang/String;)Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;
    .locals 0

    .line 257
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/team/DeviceSession$Builder;->withIpAddress(Ljava/lang/String;)Lcom/dropbox/core/v2/team/DeviceSession$Builder;

    return-object p0
.end method

.method public bridge synthetic withIpAddress(Ljava/lang/String;)Lcom/dropbox/core/v2/team/DeviceSession$Builder;
    .locals 0

    .line 212
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;->withIpAddress(Ljava/lang/String;)Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withUpdated(Ljava/util/Date;)Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;
    .locals 0

    .line 294
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/team/DeviceSession$Builder;->withUpdated(Ljava/util/Date;)Lcom/dropbox/core/v2/team/DeviceSession$Builder;

    return-object p0
.end method

.method public bridge synthetic withUpdated(Ljava/util/Date;)Lcom/dropbox/core/v2/team/DeviceSession$Builder;
    .locals 0

    .line 212
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;->withUpdated(Ljava/util/Date;)Lcom/dropbox/core/v2/team/ActiveWebSession$Builder;

    move-result-object p1

    return-object p1
.end method
