.class public Lcom/dropbox/core/v2/paper/DocsListBuilder;
.super Ljava/lang/Object;
.source "DocsListBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;

.field private final _client:Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 32
    iput-object p1, p0, Lcom/dropbox/core/v2/paper/DocsListBuilder;->_client:Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;

    if-eqz p2, :cond_0

    .line 36
    iput-object p2, p0, Lcom/dropbox/core/v2/paper/DocsListBuilder;->_builder:Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;

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
.method public start()Lcom/dropbox/core/v2/paper/ListPaperDocsResponse;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 124
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DocsListBuilder;->_builder:Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->build()Lcom/dropbox/core/v2/paper/ListPaperDocsArgs;

    move-result-object v0

    .line 125
    iget-object v1, p0, Lcom/dropbox/core/v2/paper/DocsListBuilder;->_client:Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsList(Lcom/dropbox/core/v2/paper/ListPaperDocsArgs;)Lcom/dropbox/core/v2/paper/ListPaperDocsResponse;

    move-result-object v0

    return-object v0
.end method

.method public withFilterBy(Lcom/dropbox/core/v2/paper/ListPaperDocsFilterBy;)Lcom/dropbox/core/v2/paper/DocsListBuilder;
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DocsListBuilder;->_builder:Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->withFilterBy(Lcom/dropbox/core/v2/paper/ListPaperDocsFilterBy;)Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;

    return-object p0
.end method

.method public withLimit(Ljava/lang/Integer;)Lcom/dropbox/core/v2/paper/DocsListBuilder;
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DocsListBuilder;->_builder:Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->withLimit(Ljava/lang/Integer;)Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;

    return-object p0
.end method

.method public withSortBy(Lcom/dropbox/core/v2/paper/ListPaperDocsSortBy;)Lcom/dropbox/core/v2/paper/DocsListBuilder;
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DocsListBuilder;->_builder:Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->withSortBy(Lcom/dropbox/core/v2/paper/ListPaperDocsSortBy;)Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;

    return-object p0
.end method

.method public withSortOrder(Lcom/dropbox/core/v2/paper/ListPaperDocsSortOrder;)Lcom/dropbox/core/v2/paper/DocsListBuilder;
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DocsListBuilder;->_builder:Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;->withSortOrder(Lcom/dropbox/core/v2/paper/ListPaperDocsSortOrder;)Lcom/dropbox/core/v2/paper/ListPaperDocsArgs$Builder;

    return-object p0
.end method
