.class public final Lcom/google/api/services/drive/model/About;
.super Lcom/google/api/client/json/GenericJson;
.source "About.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/api/services/drive/model/About$TeamDriveThemes;,
        Lcom/google/api/services/drive/model/About$StorageQuota;,
        Lcom/google/api/services/drive/model/About$DriveThemes;
    }
.end annotation


# instance fields
.field private appInstalled:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canCreateDrives:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private canCreateTeamDrives:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private driveThemes:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/About$DriveThemes;",
            ">;"
        }
    .end annotation
.end field

.field private exportFormats:Ljava/util/Map;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private folderColorPalette:Ljava/util/List;
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

.field private importFormats:Ljava/util/Map;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private kind:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private maxImportSizes:Ljava/util/Map;
    .annotation runtime Lcom/google/api/client/json/JsonString;
    .end annotation

    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private maxUploadSize:Ljava/lang/Long;
    .annotation runtime Lcom/google/api/client/json/JsonString;
    .end annotation

    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private storageQuota:Lcom/google/api/services/drive/model/About$StorageQuota;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private teamDriveThemes:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/About$TeamDriveThemes;",
            ">;"
        }
    .end annotation
.end field

.field private user:Lcom/google/api/services/drive/model/User;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 67
    const-class v0, Lcom/google/api/services/drive/model/About$DriveThemes;

    invoke-static {v0}, Lcom/google/api/client/util/Data;->nullOf(Ljava/lang/Class;)Ljava/lang/Object;

    .line 129
    const-class v0, Lcom/google/api/services/drive/model/About$TeamDriveThemes;

    invoke-static {v0}, Lcom/google/api/client/util/Data;->nullOf(Ljava/lang/Class;)Ljava/lang/Object;

    return-void
.end method

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
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/About;->clone()Lcom/google/api/services/drive/model/About;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/api/client/util/GenericData;
    .locals 1

    .line 33
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/About;->clone()Lcom/google/api/services/drive/model/About;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/google/api/services/drive/model/About;
    .locals 1

    .line 367
    invoke-super {p0}, Lcom/google/api/client/json/GenericJson;->clone()Lcom/google/api/client/json/GenericJson;

    move-result-object v0

    check-cast v0, Lcom/google/api/services/drive/model/About;

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
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/About;->clone()Lcom/google/api/services/drive/model/About;

    move-result-object v0

    return-object v0
.end method

.method public getAppInstalled()Ljava/lang/Boolean;
    .locals 1

    .line 144
    iget-object v0, p0, Lcom/google/api/services/drive/model/About;->appInstalled:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanCreateDrives()Ljava/lang/Boolean;
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/google/api/services/drive/model/About;->canCreateDrives:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCanCreateTeamDrives()Ljava/lang/Boolean;
    .locals 1

    .line 178
    iget-object v0, p0, Lcom/google/api/services/drive/model/About;->canCreateTeamDrives:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getDriveThemes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/About$DriveThemes;",
            ">;"
        }
    .end annotation

    .line 195
    iget-object v0, p0, Lcom/google/api/services/drive/model/About;->driveThemes:Ljava/util/List;

    return-object v0
.end method

.method public getExportFormats()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 212
    iget-object v0, p0, Lcom/google/api/services/drive/model/About;->exportFormats:Ljava/util/Map;

    return-object v0
.end method

.method public getFolderColorPalette()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 229
    iget-object v0, p0, Lcom/google/api/services/drive/model/About;->folderColorPalette:Ljava/util/List;

    return-object v0
.end method

.method public getImportFormats()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 246
    iget-object v0, p0, Lcom/google/api/services/drive/model/About;->importFormats:Ljava/util/Map;

    return-object v0
.end method

.method public getKind()Ljava/lang/String;
    .locals 1

    .line 263
    iget-object v0, p0, Lcom/google/api/services/drive/model/About;->kind:Ljava/lang/String;

    return-object v0
.end method

.method public getMaxImportSizes()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 280
    iget-object v0, p0, Lcom/google/api/services/drive/model/About;->maxImportSizes:Ljava/util/Map;

    return-object v0
.end method

.method public getMaxUploadSize()Ljava/lang/Long;
    .locals 1

    .line 297
    iget-object v0, p0, Lcom/google/api/services/drive/model/About;->maxUploadSize:Ljava/lang/Long;

    return-object v0
.end method

.method public getStorageQuota()Lcom/google/api/services/drive/model/About$StorageQuota;
    .locals 1

    .line 314
    iget-object v0, p0, Lcom/google/api/services/drive/model/About;->storageQuota:Lcom/google/api/services/drive/model/About$StorageQuota;

    return-object v0
.end method

.method public getTeamDriveThemes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/About$TeamDriveThemes;",
            ">;"
        }
    .end annotation

    .line 331
    iget-object v0, p0, Lcom/google/api/services/drive/model/About;->teamDriveThemes:Ljava/util/List;

    return-object v0
.end method

.method public getUser()Lcom/google/api/services/drive/model/User;
    .locals 1

    .line 348
    iget-object v0, p0, Lcom/google/api/services/drive/model/About;->user:Lcom/google/api/services/drive/model/User;

    return-object v0
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/json/GenericJson;
    .locals 0

    .line 33
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/model/About;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/About;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;
    .locals 0

    .line 33
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/model/About;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/About;

    move-result-object p1

    return-object p1
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/About;
    .locals 0

    .line 362
    invoke-super {p0, p1, p2}, Lcom/google/api/client/json/GenericJson;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/json/GenericJson;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/model/About;

    return-object p1
.end method

.method public setAppInstalled(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/About;
    .locals 0

    .line 152
    iput-object p1, p0, Lcom/google/api/services/drive/model/About;->appInstalled:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanCreateDrives(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/About;
    .locals 0

    .line 169
    iput-object p1, p0, Lcom/google/api/services/drive/model/About;->canCreateDrives:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCanCreateTeamDrives(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/About;
    .locals 0

    .line 186
    iput-object p1, p0, Lcom/google/api/services/drive/model/About;->canCreateTeamDrives:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setDriveThemes(Ljava/util/List;)Lcom/google/api/services/drive/model/About;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/About$DriveThemes;",
            ">;)",
            "Lcom/google/api/services/drive/model/About;"
        }
    .end annotation

    .line 203
    iput-object p1, p0, Lcom/google/api/services/drive/model/About;->driveThemes:Ljava/util/List;

    return-object p0
.end method

.method public setExportFormats(Ljava/util/Map;)Lcom/google/api/services/drive/model/About;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lcom/google/api/services/drive/model/About;"
        }
    .end annotation

    .line 220
    iput-object p1, p0, Lcom/google/api/services/drive/model/About;->exportFormats:Ljava/util/Map;

    return-object p0
.end method

.method public setFolderColorPalette(Ljava/util/List;)Lcom/google/api/services/drive/model/About;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/api/services/drive/model/About;"
        }
    .end annotation

    .line 237
    iput-object p1, p0, Lcom/google/api/services/drive/model/About;->folderColorPalette:Ljava/util/List;

    return-object p0
.end method

.method public setImportFormats(Ljava/util/Map;)Lcom/google/api/services/drive/model/About;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lcom/google/api/services/drive/model/About;"
        }
    .end annotation

    .line 254
    iput-object p1, p0, Lcom/google/api/services/drive/model/About;->importFormats:Ljava/util/Map;

    return-object p0
.end method

.method public setKind(Ljava/lang/String;)Lcom/google/api/services/drive/model/About;
    .locals 0

    .line 271
    iput-object p1, p0, Lcom/google/api/services/drive/model/About;->kind:Ljava/lang/String;

    return-object p0
.end method

.method public setMaxImportSizes(Ljava/util/Map;)Lcom/google/api/services/drive/model/About;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;)",
            "Lcom/google/api/services/drive/model/About;"
        }
    .end annotation

    .line 288
    iput-object p1, p0, Lcom/google/api/services/drive/model/About;->maxImportSizes:Ljava/util/Map;

    return-object p0
.end method

.method public setMaxUploadSize(Ljava/lang/Long;)Lcom/google/api/services/drive/model/About;
    .locals 0

    .line 305
    iput-object p1, p0, Lcom/google/api/services/drive/model/About;->maxUploadSize:Ljava/lang/Long;

    return-object p0
.end method

.method public setStorageQuota(Lcom/google/api/services/drive/model/About$StorageQuota;)Lcom/google/api/services/drive/model/About;
    .locals 0

    .line 322
    iput-object p1, p0, Lcom/google/api/services/drive/model/About;->storageQuota:Lcom/google/api/services/drive/model/About$StorageQuota;

    return-object p0
.end method

.method public setTeamDriveThemes(Ljava/util/List;)Lcom/google/api/services/drive/model/About;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/About$TeamDriveThemes;",
            ">;)",
            "Lcom/google/api/services/drive/model/About;"
        }
    .end annotation

    .line 339
    iput-object p1, p0, Lcom/google/api/services/drive/model/About;->teamDriveThemes:Ljava/util/List;

    return-object p0
.end method

.method public setUser(Lcom/google/api/services/drive/model/User;)Lcom/google/api/services/drive/model/About;
    .locals 0

    .line 356
    iput-object p1, p0, Lcom/google/api/services/drive/model/About;->user:Lcom/google/api/services/drive/model/User;

    return-object p0
.end method
