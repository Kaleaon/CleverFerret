.class public Lcom/google/api/services/drive/Drive$Changes$List;
.super Lcom/google/api/services/drive/DriveRequest;
.source "Drive.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/api/services/drive/Drive$Changes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "List"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/api/services/drive/DriveRequest<",
        "Lcom/google/api/services/drive/model/ChangeList;",
        ">;"
    }
.end annotation


# static fields
.field private static final REST_PATH:Ljava/lang/String; = "changes"


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
.method protected constructor <init>(Lcom/google/api/services/drive/Drive$Changes;Ljava/lang/String;)V
    .locals 6

    .line 520
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$List;->this$1:Lcom/google/api/services/drive/Drive$Changes;

    .line 521
    iget-object v1, p1, Lcom/google/api/services/drive/Drive$Changes;->this$0:Lcom/google/api/services/drive/Drive;

    const/4 v4, 0x0

    const-class v5, Lcom/google/api/services/drive/model/ChangeList;

    const-string v2, "GET"

    const-string v3, "changes"

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/api/services/drive/DriveRequest;-><init>(Lcom/google/api/services/drive/Drive;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V

    .line 522
    const-string p1, "Required parameter pageToken must be specified."

    invoke-static {p2, p1}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, v0, Lcom/google/api/services/drive/Drive$Changes$List;->pageToken:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public buildHttpRequestUsingHead()Lcom/google/api/client/http/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 532
    invoke-super {p0}, Lcom/google/api/services/drive/DriveRequest;->buildHttpRequestUsingHead()Lcom/google/api/client/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public executeUsingHead()Lcom/google/api/client/http/HttpResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 527
    invoke-super {p0}, Lcom/google/api/services/drive/DriveRequest;->executeUsingHead()Lcom/google/api/client/http/HttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public getDriveId()Ljava/lang/String;
    .locals 1

    .line 606
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->driveId:Ljava/lang/String;

    return-object v0
.end method

.method public getIncludeCorpusRemovals()Ljava/lang/Boolean;
    .locals 1

    .line 631
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->includeCorpusRemovals:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getIncludeItemsFromAllDrives()Ljava/lang/Boolean;
    .locals 1

    .line 686
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->includeItemsFromAllDrives:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getIncludeRemoved()Ljava/lang/Boolean;
    .locals 1

    .line 739
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->includeRemoved:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getIncludeTeamDriveItems()Ljava/lang/Boolean;
    .locals 1

    .line 786
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->includeTeamDriveItems:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getPageSize()Ljava/lang/Integer;
    .locals 1

    .line 829
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->pageSize:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPageToken()Ljava/lang/String;
    .locals 1

    .line 582
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->pageToken:Ljava/lang/String;

    return-object v0
.end method

.method public getRestrictToMyDrive()Ljava/lang/Boolean;
    .locals 1

    .line 851
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->restrictToMyDrive:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getSpaces()Ljava/lang/String;
    .locals 1

    .line 904
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->spaces:Ljava/lang/String;

    return-object v0
.end method

.method public getSupportsAllDrives()Ljava/lang/Boolean;
    .locals 1

    .line 929
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->supportsAllDrives:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getSupportsTeamDrives()Ljava/lang/Boolean;
    .locals 1

    .line 978
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->supportsTeamDrives:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getTeamDriveId()Ljava/lang/String;
    .locals 1

    .line 1021
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->teamDriveId:Ljava/lang/String;

    return-object v0
.end method

.method public isIncludeCorpusRemovals()Z
    .locals 2

    .line 667
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->includeCorpusRemovals:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 670
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->includeCorpusRemovals:Ljava/lang/Boolean;

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

    .line 722
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->includeItemsFromAllDrives:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 725
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->includeItemsFromAllDrives:Ljava/lang/Boolean;

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

    .line 773
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->includeRemoved:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 776
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->includeRemoved:Ljava/lang/Boolean;

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

    .line 816
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->includeTeamDriveItems:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 819
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->includeTeamDriveItems:Ljava/lang/Boolean;

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

    .line 887
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->restrictToMyDrive:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 890
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->restrictToMyDrive:Ljava/lang/Boolean;

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

    .line 965
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->supportsAllDrives:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 968
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->supportsAllDrives:Ljava/lang/Boolean;

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

    .line 1008
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->supportsTeamDrives:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 1011
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Changes$List;->supportsTeamDrives:Ljava/lang/Boolean;

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

    .line 501
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Changes$List;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Changes$List;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/googleapis/services/json/AbstractGoogleJsonClientRequest;
    .locals 0

    .line 501
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Changes$List;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Changes$List;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;
    .locals 0

    .line 501
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Changes$List;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Changes$List;

    move-result-object p1

    return-object p1
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 1032
    invoke-super {p0, p1, p2}, Lcom/google/api/services/drive/DriveRequest;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Changes$List;

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 501
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Changes$List;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Changes$List;

    move-result-object p1

    return-object p1
.end method

.method public setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 537
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Changes$List;

    return-object p1
.end method

.method public bridge synthetic setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 501
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Changes$List;->setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$List;

    move-result-object p1

    return-object p1
.end method

.method public setDriveId(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 614
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$List;->driveId:Ljava/lang/String;

    return-object p0
.end method

.method public setFields(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 542
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setFields(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Changes$List;

    return-object p1
.end method

.method public bridge synthetic setFields(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 501
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Changes$List;->setFields(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$List;

    move-result-object p1

    return-object p1
.end method

.method public setIncludeCorpusRemovals(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 640
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$List;->includeCorpusRemovals:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setIncludeItemsFromAllDrives(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 695
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$List;->includeItemsFromAllDrives:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setIncludeRemoved(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 747
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$List;->includeRemoved:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setIncludeTeamDriveItems(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 791
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$List;->includeTeamDriveItems:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setKey(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 547
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setKey(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Changes$List;

    return-object p1
.end method

.method public bridge synthetic setKey(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 501
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Changes$List;->setKey(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$List;

    move-result-object p1

    return-object p1
.end method

.method public setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 552
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Changes$List;

    return-object p1
.end method

.method public bridge synthetic setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 501
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Changes$List;->setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$List;

    move-result-object p1

    return-object p1
.end method

.method public setPageSize(Ljava/lang/Integer;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 834
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$List;->pageSize:Ljava/lang/Integer;

    return-object p0
.end method

.method public setPageToken(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 591
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$List;->pageToken:Ljava/lang/String;

    return-object p0
.end method

.method public setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 557
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Changes$List;

    return-object p1
.end method

.method public bridge synthetic setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 501
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Changes$List;->setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Changes$List;

    move-result-object p1

    return-object p1
.end method

.method public setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 562
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Changes$List;

    return-object p1
.end method

.method public bridge synthetic setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 501
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Changes$List;->setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$List;

    move-result-object p1

    return-object p1
.end method

.method public setRestrictToMyDrive(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 860
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$List;->restrictToMyDrive:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setSpaces(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 912
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$List;->spaces:Ljava/lang/String;

    return-object p0
.end method

.method public setSupportsAllDrives(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 938
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$List;->supportsAllDrives:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setSupportsTeamDrives(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 983
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$List;->supportsTeamDrives:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setTeamDriveId(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 1026
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Changes$List;->teamDriveId:Ljava/lang/String;

    return-object p0
.end method

.method public setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$List;
    .locals 0

    .line 567
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Changes$List;

    return-object p1
.end method

.method public bridge synthetic setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 501
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Changes$List;->setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Changes$List;

    move-result-object p1

    return-object p1
.end method
