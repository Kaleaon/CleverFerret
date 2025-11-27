.class public Lcom/google/api/services/drive/Drive$Permissions$Create;
.super Lcom/google/api/services/drive/DriveRequest;
.source "Drive.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/api/services/drive/Drive$Permissions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Create"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/api/services/drive/DriveRequest<",
        "Lcom/google/api/services/drive/model/Permission;",
        ">;"
    }
.end annotation


# static fields
.field private static final REST_PATH:Ljava/lang/String; = "files/{fileId}/permissions"


# instance fields
.field private emailMessage:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private fileId:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private sendNotificationEmail:Ljava/lang/Boolean;
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
.method protected constructor <init>(Lcom/google/api/services/drive/Drive$Permissions;Ljava/lang/String;Lcom/google/api/services/drive/model/Permission;)V
    .locals 6

    .line 6091
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->this$1:Lcom/google/api/services/drive/Drive$Permissions;

    .line 6092
    iget-object v1, p1, Lcom/google/api/services/drive/Drive$Permissions;->this$0:Lcom/google/api/services/drive/Drive;

    const-string v3, "files/{fileId}/permissions"

    const-class v5, Lcom/google/api/services/drive/model/Permission;

    const-string v2, "POST"

    move-object v0, p0

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/api/services/drive/DriveRequest;-><init>(Lcom/google/api/services/drive/Drive;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V

    .line 6093
    const-string p1, "Required parameter fileId must be specified."

    invoke-static {p2, p1}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, v0, Lcom/google/api/services/drive/Drive$Permissions$Create;->fileId:Ljava/lang/String;

    .line 6094
    const-string p1, "content"

    invoke-virtual {p0, v4, p1}, Lcom/google/api/services/drive/Drive$Permissions$Create;->checkRequiredParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6095
    invoke-virtual {v4}, Lcom/google/api/services/drive/model/Permission;->getRole()Ljava/lang/String;

    move-result-object p2

    const-string p3, "Permission.getRole()"

    invoke-virtual {p0, p2, p3}, Lcom/google/api/services/drive/Drive$Permissions$Create;->checkRequiredParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6096
    invoke-virtual {p0, v4, p1}, Lcom/google/api/services/drive/Drive$Permissions$Create;->checkRequiredParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6097
    invoke-virtual {v4}, Lcom/google/api/services/drive/model/Permission;->getType()Ljava/lang/String;

    move-result-object p1

    const-string p2, "Permission.getType()"

    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Permissions$Create;->checkRequiredParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getEmailMessage()Ljava/lang/String;
    .locals 1

    .line 6158
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->emailMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getFileId()Ljava/lang/String;
    .locals 1

    .line 6142
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->fileId:Ljava/lang/String;

    return-object v0
.end method

.method public getSendNotificationEmail()Ljava/lang/Boolean;
    .locals 1

    .line 6180
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->sendNotificationEmail:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getSupportsAllDrives()Ljava/lang/Boolean;
    .locals 1

    .line 6206
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->supportsAllDrives:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getSupportsTeamDrives()Ljava/lang/Boolean;
    .locals 1

    .line 6255
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->supportsTeamDrives:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getTransferOwnership()Ljava/lang/Boolean;
    .locals 1

    .line 6302
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->transferOwnership:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getUseDomainAdminAccess()Ljava/lang/Boolean;
    .locals 1

    .line 6355
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->useDomainAdminAccess:Ljava/lang/Boolean;

    return-object v0
.end method

.method public isSupportsAllDrives()Z
    .locals 2

    .line 6242
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->supportsAllDrives:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 6245
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->supportsAllDrives:Ljava/lang/Boolean;

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

    .line 6285
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->supportsTeamDrives:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 6288
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->supportsTeamDrives:Ljava/lang/Boolean;

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

    .line 6336
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->transferOwnership:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 6339
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->transferOwnership:Ljava/lang/Boolean;

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

    .line 6391
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->useDomainAdminAccess:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 6394
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->useDomainAdminAccess:Ljava/lang/Boolean;

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

    .line 6073
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Permissions$Create;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Permissions$Create;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/googleapis/services/json/AbstractGoogleJsonClientRequest;
    .locals 0

    .line 6073
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Permissions$Create;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Permissions$Create;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;
    .locals 0

    .line 6073
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Permissions$Create;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Permissions$Create;

    move-result-object p1

    return-object p1
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Permissions$Create;
    .locals 0

    .line 6399
    invoke-super {p0, p1, p2}, Lcom/google/api/services/drive/DriveRequest;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Permissions$Create;

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 6073
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Permissions$Create;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Permissions$Create;

    move-result-object p1

    return-object p1
.end method

.method public setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Create;
    .locals 0

    .line 6102
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Permissions$Create;

    return-object p1
.end method

.method public bridge synthetic setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 6073
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Permissions$Create;->setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Create;

    move-result-object p1

    return-object p1
.end method

.method public setEmailMessage(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Create;
    .locals 0

    .line 6163
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->emailMessage:Ljava/lang/String;

    return-object p0
.end method

.method public setFields(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Create;
    .locals 0

    .line 6107
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setFields(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Permissions$Create;

    return-object p1
.end method

.method public bridge synthetic setFields(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 6073
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Permissions$Create;->setFields(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Create;

    move-result-object p1

    return-object p1
.end method

.method public setFileId(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Create;
    .locals 0

    .line 6147
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->fileId:Ljava/lang/String;

    return-object p0
.end method

.method public setKey(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Create;
    .locals 0

    .line 6112
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setKey(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Permissions$Create;

    return-object p1
.end method

.method public bridge synthetic setKey(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 6073
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Permissions$Create;->setKey(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Create;

    move-result-object p1

    return-object p1
.end method

.method public setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Create;
    .locals 0

    .line 6117
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Permissions$Create;

    return-object p1
.end method

.method public bridge synthetic setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 6073
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Permissions$Create;->setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Create;

    move-result-object p1

    return-object p1
.end method

.method public setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Permissions$Create;
    .locals 0

    .line 6122
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Permissions$Create;

    return-object p1
.end method

.method public bridge synthetic setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 6073
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Permissions$Create;->setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Permissions$Create;

    move-result-object p1

    return-object p1
.end method

.method public setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Create;
    .locals 0

    .line 6127
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Permissions$Create;

    return-object p1
.end method

.method public bridge synthetic setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 6073
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Permissions$Create;->setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Create;

    move-result-object p1

    return-object p1
.end method

.method public setSendNotificationEmail(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Permissions$Create;
    .locals 0

    .line 6189
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->sendNotificationEmail:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setSupportsAllDrives(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Permissions$Create;
    .locals 0

    .line 6215
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->supportsAllDrives:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setSupportsTeamDrives(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Permissions$Create;
    .locals 0

    .line 6260
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->supportsTeamDrives:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setTransferOwnership(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Permissions$Create;
    .locals 0

    .line 6310
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->transferOwnership:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setUseDomainAdminAccess(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Permissions$Create;
    .locals 0

    .line 6364
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Permissions$Create;->useDomainAdminAccess:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Create;
    .locals 0

    .line 6132
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Permissions$Create;

    return-object p1
.end method

.method public bridge synthetic setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 6073
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Permissions$Create;->setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Permissions$Create;

    move-result-object p1

    return-object p1
.end method
