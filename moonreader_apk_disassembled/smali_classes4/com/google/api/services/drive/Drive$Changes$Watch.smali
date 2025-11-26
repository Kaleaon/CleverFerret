.class public Lcom/google/api/services/drive/Drive$Changes$Watch;
.super Lcom/google/api/services/drive/DriveRequest;
.source "Drive.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/api/services/drive/Drive$Changes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Watch"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/api/services/drive/DriveRequest<",
        "Lcom/google/api/services/drive/model/Channel;",
        ">;"
    }
.end annotation


# static fields
.field private static final REST_PATH:Ljava/lang/String; = "changes/watch"


# instance fields
.field private driveId:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private includeCorpusRemovals:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private includeItemsFromAllDrives:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private includeRemoved:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private includeTeamDriveItems:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private pageSize:Ljava/lang/Integer;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private pageToken:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private restrictToMyDrive:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private spaces:Ljava/lang/String;
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

.field private teamDriveId:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field final synthetic this$1:Lcom/google/api/services/drive/Drive$Changes;


# direct methods
.method protected constructor <init>(Lcom/google/api/services/drive/Drive$Changes;Ljava/lang/String;Lcom/google/api/services/drive/model/Channel;)V
    .locals 6

    .line 1075
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->this$1:Lcom/google/api/services/drive/Drive$Changes;

    .line 1076
    iget-object v1, p1, Lcom/google/api/services/drive/Drive$Changes;->this$0:Lcom/google/api/services/drive/Drive;

    const-string v3, "changes/watch"

    const-class v5, Lcom/google/api/services/drive/model/Channel;

    const-string v2, "POST"

    move-object v0, p0

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/api/services/drive/DriveRequest;-><init>(Lcom/google/api/services/drive/Drive;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V

    .line 1077
    const-string p1, "Required parameter pageToken must be specified."

    invoke-static {p2, p1}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, v0, Lcom/google/api/services/drive/Drive$Changes$Watch;->pageToken:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getDriveId()Ljava/lang/String;
    .locals 1

    .line 1151
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->driveId:Ljava/lang/String;

    return-object v0
.end method

.method public getIncludeCorpusRemovals()Ljava/lang/Boolean;
    .locals 1

    .line 1176
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->includeCorpusRemovals:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getIncludeItemsFromAllDrives()Ljava/lang/Boolean;
    .locals 1

    .line 1231
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->includeItemsFromAllDrives:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getIncludeRemoved()Ljava/lang/Boolean;
    .locals 1

    .line 1284
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->includeRemoved:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getIncludeTeamDriveItems()Ljava/lang/Boolean;
    .locals 1

    .line 1331
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->includeTeamDriveItems:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getPageSize()Ljava/lang/Integer;
    .locals 1

    .line 1374
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->pageSize:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPageToken()Ljava/lang/String;
    .locals 1

    .line 1127
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->pageToken:Ljava/lang/String;

    return-object v0
.end method

.method public getRestrictToMyDrive()Ljava/lang/Boolean;
    .locals 1

    .line 1396
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->restrictToMyDrive:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getSpaces()Ljava/lang/String;
    .locals 1

    .line 1449
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->spaces:Ljava/lang/String;

    return-object v0
.end method

.method public getSupportsAllDrives()Ljava/lang/Boolean;
    .locals 1

    .line 1474
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->supportsAllDrives:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getSupportsTeamDrives()Ljava/lang/Boolean;
    .locals 1

    .line 1523
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->supportsTeamDrives:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getTeamDriveId()Ljava/lang/String;
    .locals 1

    .line 1566
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->teamDriveId:Ljava/lang/String;

    return-object v0
.end method

.method public isIncludeCorpusRemovals()Z
    .locals 2

    .line 1212
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->includeCorpusRemovals:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 1215
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->includeCorpusRemovals:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public isIncludeItemsFromAllDrives()Z
    .locals 2

    .line 1267
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->includeItemsFromAllDrives:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 1270
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->includeItemsFromAllDrives:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public isIncludeRemoved()Z
    .locals 2

    .line 1318
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->includeRemoved:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 1321
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->includeRemoved:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method public isIncludeTeamDriveItems()Z
    .locals 2

    .line 1361
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->includeTeamDriveItems:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 1364
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->includeTeamDriveItems:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRestrictToMyDrive()Z
    .locals 2

    .line 1432
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->restrictToMyDrive:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 1435
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->restrictToMyDrive:Ljava/lang/Boolean;

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

    .line 1510
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->supportsAllDrives:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 1513
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->supportsAllDrives:Ljava/lang/Boolean;

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

    .line 1553
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->supportsTeamDrives:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 1556
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->supportsTeamDrives:Ljava/lang/Boolean;

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

    .line 1055
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Changes$Watch;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Changes$Watch;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/googleapis/services/json/AbstractGoogleJsonClientRequest;
    .locals 0

    .line 1055
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Changes$Watch;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Changes$Watch;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;
    .locals 0

    .line 1055
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Changes$Watch;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Changes$Watch;

    move-result-object p1

    return-object p1
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1577
    invoke-super {p0, p1, p2}, Lcom/google/api/services/drive/DriveRequest;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Changes$Watch;

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 1055
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Changes$Watch;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Changes$Watch;

    move-result-object p1

    return-object p1
.end method

.method public setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1082
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Changes$Watch;

    return-object p1
.end method

.method public bridge synthetic setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 1055
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Changes$Watch;->setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$Watch;

    move-result-object p1

    return-object p1
.end method

.method public setDriveId(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1159
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->driveId:Ljava/lang/String;

    return-object p0
.end method

.method public setFields(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1087
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setFields(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Changes$Watch;

    return-object p1
.end method

.method public bridge synthetic setFields(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 1055
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Changes$Watch;->setFields(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$Watch;

    move-result-object p1

    return-object p1
.end method

.method public setIncludeCorpusRemovals(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1185
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->includeCorpusRemovals:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setIncludeItemsFromAllDrives(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1240
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->includeItemsFromAllDrives:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setIncludeRemoved(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1292
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->includeRemoved:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setIncludeTeamDriveItems(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1336
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->includeTeamDriveItems:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setKey(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1092
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setKey(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Changes$Watch;

    return-object p1
.end method

.method public bridge synthetic setKey(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 1055
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Changes$Watch;->setKey(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$Watch;

    move-result-object p1

    return-object p1
.end method

.method public setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1097
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Changes$Watch;

    return-object p1
.end method

.method public bridge synthetic setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 1055
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Changes$Watch;->setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$Watch;

    move-result-object p1

    return-object p1
.end method

.method public setPageSize(Ljava/lang/Integer;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1379
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->pageSize:Ljava/lang/Integer;

    return-object p0
.end method

.method public setPageToken(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1136
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->pageToken:Ljava/lang/String;

    return-object p0
.end method

.method public setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1102
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Changes$Watch;

    return-object p1
.end method

.method public bridge synthetic setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 1055
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Changes$Watch;->setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Changes$Watch;

    move-result-object p1

    return-object p1
.end method

.method public setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1107
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Changes$Watch;

    return-object p1
.end method

.method public bridge synthetic setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 1055
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Changes$Watch;->setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$Watch;

    move-result-object p1

    return-object p1
.end method

.method public setRestrictToMyDrive(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1405
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->restrictToMyDrive:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setSpaces(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1457
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->spaces:Ljava/lang/String;

    return-object p0
.end method

.method public setSupportsAllDrives(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1483
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->supportsAllDrives:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setSupportsTeamDrives(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1528
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->supportsTeamDrives:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setTeamDriveId(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1571
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$Watch;->teamDriveId:Ljava/lang/String;

    return-object p0
.end method

.method public setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$Watch;
    .locals 0

    .line 1112
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Changes$Watch;

    return-object p1
.end method

.method public bridge synthetic setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 1055
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Changes$Watch;->setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$Watch;

    move-result-object p1

    return-object p1
.end method
