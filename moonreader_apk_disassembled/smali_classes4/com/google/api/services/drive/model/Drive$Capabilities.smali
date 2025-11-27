.class public final Lcom/google/api/services/drive/model/Drive$Capabilities;
.super Lcom/google/api/client/json/GenericJson;
.source "Drive.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/api/services/drive/model/Drive;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Capabilities"
.end annotation


# instance fields
.field private canAddChildren:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canChangeCopyRequiresWriterPermissionRestriction:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canChangeDomainUsersOnlyRestriction:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canChangeDriveBackground:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canChangeDriveMembersOnlyRestriction:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canComment:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canCopy:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canDeleteChildren:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canDeleteDrive:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canDownload:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canEdit:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canListChildren:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canManageMembers:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canReadRevisions:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canRename:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canRenameDrive:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canShare:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canTrashChildren:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 476
    invoke-direct {p0}, Lcom/google/api/client/json/GenericJson;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/api/client/json/GenericJson;
    .locals 1

    .line 476
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/Drive$Capabilities;->clone()Lcom/google/api/services/drive/model/Drive$Capabilities;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/api/client/util/GenericData;
    .locals 1

    .line 476
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/Drive$Capabilities;->clone()Lcom/google/api/services/drive/model/Drive$Capabilities;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 1

    .line 926
    invoke-super {p0}, Lcom/google/api/client/json/GenericJson;->clone()Lcom/google/api/client/json/GenericJson;

    move-result-object v0

    check-cast v0, Lcom/google/api/services/drive/model/Drive$Capabilities;

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 476
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/Drive$Capabilities;->clone()Lcom/google/api/services/drive/model/Drive$Capabilities;

    move-result-object v0

    return-object v0
.end method

.method public getCanAddChildren()Ljava/lang/Boolean;
    .locals 1

    .line 612
    iget-object v0, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canAddChildren:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanChangeCopyRequiresWriterPermissionRestriction()Ljava/lang/Boolean;
    .locals 1

    .line 630
    iget-object v0, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canChangeCopyRequiresWriterPermissionRestriction:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanChangeDomainUsersOnlyRestriction()Ljava/lang/Boolean;
    .locals 1

    .line 648
    iget-object v0, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canChangeDomainUsersOnlyRestriction:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanChangeDriveBackground()Ljava/lang/Boolean;
    .locals 1

    .line 665
    iget-object v0, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canChangeDriveBackground:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanChangeDriveMembersOnlyRestriction()Ljava/lang/Boolean;
    .locals 1

    .line 682
    iget-object v0, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canChangeDriveMembersOnlyRestriction:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanComment()Ljava/lang/Boolean;
    .locals 1

    .line 699
    iget-object v0, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canComment:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanCopy()Ljava/lang/Boolean;
    .locals 1

    .line 716
    iget-object v0, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canCopy:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanDeleteChildren()Ljava/lang/Boolean;
    .locals 1

    .line 733
    iget-object v0, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canDeleteChildren:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanDeleteDrive()Ljava/lang/Boolean;
    .locals 1

    .line 751
    iget-object v0, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canDeleteDrive:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanDownload()Ljava/lang/Boolean;
    .locals 1

    .line 769
    iget-object v0, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canDownload:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanEdit()Ljava/lang/Boolean;
    .locals 1

    .line 786
    iget-object v0, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canEdit:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanListChildren()Ljava/lang/Boolean;
    .locals 1

    .line 803
    iget-object v0, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canListChildren:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanManageMembers()Ljava/lang/Boolean;
    .locals 1

    .line 821
    iget-object v0, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canManageMembers:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanReadRevisions()Ljava/lang/Boolean;
    .locals 1

    .line 839
    iget-object v0, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canReadRevisions:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanRename()Ljava/lang/Boolean;
    .locals 1

    .line 856
    iget-object v0, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canRename:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanRenameDrive()Ljava/lang/Boolean;
    .locals 1

    .line 873
    iget-object v0, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canRenameDrive:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanShare()Ljava/lang/Boolean;
    .locals 1

    .line 890
    iget-object v0, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canShare:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanTrashChildren()Ljava/lang/Boolean;
    .locals 1

    .line 907
    iget-object v0, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canTrashChildren:Ljava/lang/Boolean;

    return-object v0
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/json/GenericJson;
    .locals 0

    .line 476
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/model/Drive$Capabilities;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/Drive$Capabilities;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;
    .locals 0

    .line 476
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/model/Drive$Capabilities;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/Drive$Capabilities;

    move-result-object p1

    return-object p1
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 0

    .line 921
    invoke-super {p0, p1, p2}, Lcom/google/api/client/json/GenericJson;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/json/GenericJson;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/model/Drive$Capabilities;

    return-object p1
.end method

.method public setCanAddChildren(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 0

    .line 620
    iput-object p1, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canAddChildren:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanChangeCopyRequiresWriterPermissionRestriction(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 0

    .line 639
    iput-object p1, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canChangeCopyRequiresWriterPermissionRestriction:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanChangeDomainUsersOnlyRestriction(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 0

    .line 656
    iput-object p1, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canChangeDomainUsersOnlyRestriction:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanChangeDriveBackground(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 0

    .line 673
    iput-object p1, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canChangeDriveBackground:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanChangeDriveMembersOnlyRestriction(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 0

    .line 690
    iput-object p1, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canChangeDriveMembersOnlyRestriction:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanComment(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 0

    .line 707
    iput-object p1, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canComment:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanCopy(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 0

    .line 724
    iput-object p1, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canCopy:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanDeleteChildren(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 0

    .line 741
    iput-object p1, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canDeleteChildren:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanDeleteDrive(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 0

    .line 760
    iput-object p1, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canDeleteDrive:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanDownload(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 0

    .line 777
    iput-object p1, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canDownload:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanEdit(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 0

    .line 794
    iput-object p1, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canEdit:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanListChildren(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 0

    .line 811
    iput-object p1, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canListChildren:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanManageMembers(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 0

    .line 830
    iput-object p1, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canManageMembers:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanReadRevisions(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 0

    .line 847
    iput-object p1, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canReadRevisions:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanRename(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 0

    .line 864
    iput-object p1, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canRename:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanRenameDrive(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 0

    .line 881
    iput-object p1, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canRenameDrive:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanShare(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 0

    .line 898
    iput-object p1, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canShare:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanTrashChildren(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/Drive$Capabilities;
    .locals 0

    .line 915
    iput-object p1, p0, Lcom/google/api/services/drive/model/Drive$Capabilities;->canTrashChildren:Ljava/lang/Boolean;

    return-object p0
.end method
