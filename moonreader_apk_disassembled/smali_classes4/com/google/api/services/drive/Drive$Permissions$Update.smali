.class public Lcom/google/api/services/drive/Drive$Permissions$Update;
.super Lcom/google/api/services/drive/DriveRequest;
.source "Drive.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/api/services/drive/Drive$Permissions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Update"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/api/services/drive/DriveRequest<",
        "Lcom/google/api/services/drive/model/Permission;",
        ">;"
    }
.end annotation


# static fields
.field private static final REST_PATH:Ljava/lang/String; = "files/{fileId}/permissions/{permissionId}"


# instance fields
.field private fileId:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private permissionId:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private removeExpiration:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private supportsAllDrives:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private supportsTeamDrives:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field final synthetic this$1:Lcom/google/api/services/drive/Drive$Permissions;

.field private transferOwnership:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private useDomainAdminAccess:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lcom/google/api/services/drive/Drive$Permissions;Ljava/lang/String;Ljava/lang/String;Lcom/google/api/services/drive/model/Permission;)V
    .locals 6

    .line 7293
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->this$1:Lcom/google/api/services/drive/Drive$Permissions;

    .line 7294
    iget-object v1, p1, Lcom/google/api/services/drive/Drive$Permissions;->this$0:Lcom/google/api/services/drive/Drive;

    const-string v3, "files/{fileId}/permissions/{permissionId}"

    const-class v5, Lcom/google/api/services/drive/model/Permission;

    const-string v2, "PATCH"

    move-object v0, p0

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/api/services/drive/DriveRequest;-><init>(Lcom/google/api/services/drive/Drive;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V

    .line 7295
    const-string p1, "Required parameter fileId must be specified."

    invoke-static {p2, p1}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, v0, Lcom/google/api/services/drive/Drive$Permissions$Update;->fileId:Ljava/lang/String;

    .line 7296
    const-string p1, "Required parameter permissionId must be specified."

    invoke-static {p3, p1}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, v0, Lcom/google/api/services/drive/Drive$Permissions$Update;->permissionId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getFileId()Ljava/lang/String;
    .locals 1

    .line 7341
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->fileId:Ljava/lang/String;

    return-object v0
.end method

.method public getPermissionId()Ljava/lang/String;
    .locals 1

    .line 7357
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->permissionId:Ljava/lang/String;

    return-object v0
.end method

.method public getRemoveExpiration()Ljava/lang/Boolean;
    .locals 1

    .line 7373
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->removeExpiration:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getSupportsAllDrives()Ljava/lang/Boolean;
    .locals 1

    .line 7422
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->supportsAllDrives:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getSupportsTeamDrives()Ljava/lang/Boolean;
    .locals 1

    .line 7471
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->supportsTeamDrives:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getTransferOwnership()Ljava/lang/Boolean;
    .locals 1

    .line 7518
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->transferOwnership:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getUseDomainAdminAccess()Ljava/lang/Boolean;
    .locals 1

    .line 7571
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->useDomainAdminAccess:Ljava/lang/Boolean;

    return-object v0
.end method

.method public isRemoveExpiration()Z
    .locals 2

    .line 7403
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->removeExpiration:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 7406
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->removeExpiration:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSupportsAllDrives()Z
    .locals 2

    .line 7458
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->supportsAllDrives:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 7461
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->supportsAllDrives:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSupportsTeamDrives()Z
    .locals 2

    .line 7501
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->supportsTeamDrives:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 7504
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->supportsTeamDrives:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTransferOwnership()Z
    .locals 2

    .line 7552
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->transferOwnership:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 7555
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->transferOwnership:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUseDomainAdminAccess()Z
    .locals 2

    .line 7607
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->useDomainAdminAccess:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 7610
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->useDomainAdminAccess:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest;
    .locals 0

    .line 7274
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Permissions$Update;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Permissions$Update;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/googleapis/services/json/AbstractGoogleJsonClientRequest;
    .locals 0

    .line 7274
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Permissions$Update;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Permissions$Update;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;
    .locals 0

    .line 7274
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Permissions$Update;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Permissions$Update;

    move-result-object p1

    return-object p1
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Permissions$Update;
    .locals 0

    .line 7615
    invoke-super {p0, p1, p2}, Lcom/google/api/services/drive/DriveRequest;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Permissions$Update;

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 7274
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Permissions$Update;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Permissions$Update;

    move-result-object p1

    return-object p1
.end method

.method public setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Update;
    .locals 0

    .line 7301
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Permissions$Update;

    return-object p1
.end method

.method public bridge synthetic setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 7274
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Permissions$Update;->setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Update;

    move-result-object p1

    return-object p1
.end method

.method public setFields(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Update;
    .locals 0

    .line 7306
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setFields(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Permissions$Update;

    return-object p1
.end method

.method public bridge synthetic setFields(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 7274
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Permissions$Update;->setFields(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Update;

    move-result-object p1

    return-object p1
.end method

.method public setFileId(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Update;
    .locals 0

    .line 7346
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->fileId:Ljava/lang/String;

    return-object p0
.end method

.method public setKey(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Update;
    .locals 0

    .line 7311
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setKey(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Permissions$Update;

    return-object p1
.end method

.method public bridge synthetic setKey(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 7274
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Permissions$Update;->setKey(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Update;

    move-result-object p1

    return-object p1
.end method

.method public setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Update;
    .locals 0

    .line 7316
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Permissions$Update;

    return-object p1
.end method

.method public bridge synthetic setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 7274
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Permissions$Update;->setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Update;

    move-result-object p1

    return-object p1
.end method

.method public setPermissionId(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Update;
    .locals 0

    .line 7362
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->permissionId:Ljava/lang/String;

    return-object p0
.end method

.method public setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Permissions$Update;
    .locals 0

    .line 7321
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Permissions$Update;

    return-object p1
.end method

.method public bridge synthetic setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 7274
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Permissions$Update;->setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Permissions$Update;

    move-result-object p1

    return-object p1
.end method

.method public setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Update;
    .locals 0

    .line 7326
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Permissions$Update;

    return-object p1
.end method

.method public bridge synthetic setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 7274
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Permissions$Update;->setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Update;

    move-result-object p1

    return-object p1
.end method

.method public setRemoveExpiration(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Permissions$Update;
    .locals 0

    .line 7378
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->removeExpiration:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setSupportsAllDrives(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Permissions$Update;
    .locals 0

    .line 7431
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->supportsAllDrives:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setSupportsTeamDrives(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Permissions$Update;
    .locals 0

    .line 7476
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->supportsTeamDrives:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setTransferOwnership(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Permissions$Update;
    .locals 0

    .line 7526
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->transferOwnership:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setUseDomainAdminAccess(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Permissions$Update;
    .locals 0

    .line 7580
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Permissions$Update;->useDomainAdminAccess:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Update;
    .locals 0

    .line 7331
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Permissions$Update;

    return-object p1
.end method

.method public bridge synthetic setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 7274
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Permissions$Update;->setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Update;

    move-result-object p1

    return-object p1
.end method
