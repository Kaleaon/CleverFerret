.class public final Lcom/google/api/services/drive/model/File$ContentHints;
.super Lcom/google/api/client/json/GenericJson;
.source "File.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/api/services/drive/model/File;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ContentHints"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/api/services/drive/model/File$ContentHints$Thumbnail;
    }
.end annotation


# instance fields
.field private indexableText:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private thumbnail:Lcom/google/api/services/drive/model/File$ContentHints$Thumbnail;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2249
    invoke-direct {p0}, Lcom/google/api/client/json/GenericJson;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/api/client/json/GenericJson;
    .locals 1

    .line 2249
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/File$ContentHints;->clone()Lcom/google/api/services/drive/model/File$ContentHints;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/api/client/util/GenericData;
    .locals 1

    .line 2249
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/File$ContentHints;->clone()Lcom/google/api/services/drive/model/File$ContentHints;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/google/api/services/drive/model/File$ContentHints;
    .locals 1

    .line 2312
    invoke-super {p0}, Lcom/google/api/client/json/GenericJson;->clone()Lcom/google/api/client/json/GenericJson;

    move-result-object v0

    check-cast v0, Lcom/google/api/services/drive/model/File$ContentHints;

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 2249
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/File$ContentHints;->clone()Lcom/google/api/services/drive/model/File$ContentHints;

    move-result-object v0

    return-object v0
.end method

.method public getIndexableText()Ljava/lang/String;
    .locals 1

    .line 2273
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$ContentHints;->indexableText:Ljava/lang/String;

    return-object v0
.end method

.method public getThumbnail()Lcom/google/api/services/drive/model/File$ContentHints$Thumbnail;
    .locals 1

    .line 2292
    iget-object v0, p0, Lcom/google/api/services/drive/model/File$ContentHints;->thumbnail:Lcom/google/api/services/drive/model/File$ContentHints$Thumbnail;

    return-object v0
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/json/GenericJson;
    .locals 0

    .line 2249
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/model/File$ContentHints;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/File$ContentHints;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;
    .locals 0

    .line 2249
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/model/File$ContentHints;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/File$ContentHints;

    move-result-object p1

    return-object p1
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/File$ContentHints;
    .locals 0

    .line 2307
    invoke-super {p0, p1, p2}, Lcom/google/api/client/json/GenericJson;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/json/GenericJson;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/model/File$ContentHints;

    return-object p1
.end method

.method public setIndexableText(Ljava/lang/String;)Lcom/google/api/services/drive/model/File$ContentHints;
    .locals 0

    .line 2282
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$ContentHints;->indexableText:Ljava/lang/String;

    return-object p0
.end method

.method public setThumbnail(Lcom/google/api/services/drive/model/File$ContentHints$Thumbnail;)Lcom/google/api/services/drive/model/File$ContentHints;
    .locals 0

    .line 2301
    iput-object p1, p0, Lcom/google/api/services/drive/model/File$ContentHints;->thumbnail:Lcom/google/api/services/drive/model/File$ContentHints$Thumbnail;

    return-object p0
.end method
