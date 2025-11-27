.class public Lcom/dropbox/core/v2/team/DeviceSession$Builder;
.super Ljava/lang/Object;
.source "DeviceSession.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/DeviceSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected country:Ljava/lang/String;

.field protected created:Ljava/util/Date;

.field protected ipAddress:Ljava/lang/String;

.field protected final sessionId:Ljava/lang/String;

.field protected updated:Ljava/util/Date;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 156
    iput-object p1, p0, Lcom/dropbox/core/v2/team/DeviceSession$Builder;->sessionId:Ljava/lang/String;

    const/4 p1, 0x0

    .line 157
    iput-object p1, p0, Lcom/dropbox/core/v2/team/DeviceSession$Builder;->ipAddress:Ljava/lang/String;

    .line 158
    iput-object p1, p0, Lcom/dropbox/core/v2/team/DeviceSession$Builder;->country:Ljava/lang/String;

    .line 159
    iput-object p1, p0, Lcom/dropbox/core/v2/team/DeviceSession$Builder;->created:Ljava/util/Date;

    .line 160
    iput-object p1, p0, Lcom/dropbox/core/v2/team/DeviceSession$Builder;->updated:Ljava/util/Date;

    return-void

    .line 154
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'sessionId\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/team/DeviceSession;
    .locals 6

    .line 220
    new-instance v0, Lcom/dropbox/core/v2/team/DeviceSession;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/DeviceSession$Builder;->sessionId:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/DeviceSession$Builder;->ipAddress:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/DeviceSession$Builder;->country:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/team/DeviceSession$Builder;->created:Ljava/util/Date;

    iget-object v5, p0, Lcom/dropbox/core/v2/team/DeviceSession$Builder;->updated:Ljava/util/Date;

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/team/DeviceSession;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;)V

    return-object v0
.end method

.method public withCountry(Ljava/lang/String;)Lcom/dropbox/core/v2/team/DeviceSession$Builder;
    .locals 0

    .line 185
    iput-object p1, p0, Lcom/dropbox/core/v2/team/DeviceSession$Builder;->country:Ljava/lang/String;

    return-object p0
.end method

.method public withCreated(Ljava/util/Date;)Lcom/dropbox/core/v2/team/DeviceSession$Builder;
    .locals 0

    .line 197
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/team/DeviceSession$Builder;->created:Ljava/util/Date;

    return-object p0
.end method

.method public withIpAddress(Ljava/lang/String;)Lcom/dropbox/core/v2/team/DeviceSession$Builder;
    .locals 0

    .line 172
    iput-object p1, p0, Lcom/dropbox/core/v2/team/DeviceSession$Builder;->ipAddress:Ljava/lang/String;

    return-object p0
.end method

.method public withUpdated(Ljava/util/Date;)Lcom/dropbox/core/v2/team/DeviceSession$Builder;
    .locals 0

    .line 209
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/team/DeviceSession$Builder;->updated:Ljava/util/Date;

    return-object p0
.end method
