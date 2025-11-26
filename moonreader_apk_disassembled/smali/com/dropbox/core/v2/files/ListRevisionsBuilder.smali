.class public Lcom/dropbox/core/v2/files/ListRevisionsBuilder;
.super Ljava/lang/Object;
.source "ListRevisionsBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/files/ListRevisionsArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/ListRevisionsArg$Builder;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 32
    iput-object p1, p0, Lcom/dropbox/core/v2/files/ListRevisionsBuilder;->_client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    if-eqz p2, :cond_0

    .line 36
    iput-object p2, p0, Lcom/dropbox/core/v2/files/ListRevisionsBuilder;->_builder:Lcom/dropbox/core/v2/files/ListRevisionsArg$Builder;

    return-void

    .line 34
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_builder"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 30
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_client"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public start()Lcom/dropbox/core/v2/files/ListRevisionsResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/ListRevisionsErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ListRevisionsBuilder;->_builder:Lcom/dropbox/core/v2/files/ListRevisionsArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/files/ListRevisionsArg$Builder;->build()Lcom/dropbox/core/v2/files/ListRevisionsArg;

    move-result-object v0

    .line 83
    iget-object v1, p0, Lcom/dropbox/core/v2/files/ListRevisionsBuilder;->_client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->listRevisions(Lcom/dropbox/core/v2/files/ListRevisionsArg;)Lcom/dropbox/core/v2/files/ListRevisionsResult;

    move-result-object v0

    return-object v0
.end method

.method public withLimit(Ljava/lang/Long;)Lcom/dropbox/core/v2/files/ListRevisionsBuilder;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ListRevisionsBuilder;->_builder:Lcom/dropbox/core/v2/files/ListRevisionsArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/ListRevisionsArg$Builder;->withLimit(Ljava/lang/Long;)Lcom/dropbox/core/v2/files/ListRevisionsArg$Builder;

    return-object p0
.end method

.method public withMode(Lcom/dropbox/core/v2/files/ListRevisionsMode;)Lcom/dropbox/core/v2/files/ListRevisionsBuilder;
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ListRevisionsBuilder;->_builder:Lcom/dropbox/core/v2/files/ListRevisionsArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/ListRevisionsArg$Builder;->withMode(Lcom/dropbox/core/v2/files/ListRevisionsMode;)Lcom/dropbox/core/v2/files/ListRevisionsArg$Builder;

    return-object p0
.end method
