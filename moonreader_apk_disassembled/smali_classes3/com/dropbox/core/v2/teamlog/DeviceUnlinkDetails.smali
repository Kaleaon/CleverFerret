.class public Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;
.super Ljava/lang/Object;
.source "DeviceUnlinkDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Serializer;,
        Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Builder;
    }
.end annotation


# instance fields
.field protected final deleteData:Z

.field protected final displayName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Z)V
    .locals 1

    const/4 v0, 0x0

    .line 61
    invoke-direct {p0, p1, v0, v0}, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;-><init>(ZLcom/dropbox/core/v2/teamlog/SessionLogInfo;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(ZLcom/dropbox/core/v2/teamlog/SessionLogInfo;Ljava/lang/String;)V
    .locals 0
    .param p2    # Lcom/dropbox/core/v2/teamlog/SessionLogInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;->sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    .line 48
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;->displayName:Ljava/lang/String;

    .line 49
    iput-boolean p1, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;->deleteData:Z

    return-void
.end method

.method public static newBuilder(Z)Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Builder;
    .locals 1

    .line 103
    new-instance v0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Builder;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Builder;-><init>(Z)V

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

    .line 176
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 177
    check-cast p1, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;

    .line 178
    iget-boolean v2, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;->deleteData:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;->deleteData:Z

    if-ne v2, v3, :cond_4

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;->sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;->sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    if-eq v2, v3, :cond_2

    if-eqz v2, :cond_4

    .line 179
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/SessionLogInfo;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;->displayName:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;->displayName:Ljava/lang/String;

    if-eq v2, p1, :cond_3

    if-eqz v2, :cond_4

    .line 180
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    :cond_3
    return v0

    :cond_4
    return v1
.end method

.method public getDeleteData()Z
    .locals 1

    .line 71
    iget-boolean v0, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;->deleteData:Z

    return v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 91
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getSessionInfo()Lcom/dropbox/core/v2/teamlog/SessionLogInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 81
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;->sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 159
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;->sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;->displayName:Ljava/lang/String;

    iget-boolean v2, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;->deleteData:Z

    .line 162
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    .line 159
    invoke-static {v3}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 190
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 202
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
