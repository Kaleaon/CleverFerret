.class public final Lcom/google/api/services/drive/model/File$Capabilities;
.super Lcom/google/api/client/json/GenericJson;
.source "File.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/api/services/drive/model/File;
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

.field private canChangeCopyRequiresWriterPermission:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canChangeViewersCanCopyContent:Ljava/lang/Boolean;
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

.field private canDelete:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canDeleteChildren:Ljava/lang/Boolean;
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

.field private canMoveChildrenOutOfDrive:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canMoveChildrenOutOfTeamDrive:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canMoveChildrenWithinDrive:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canMoveChildrenWithinTeamDrive:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canMoveItemIntoTeamDrive:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canMoveItemOutOfDrive:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canMoveItemOutOfTeamDrive:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canMoveItemWithinDrive:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canMoveItemWithinTeamDrive:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canMoveTeamDriveItem:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canReadDrive:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canReadRevisions:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canReadTeamDrive:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canRemoveChildren:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canRename:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canShare:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canTrash:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canTrashChildren:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canUntrash:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1487
    invoke-direct {p0}, Lcom/google/api/client/json/GenericJson;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/api/client/json/GenericJson;
    .locals 1

    .line 1487
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/File$Capabilities;->clone()Lcom/google/api/services/drive/model/File$Capabilities;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/api/client/util/GenericData;
    .locals 1

    .line 1487
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/File$Capabilities;->clone()Lcom/google/api/services/drive/model/File$Capabilities;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 1

    .line 2240
    invoke-super {p0}, Lcom/google/api/client/json/GenericJson;->clone()Lcom/google/api/client/json/GenericJson;

    move-result-object v0

    check-cast v0, Lcom/google/api/services/drive/model/File$Capabilities;

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1487
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/File$Capabilities;->clone()Lcom/google/api/services/drive/model/File$Capabilities;

    move-result-object v0

    return-object v0
.end method

.method public getCanAddChildren()Ljava/lang/Boolean;
    .locals 1

    .line 1714
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canAddChildren:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanChangeCopyRequiresWriterPermission()Ljava/lang/Boolean;
    .locals 1

    .line 1732
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canChangeCopyRequiresWriterPermission:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanChangeViewersCanCopyContent()Ljava/lang/Boolean;
    .locals 1

    .line 1749
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canChangeViewersCanCopyContent:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanComment()Ljava/lang/Boolean;
    .locals 1

    .line 1766
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canComment:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanCopy()Ljava/lang/Boolean;
    .locals 1

    .line 1784
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canCopy:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanDelete()Ljava/lang/Boolean;
    .locals 1

    .line 1802
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canDelete:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanDeleteChildren()Ljava/lang/Boolean;
    .locals 1

    .line 1820
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canDeleteChildren:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanDownload()Ljava/lang/Boolean;
    .locals 1

    .line 1838
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canDownload:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanEdit()Ljava/lang/Boolean;
    .locals 1

    .line 1855
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canEdit:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanListChildren()Ljava/lang/Boolean;
    .locals 1

    .line 1873
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canListChildren:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanMoveChildrenOutOfDrive()Ljava/lang/Boolean;
    .locals 1

    .line 1892
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveChildrenOutOfDrive:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanMoveChildrenOutOfTeamDrive()Ljava/lang/Boolean;
    .locals 1

    .line 1910
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveChildrenOutOfTeamDrive:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanMoveChildrenWithinDrive()Ljava/lang/Boolean;
    .locals 1

    .line 1928
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveChildrenWithinDrive:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanMoveChildrenWithinTeamDrive()Ljava/lang/Boolean;
    .locals 1

    .line 1946
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveChildrenWithinTeamDrive:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanMoveItemIntoTeamDrive()Ljava/lang/Boolean;
    .locals 1

    .line 1963
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveItemIntoTeamDrive:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanMoveItemOutOfDrive()Ljava/lang/Boolean;
    .locals 1

    .line 1982
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveItemOutOfDrive:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanMoveItemOutOfTeamDrive()Ljava/lang/Boolean;
    .locals 1

    .line 2001
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveItemOutOfTeamDrive:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanMoveItemWithinDrive()Ljava/lang/Boolean;
    .locals 1

    .line 2020
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveItemWithinDrive:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanMoveItemWithinTeamDrive()Ljava/lang/Boolean;
    .locals 1

    .line 2039
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveItemWithinTeamDrive:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanMoveTeamDriveItem()Ljava/lang/Boolean;
    .locals 1

    .line 2056
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveTeamDriveItem:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanReadDrive()Ljava/lang/Boolean;
    .locals 1

    .line 2074
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canReadDrive:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanReadRevisions()Ljava/lang/Boolean;
    .locals 1

    .line 2094
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canReadRevisions:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanReadTeamDrive()Ljava/lang/Boolean;
    .locals 1

    .line 2113
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canReadTeamDrive:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanRemoveChildren()Ljava/lang/Boolean;
    .locals 1

    .line 2132
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canRemoveChildren:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanRename()Ljava/lang/Boolean;
    .locals 1

    .line 2151
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canRename:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanShare()Ljava/lang/Boolean;
    .locals 1

    .line 2168
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canShare:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanTrash()Ljava/lang/Boolean;
    .locals 1

    .line 2185
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canTrash:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanTrashChildren()Ljava/lang/Boolean;
    .locals 1

    .line 2203
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canTrashChildren:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanUntrash()Ljava/lang/Boolean;
    .locals 1

    .line 2221
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canUntrash:Ljava/lang/Boolean;

    return-object v0
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/json/GenericJson;
    .locals 0

    .line 1487
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/model/File$Capabilities;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/File$Capabilities;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;
    .locals 0

    .line 1487
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/model/File$Capabilities;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/File$Capabilities;

    move-result-object p1

    return-object p1
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 2235
    invoke-super {p0, p1, p2}, Lcom/google/api/client/json/GenericJson;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/json/GenericJson;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/model/File$Capabilities;

    return-object p1
.end method

.method public setCanAddChildren(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 1723
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canAddChildren:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanChangeCopyRequiresWriterPermission(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 1740
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canChangeCopyRequiresWriterPermission:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanChangeViewersCanCopyContent(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 1757
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canChangeViewersCanCopyContent:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanComment(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 1774
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canComment:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanCopy(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 1793
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canCopy:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanDelete(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 1810
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canDelete:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanDeleteChildren(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 1829
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canDeleteChildren:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanDownload(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 1846
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canDownload:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanEdit(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 1863
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canEdit:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanListChildren(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 1882
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canListChildren:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanMoveChildrenOutOfDrive(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 1901
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveChildrenOutOfDrive:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanMoveChildrenOutOfTeamDrive(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 1918
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveChildrenOutOfTeamDrive:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanMoveChildrenWithinDrive(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 1937
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveChildrenWithinDrive:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanMoveChildrenWithinTeamDrive(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 1954
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveChildrenWithinTeamDrive:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanMoveItemIntoTeamDrive(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 1971
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveItemIntoTeamDrive:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanMoveItemOutOfDrive(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 1992
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveItemOutOfDrive:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanMoveItemOutOfTeamDrive(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 2009
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveItemOutOfTeamDrive:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanMoveItemWithinDrive(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 2030
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveItemWithinDrive:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanMoveItemWithinTeamDrive(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 2047
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveItemWithinTeamDrive:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanMoveTeamDriveItem(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 2064
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canMoveTeamDriveItem:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanReadDrive(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 2083
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canReadDrive:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanReadRevisions(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 2104
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canReadRevisions:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanReadTeamDrive(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 2121
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canReadTeamDrive:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanRemoveChildren(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 2142
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canRemoveChildren:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanRename(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 2159
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canRename:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanShare(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 2176
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canShare:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanTrash(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 2193
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canTrash:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanTrashChildren(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 2212
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canTrashChildren:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanUntrash(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 0

    .line 2229
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$Capabilities;->canUntrash:Ljava/lang/Boolean;

    return-object p0
.end method
