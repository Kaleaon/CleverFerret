.class public Lcom/google/api/services/drive/Drive$Revisions$Update;
.super Lcom/google/api/services/drive/DriveRequest;
.source "Drive.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/api/services/drive/Drive$Revisions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Update"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/api/services/drive/DriveRequest<",
        "Lcom/google/api/services/drive/model/Revision;",
        ">;"
    }
.end annotation


# static fields
.field private static final REST_PATH:Ljava/lang/String; = "files/{fileId}/revisions/{revisionId}"


# instance fields
.field private fileId:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private revisionId:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field final synthetic this$1:Lcom/google/api/services/drive/Drive$Revisions;


# direct methods
.method protected constructor <init>(Lcom/google/api/services/drive/Drive$Revisions;Ljava/lang/String;Ljava/lang/String;Lcom/google/api/services/drive/model/Revision;)V
    .locals 6

    .line 8953
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Revisions$Update;->this$1:Lcom/google/api/services/drive/Drive$Revisions;

    .line 8954
    iget-object v1, p1, Lcom/google/api/services/drive/Drive$Revisions;->this$0:Lcom/google/api/services/drive/Drive;

    const-string v3, "files/{fileId}/revisions/{revisionId}"

    const-class v5, Lcom/google/api/services/drive/model/Revision;

    const-string v2, "PATCH"

    move-object v0, p0

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/api/services/drive/DriveRequest;-><init>(Lcom/google/api/services/drive/Drive;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V

    .line 8955
    const-string p1, "Required parameter fileId must be specified."

    invoke-static {p2, p1}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, v0, Lcom/google/api/services/drive/Drive$Revisions$Update;->fileId:Ljava/lang/String;

    .line 8956
    const-string p1, "Required parameter revisionId must be specified."

    invoke-static {p3, p1}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, v0, Lcom/google/api/services/drive/Drive$Revisions$Update;->revisionId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getFileId()Ljava/lang/String;
    .locals 1

    .line 9001
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Revisions$Update;->fileId:Ljava/lang/String;

    return-object v0
.end method

.method public getRevisionId()Ljava/lang/String;
    .locals 1

    .line 9017
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Revisions$Update;->revisionId:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest;
    .locals 0

    .line 8934
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Revisions$Update;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Revisions$Update;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/googleapis/services/json/AbstractGoogleJsonClientRequest;
    .locals 0

    .line 8934
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Revisions$Update;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Revisions$Update;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;
    .locals 0

    .line 8934
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Revisions$Update;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Revisions$Update;

    move-result-object p1

    return-object p1
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Revisions$Update;
    .locals 0

    .line 9028
    invoke-super {p0, p1, p2}, Lcom/google/api/services/drive/DriveRequest;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Revisions$Update;

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 8934
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Revisions$Update;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Revisions$Update;

    move-result-object p1

    return-object p1
.end method

.method public setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Revisions$Update;
    .locals 0

    .line 8961
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Revisions$Update;

    return-object p1
.end method

.method public bridge synthetic setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 8934
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Revisions$Update;->setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Revisions$Update;

    move-result-object p1

    return-object p1
.end method

.method public setFields(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Revisions$Update;
    .locals 0

    .line 8966
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setFields(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Revisions$Update;

    return-object p1
.end method

.method public bridge synthetic setFields(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 8934
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Revisions$Update;->setFields(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Revisions$Update;

    move-result-object p1

    return-object p1
.end method

.method public setFileId(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Revisions$Update;
    .locals 0

    .line 9006
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Revisions$Update;->fileId:Ljava/lang/String;

    return-object p0
.end method

.method public setKey(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Revisions$Update;
    .locals 0

    .line 8971
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setKey(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Revisions$Update;

    return-object p1
.end method

.method public bridge synthetic setKey(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 8934
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Revisions$Update;->setKey(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Revisions$Update;

    move-result-object p1

    return-object p1
.end method

.method public setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Revisions$Update;
    .locals 0

    .line 8976
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Revisions$Update;

    return-object p1
.end method

.method public bridge synthetic setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 8934
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Revisions$Update;->setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Revisions$Update;

    move-result-object p1

    return-object p1
.end method

.method public setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Revisions$Update;
    .locals 0

    .line 8981
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Revisions$Update;

    return-object p1
.end method

.method public bridge synthetic setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 8934
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Revisions$Update;->setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Revisions$Update;

    move-result-object p1

    return-object p1
.end method

.method public setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Revisions$Update;
    .locals 0

    .line 8986
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Revisions$Update;

    return-object p1
.end method

.method public bridge synthetic setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 8934
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Revisions$Update;->setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Revisions$Update;

    move-result-object p1

    return-object p1
.end method

.method public setRevisionId(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Revisions$Update;
    .locals 0

    .line 9022
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Revisions$Update;->revisionId:Ljava/lang/String;

    return-object p0
.end method

.method public setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Revisions$Update;
    .locals 0

    .line 8991
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Revisions$Update;

    return-object p1
.end method

.method public bridge synthetic setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 8934
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Revisions$Update;->setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Revisions$Update;

    move-result-object p1

    return-object p1
.end method
