.class public final Lcom/google/api/services/drive/model/File;
.super Lcom/google/api/client/json/GenericJson;
.source "File.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/api/services/drive/model/File$VideoMediaMetadata;,
        Lcom/google/api/services/drive/model/File$ImageMediaMetadata;,
        Lcom/google/api/services/drive/model/File$ContentHints;,
        Lcom/google/api/services/drive/model/File$Capabilities;
    }
.end annotation


# instance fields
.field private appProperties:Ljava/util/Map;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private capabilities:Lcom/google/api/services/drive/model/File$Capabilities;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private contentHints:Lcom/google/api/services/drive/model/File$ContentHints;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private copyRequiresWriterPermission:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private createdTime:Lcom/google/api/client/util/DateTime;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private description:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private driveId:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private explicitlyTrashed:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private exportLinks:Ljava/util/Map;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private fileExtension:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private folderColorRgb:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private fullFileExtension:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private hasAugmentedPermissions:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private hasThumbnail:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private headRevisionId:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private iconLink:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private id:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private imageMediaMetadata:Lcom/google/api/services/drive/model/File$ImageMediaMetadata;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private isAppAuthorized:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private kind:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private lastModifyingUser:Lcom/google/api/services/drive/model/User;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private md5Checksum:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private mimeType:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private modifiedByMe:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private modifiedByMeTime:Lcom/google/api/client/util/DateTime;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private modifiedTime:Lcom/google/api/client/util/DateTime;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private name:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private originalFilename:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private ownedByMe:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private owners:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/User;",
            ">;"
        }
    .end annotation
.end field

.field private parents:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private permissionIds:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private permissions:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/Permission;",
            ">;"
        }
    .end annotation
.end field

.field private properties:Ljava/util/Map;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private quotaBytesUsed:Ljava/lang/Long;
    .annotation runtime Lcom/google/api/client/json/JsonString;
    .end annotation

    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private shared:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private sharedWithMeTime:Lcom/google/api/client/util/DateTime;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private sharingUser:Lcom/google/api/services/drive/model/User;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private size:Ljava/lang/Long;
    .annotation runtime Lcom/google/api/client/json/JsonString;
    .end annotation

    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private spaces:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private starred:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private teamDriveId:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private thumbnailLink:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private thumbnailVersion:Ljava/lang/Long;
    .annotation runtime Lcom/google/api/client/json/JsonString;
    .end annotation

    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private trashed:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private trashedTime:Lcom/google/api/client/util/DateTime;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private trashingUser:Lcom/google/api/services/drive/model/User;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private version:Ljava/lang/Long;
    .annotation runtime Lcom/google/api/client/json/JsonString;
    .end annotation

    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private videoMediaMetadata:Lcom/google/api/services/drive/model/File$VideoMediaMetadata;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private viewedByMe:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private viewedByMeTime:Lcom/google/api/client/util/DateTime;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private viewersCanCopyContent:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private webContentLink:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private webViewLink:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private writersCanShare:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/google/api/client/json/GenericJson;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/api/client/json/GenericJson;
    .locals 1

    .line 33
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/File;->clone()Lcom/google/api/services/drive/model/File;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/api/client/util/GenericData;
    .locals 1

    .line 33
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/File;->clone()Lcom/google/api/services/drive/model/File;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/google/api/services/drive/model/File;
    .locals 1

    .line 1480
    invoke-super {p0}, Lcom/google/api/client/json/GenericJson;->clone()Lcom/google/api/client/json/GenericJson;

    move-result-object v0

    check-cast v0, Lcom/google/api/services/drive/model/File;

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 33
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/File;->clone()Lcom/google/api/services/drive/model/File;

    move-result-object v0

    return-object v0
.end method

.method public getAppProperties()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 466
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->appProperties:Ljava/util/Map;

    return-object v0
.end method

.method public getCapabilities()Lcom/google/api/services/drive/model/File$Capabilities;
    .locals 1

    .line 485
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->capabilities:Lcom/google/api/services/drive/model/File$Capabilities;

    return-object v0
.end method

.method public getContentHints()Lcom/google/api/services/drive/model/File$ContentHints;
    .locals 1

    .line 504
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->contentHints:Lcom/google/api/services/drive/model/File$ContentHints;

    return-object v0
.end method

.method public getCopyRequiresWriterPermission()Ljava/lang/Boolean;
    .locals 1

    .line 523
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->copyRequiresWriterPermission:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCreatedTime()Lcom/google/api/client/util/DateTime;
    .locals 1

    .line 541
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->createdTime:Lcom/google/api/client/util/DateTime;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .line 558
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getDriveId()Ljava/lang/String;
    .locals 1

    .line 575
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->driveId:Ljava/lang/String;

    return-object v0
.end method

.method public getExplicitlyTrashed()Ljava/lang/Boolean;
    .locals 1

    .line 593
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->explicitlyTrashed:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getExportLinks()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 611
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->exportLinks:Ljava/util/Map;

    return-object v0
.end method

.method public getFileExtension()Ljava/lang/String;
    .locals 1

    .line 629
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->fileExtension:Ljava/lang/String;

    return-object v0
.end method

.method public getFolderColorRgb()Ljava/lang/String;
    .locals 1

    .line 649
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->folderColorRgb:Ljava/lang/String;

    return-object v0
.end method

.method public getFullFileExtension()Ljava/lang/String;
    .locals 1

    .line 671
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->fullFileExtension:Ljava/lang/String;

    return-object v0
.end method

.method public getHasAugmentedPermissions()Ljava/lang/Boolean;
    .locals 1

    .line 692
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->hasAugmentedPermissions:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getHasThumbnail()Ljava/lang/Boolean;
    .locals 1

    .line 711
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->hasThumbnail:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getHeadRevisionId()Ljava/lang/String;
    .locals 1

    .line 730
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->headRevisionId:Ljava/lang/String;

    return-object v0
.end method

.method public getIconLink()Ljava/lang/String;
    .locals 1

    .line 748
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->iconLink:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 765
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getImageMediaMetadata()Lcom/google/api/services/drive/model/File$ImageMediaMetadata;
    .locals 1

    .line 782
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->imageMediaMetadata:Lcom/google/api/services/drive/model/File$ImageMediaMetadata;

    return-object v0
.end method

.method public getIsAppAuthorized()Ljava/lang/Boolean;
    .locals 1

    .line 799
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->isAppAuthorized:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getKind()Ljava/lang/String;
    .locals 1

    .line 816
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->kind:Ljava/lang/String;

    return-object v0
.end method

.method public getLastModifyingUser()Lcom/google/api/services/drive/model/User;
    .locals 1

    .line 833
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->lastModifyingUser:Lcom/google/api/services/drive/model/User;

    return-object v0
.end method

.method public getMd5Checksum()Ljava/lang/String;
    .locals 1

    .line 851
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->md5Checksum:Ljava/lang/String;

    return-object v0
.end method

.method public getMimeType()Ljava/lang/String;
    .locals 1

    .line 872
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->mimeType:Ljava/lang/String;

    return-object v0
.end method

.method public getModifiedByMe()Ljava/lang/Boolean;
    .locals 1

    .line 892
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->modifiedByMe:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getModifiedByMeTime()Lcom/google/api/client/util/DateTime;
    .locals 1

    .line 909
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->modifiedByMeTime:Lcom/google/api/client/util/DateTime;

    return-object v0
.end method

.method public getModifiedTime()Lcom/google/api/client/util/DateTime;
    .locals 1

    .line 927
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->modifiedTime:Lcom/google/api/client/util/DateTime;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 947
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getOriginalFilename()Ljava/lang/String;
    .locals 1

    .line 967
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->originalFilename:Ljava/lang/String;

    return-object v0
.end method

.method public getOwnedByMe()Ljava/lang/Boolean;
    .locals 1

    .line 985
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->ownedByMe:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getOwners()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/User;",
            ">;"
        }
    .end annotation

    .line 1003
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->owners:Ljava/util/List;

    return-object v0
.end method

.method public getParents()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1025
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->parents:Ljava/util/List;

    return-object v0
.end method

.method public getPermissionIds()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1046
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->permissionIds:Ljava/util/List;

    return-object v0
.end method

.method public getPermissions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/Permission;",
            ">;"
        }
    .end annotation

    .line 1064
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->permissions:Ljava/util/List;

    return-object v0
.end method

.method public getProperties()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1083
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->properties:Ljava/util/Map;

    return-object v0
.end method

.method public getQuotaBytesUsed()Ljava/lang/Long;
    .locals 1

    .line 1102
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->quotaBytesUsed:Ljava/lang/Long;

    return-object v0
.end method

.method public getShared()Ljava/lang/Boolean;
    .locals 1

    .line 1120
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->shared:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getSharedWithMeTime()Lcom/google/api/client/util/DateTime;
    .locals 1

    .line 1137
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->sharedWithMeTime:Lcom/google/api/client/util/DateTime;

    return-object v0
.end method

.method public getSharingUser()Lcom/google/api/services/drive/model/User;
    .locals 1

    .line 1154
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->sharingUser:Lcom/google/api/services/drive/model/User;

    return-object v0
.end method

.method public getSize()Ljava/lang/Long;
    .locals 1

    .line 1172
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->size:Ljava/lang/Long;

    return-object v0
.end method

.method public getSpaces()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1191
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->spaces:Ljava/util/List;

    return-object v0
.end method

.method public getStarred()Ljava/lang/Boolean;
    .locals 1

    .line 1209
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->starred:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getTeamDriveId()Ljava/lang/String;
    .locals 1

    .line 1226
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->teamDriveId:Ljava/lang/String;

    return-object v0
.end method

.method public getThumbnailLink()Ljava/lang/String;
    .locals 1

    .line 1244
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->thumbnailLink:Ljava/lang/String;

    return-object v0
.end method

.method public getThumbnailVersion()Ljava/lang/Long;
    .locals 1

    .line 1262
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->thumbnailVersion:Ljava/lang/Long;

    return-object v0
.end method

.method public getTrashed()Ljava/lang/Boolean;
    .locals 1

    .line 1280
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->trashed:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getTrashedTime()Lcom/google/api/client/util/DateTime;
    .locals 1

    .line 1299
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->trashedTime:Lcom/google/api/client/util/DateTime;

    return-object v0
.end method

.method public getTrashingUser()Lcom/google/api/services/drive/model/User;
    .locals 1

    .line 1318
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->trashingUser:Lcom/google/api/services/drive/model/User;

    return-object v0
.end method

.method public getVersion()Ljava/lang/Long;
    .locals 1

    .line 1337
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->version:Ljava/lang/Long;

    return-object v0
.end method

.method public getVideoMediaMetadata()Lcom/google/api/services/drive/model/File$VideoMediaMetadata;
    .locals 1

    .line 1355
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->videoMediaMetadata:Lcom/google/api/services/drive/model/File$VideoMediaMetadata;

    return-object v0
.end method

.method public getViewedByMe()Ljava/lang/Boolean;
    .locals 1

    .line 1372
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->viewedByMe:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getViewedByMeTime()Lcom/google/api/client/util/DateTime;
    .locals 1

    .line 1389
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->viewedByMeTime:Lcom/google/api/client/util/DateTime;

    return-object v0
.end method

.method public getViewersCanCopyContent()Ljava/lang/Boolean;
    .locals 1

    .line 1406
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->viewersCanCopyContent:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getWebContentLink()Ljava/lang/String;
    .locals 1

    .line 1424
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->webContentLink:Ljava/lang/String;

    return-object v0
.end method

.method public getWebViewLink()Ljava/lang/String;
    .locals 1

    .line 1442
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->webViewLink:Ljava/lang/String;

    return-object v0
.end method

.method public getWritersCanShare()Ljava/lang/Boolean;
    .locals 1

    .line 1460
    iget-object v0, p0, Lcom/google/api/services/drive/model/File;->writersCanShare:Ljava/lang/Boolean;

    return-object v0
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/json/GenericJson;
    .locals 0

    .line 33
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/model/File;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/File;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;
    .locals 0

    .line 33
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/model/File;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/File;

    move-result-object p1

    return-object p1
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1475
    invoke-super {p0, p1, p2}, Lcom/google/api/client/json/GenericJson;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/json/GenericJson;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/model/File;

    return-object p1
.end method

.method public setAppProperties(Ljava/util/Map;)Lcom/google/api/services/drive/model/File;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/api/services/drive/model/File;"
        }
    .end annotation

    .line 475
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->appProperties:Ljava/util/Map;

    return-object p0
.end method

.method public setCapabilities(Lcom/google/api/services/drive/model/File$Capabilities;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 494
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->capabilities:Lcom/google/api/services/drive/model/File$Capabilities;

    return-object p0
.end method

.method public setContentHints(Lcom/google/api/services/drive/model/File$ContentHints;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 513
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->contentHints:Lcom/google/api/services/drive/model/File$ContentHints;

    return-object p0
.end method

.method public setCopyRequiresWriterPermission(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 532
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->copyRequiresWriterPermission:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCreatedTime(Lcom/google/api/client/util/DateTime;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 549
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->createdTime:Lcom/google/api/client/util/DateTime;

    return-object p0
.end method

.method public setDescription(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 566
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->description:Ljava/lang/String;

    return-object p0
.end method

.method public setDriveId(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 583
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->driveId:Ljava/lang/String;

    return-object p0
.end method

.method public setExplicitlyTrashed(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 602
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->explicitlyTrashed:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setExportLinks(Ljava/util/Map;)Lcom/google/api/services/drive/model/File;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/api/services/drive/model/File;"
        }
    .end annotation

    .line 619
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->exportLinks:Ljava/util/Map;

    return-object p0
.end method

.method public setFileExtension(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 638
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->fileExtension:Ljava/lang/String;

    return-object p0
.end method

.method public setFolderColorRgb(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 659
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->folderColorRgb:Ljava/lang/String;

    return-object p0
.end method

.method public setFullFileExtension(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 682
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->fullFileExtension:Ljava/lang/String;

    return-object p0
.end method

.method public setHasAugmentedPermissions(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 701
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->hasAugmentedPermissions:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setHasThumbnail(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 720
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->hasThumbnail:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setHeadRevisionId(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 739
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->headRevisionId:Ljava/lang/String;

    return-object p0
.end method

.method public setIconLink(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 756
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->iconLink:Ljava/lang/String;

    return-object p0
.end method

.method public setId(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 773
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->id:Ljava/lang/String;

    return-object p0
.end method

.method public setImageMediaMetadata(Lcom/google/api/services/drive/model/File$ImageMediaMetadata;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 790
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->imageMediaMetadata:Lcom/google/api/services/drive/model/File$ImageMediaMetadata;

    return-object p0
.end method

.method public setIsAppAuthorized(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 807
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->isAppAuthorized:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setKind(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 824
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->kind:Ljava/lang/String;

    return-object p0
.end method

.method public setLastModifyingUser(Lcom/google/api/services/drive/model/User;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 841
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->lastModifyingUser:Lcom/google/api/services/drive/model/User;

    return-object p0
.end method

.method public setMd5Checksum(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 860
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->md5Checksum:Ljava/lang/String;

    return-object p0
.end method

.method public setMimeType(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 883
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->mimeType:Ljava/lang/String;

    return-object p0
.end method

.method public setModifiedByMe(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 900
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->modifiedByMe:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setModifiedByMeTime(Lcom/google/api/client/util/DateTime;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 917
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->modifiedByMeTime:Lcom/google/api/client/util/DateTime;

    return-object p0
.end method

.method public setModifiedTime(Lcom/google/api/client/util/DateTime;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 936
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->modifiedTime:Lcom/google/api/client/util/DateTime;

    return-object p0
.end method

.method public setName(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 957
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->name:Ljava/lang/String;

    return-object p0
.end method

.method public setOriginalFilename(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 976
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->originalFilename:Ljava/lang/String;

    return-object p0
.end method

.method public setOwnedByMe(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 993
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->ownedByMe:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setOwners(Ljava/util/List;)Lcom/google/api/services/drive/model/File;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/User;",
            ">;)",
            "Lcom/google/api/services/drive/model/File;"
        }
    .end annotation

    .line 1012
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->owners:Ljava/util/List;

    return-object p0
.end method

.method public setParents(Ljava/util/List;)Lcom/google/api/services/drive/model/File;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/api/services/drive/model/File;"
        }
    .end annotation

    .line 1037
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->parents:Ljava/util/List;

    return-object p0
.end method

.method public setPermissionIds(Ljava/util/List;)Lcom/google/api/services/drive/model/File;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/api/services/drive/model/File;"
        }
    .end annotation

    .line 1054
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->permissionIds:Ljava/util/List;

    return-object p0
.end method

.method public setPermissions(Ljava/util/List;)Lcom/google/api/services/drive/model/File;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/Permission;",
            ">;)",
            "Lcom/google/api/services/drive/model/File;"
        }
    .end annotation

    .line 1073
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->permissions:Ljava/util/List;

    return-object p0
.end method

.method public setProperties(Ljava/util/Map;)Lcom/google/api/services/drive/model/File;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/api/services/drive/model/File;"
        }
    .end annotation

    .line 1092
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->properties:Ljava/util/Map;

    return-object p0
.end method

.method public setQuotaBytesUsed(Ljava/lang/Long;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1111
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->quotaBytesUsed:Ljava/lang/Long;

    return-object p0
.end method

.method public setShared(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1128
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->shared:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setSharedWithMeTime(Lcom/google/api/client/util/DateTime;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1145
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->sharedWithMeTime:Lcom/google/api/client/util/DateTime;

    return-object p0
.end method

.method public setSharingUser(Lcom/google/api/services/drive/model/User;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1162
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->sharingUser:Lcom/google/api/services/drive/model/User;

    return-object p0
.end method

.method public setSize(Ljava/lang/Long;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1181
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->size:Ljava/lang/Long;

    return-object p0
.end method

.method public setSpaces(Ljava/util/List;)Lcom/google/api/services/drive/model/File;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/api/services/drive/model/File;"
        }
    .end annotation

    .line 1200
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->spaces:Ljava/util/List;

    return-object p0
.end method

.method public setStarred(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1217
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->starred:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setTeamDriveId(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1234
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->teamDriveId:Ljava/lang/String;

    return-object p0
.end method

.method public setThumbnailLink(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1253
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->thumbnailLink:Ljava/lang/String;

    return-object p0
.end method

.method public setThumbnailVersion(Ljava/lang/Long;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1270
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->thumbnailVersion:Ljava/lang/Long;

    return-object p0
.end method

.method public setTrashed(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1289
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->trashed:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setTrashedTime(Lcom/google/api/client/util/DateTime;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1308
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->trashedTime:Lcom/google/api/client/util/DateTime;

    return-object p0
.end method

.method public setTrashingUser(Lcom/google/api/services/drive/model/User;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1327
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->trashingUser:Lcom/google/api/services/drive/model/User;

    return-object p0
.end method

.method public setVersion(Ljava/lang/Long;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1346
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->version:Ljava/lang/Long;

    return-object p0
.end method

.method public setVideoMediaMetadata(Lcom/google/api/services/drive/model/File$VideoMediaMetadata;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1363
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->videoMediaMetadata:Lcom/google/api/services/drive/model/File$VideoMediaMetadata;

    return-object p0
.end method

.method public setViewedByMe(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1380
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->viewedByMe:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setViewedByMeTime(Lcom/google/api/client/util/DateTime;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1397
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->viewedByMeTime:Lcom/google/api/client/util/DateTime;

    return-object p0
.end method

.method public setViewersCanCopyContent(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1414
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->viewersCanCopyContent:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setWebContentLink(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1433
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->webContentLink:Ljava/lang/String;

    return-object p0
.end method

.method public setWebViewLink(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1450
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->webViewLink:Ljava/lang/String;

    return-object p0
.end method

.method public setWritersCanShare(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/File;
    .locals 0

    .line 1469
    iput-object p1, p0, Lcom/google/api/services/drive/model/File;->writersCanShare:Ljava/lang/Boolean;

    return-object p0
.end method
