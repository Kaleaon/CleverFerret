.class public final Lcom/google/api/services/drive/model/RevisionList;
.super Lcom/google/api/client/json/GenericJson;
.source "RevisionList.java"


# instance fields
.field private kind:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private nextPageToken:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private revisions:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/Revision;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 63
    const-class v0, Lcom/google/api/services/drive/model/Revision;

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
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/RevisionList;->clone()Lcom/google/api/services/drive/model/RevisionList;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/api/client/util/GenericData;
    .locals 1

    .line 33
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/RevisionList;->clone()Lcom/google/api/services/drive/model/RevisionList;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/google/api/services/drive/model/RevisionList;
    .locals 1

    .line 130
    invoke-super {p0}, Lcom/google/api/client/json/GenericJson;->clone()Lcom/google/api/client/json/GenericJson;

    move-result-object v0

    check-cast v0, Lcom/google/api/services/drive/model/RevisionList;

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
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/RevisionList;->clone()Lcom/google/api/services/drive/model/RevisionList;

    move-result-object v0

    return-object v0
.end method

.method public getKind()Ljava/lang/String;
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/google/api/services/drive/model/RevisionList;->kind:Ljava/lang/String;

    return-object v0
.end method

.method public getNextPageToken()Ljava/lang/String;
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/google/api/services/drive/model/RevisionList;->nextPageToken:Ljava/lang/String;

    return-object v0
.end method

.method public getRevisions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/Revision;",
            ">;"
        }
    .end annotation

    .line 110
    iget-object v0, p0, Lcom/google/api/services/drive/model/RevisionList;->revisions:Ljava/util/List;

    return-object v0
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/json/GenericJson;
    .locals 0

    .line 33
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/model/RevisionList;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/RevisionList;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;
    .locals 0

    .line 33
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/model/RevisionList;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/RevisionList;

    move-result-object p1

    return-object p1
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/RevisionList;
    .locals 0

    .line 125
    invoke-super {p0, p1, p2}, Lcom/google/api/client/json/GenericJson;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/json/GenericJson;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/model/RevisionList;

    return-object p1
.end method

.method public setKind(Ljava/lang/String;)Lcom/google/api/services/drive/model/RevisionList;
    .locals 0

    .line 79
    iput-object p1, p0, Lcom/google/api/services/drive/model/RevisionList;->kind:Ljava/lang/String;

    return-object p0
.end method

.method public setNextPageToken(Ljava/lang/String;)Lcom/google/api/services/drive/model/RevisionList;
    .locals 0

    .line 100
    iput-object p1, p0, Lcom/google/api/services/drive/model/RevisionList;->nextPageToken:Ljava/lang/String;

    return-object p0
.end method

.method public setRevisions(Ljava/util/List;)Lcom/google/api/services/drive/model/RevisionList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/Revision;",
            ">;)",
            "Lcom/google/api/services/drive/model/RevisionList;"
        }
    .end annotation

    .line 119
    iput-object p1, p0, Lcom/google/api/services/drive/model/RevisionList;->revisions:Ljava/util/List;

    return-object p0
.end method
