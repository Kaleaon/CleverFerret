.class public final Lcom/google/api/services/drive/model/FileList;
.super Lcom/google/api/client/json/GenericJson;
.source "FileList.java"


# instance fields
.field private files:Ljava/util/List;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/File;",
            ">;"
        }
    .end annotation
.end field

.field private incompleteSearch:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private kind:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private nextPageToken:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 47
    const-class v0, Lcom/google/api/services/drive/model/File;

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
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/FileList;->clone()Lcom/google/api/services/drive/model/FileList;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/api/client/util/GenericData;
    .locals 1

    .line 33
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/FileList;->clone()Lcom/google/api/services/drive/model/FileList;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/google/api/services/drive/model/FileList;
    .locals 1

    .line 163
    invoke-super {p0}, Lcom/google/api/client/json/GenericJson;->clone()Lcom/google/api/client/json/GenericJson;

    move-result-object v0

    check-cast v0, Lcom/google/api/services/drive/model/FileList;

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
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/FileList;->clone()Lcom/google/api/services/drive/model/FileList;

    move-result-object v0

    return-object v0
.end method

.method public getFiles()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/File;",
            ">;"
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/google/api/services/drive/model/FileList;->files:Ljava/util/List;

    return-object v0
.end method

.method public getIncompleteSearch()Ljava/lang/Boolean;
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/google/api/services/drive/model/FileList;->incompleteSearch:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getKind()Ljava/lang/String;
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/google/api/services/drive/model/FileList;->kind:Ljava/lang/String;

    return-object v0
.end method

.method public getNextPageToken()Ljava/lang/String;
    .locals 1

    .line 142
    iget-object v0, p0, Lcom/google/api/services/drive/model/FileList;->nextPageToken:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/json/GenericJson;
    .locals 0

    .line 33
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/model/FileList;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/FileList;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;
    .locals 0

    .line 33
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/model/FileList;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/FileList;

    move-result-object p1

    return-object p1
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/FileList;
    .locals 0

    .line 158
    invoke-super {p0, p1, p2}, Lcom/google/api/client/json/GenericJson;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/json/GenericJson;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/model/FileList;

    return-object p1
.end method

.method public setFiles(Ljava/util/List;)Lcom/google/api/services/drive/model/FileList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/File;",
            ">;)",
            "Lcom/google/api/services/drive/model/FileList;"
        }
    .end annotation

    .line 91
    iput-object p1, p0, Lcom/google/api/services/drive/model/FileList;->files:Ljava/util/List;

    return-object p0
.end method

.method public setIncompleteSearch(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/FileList;
    .locals 0

    .line 114
    iput-object p1, p0, Lcom/google/api/services/drive/model/FileList;->incompleteSearch:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setKind(Ljava/lang/String;)Lcom/google/api/services/drive/model/FileList;
    .locals 0

    .line 131
    iput-object p1, p0, Lcom/google/api/services/drive/model/FileList;->kind:Ljava/lang/String;

    return-object p0
.end method

.method public setNextPageToken(Ljava/lang/String;)Lcom/google/api/services/drive/model/FileList;
    .locals 0

    .line 152
    iput-object p1, p0, Lcom/google/api/services/drive/model/FileList;->nextPageToken:Ljava/lang/String;

    return-object p0
.end method
