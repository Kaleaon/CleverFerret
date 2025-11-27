.class public Lcom/dropbox/core/v2/files/SearchV2Builder;
.super Ljava/lang/Object;
.source "SearchV2Builder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;

.field private final _client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;)V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 31
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchV2Builder;->_client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    if-eqz p2, :cond_0

    .line 35
    iput-object p2, p0, Lcom/dropbox/core/v2/files/SearchV2Builder;->_builder:Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;

    return-void

    .line 33
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_builder"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 29
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_client"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public start()Lcom/dropbox/core/v2/files/SearchV2Result;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/SearchErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 79
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchV2Builder;->_builder:Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;->build()Lcom/dropbox/core/v2/files/SearchV2Arg;

    move-result-object v0

    .line 80
    iget-object v1, p0, Lcom/dropbox/core/v2/files/SearchV2Builder;->_client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->searchV2(Lcom/dropbox/core/v2/files/SearchV2Arg;)Lcom/dropbox/core/v2/files/SearchV2Result;

    move-result-object v0

    return-object v0
.end method

.method public withIncludeHighlights(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/SearchV2Builder;
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchV2Builder;->_builder:Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;->withIncludeHighlights(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;

    return-object p0
.end method

.method public withMatchFieldOptions(Lcom/dropbox/core/v2/files/SearchMatchFieldOptions;)Lcom/dropbox/core/v2/files/SearchV2Builder;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchV2Builder;->_builder:Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;->withMatchFieldOptions(Lcom/dropbox/core/v2/files/SearchMatchFieldOptions;)Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;

    return-object p0
.end method

.method public withOptions(Lcom/dropbox/core/v2/files/SearchOptions;)Lcom/dropbox/core/v2/files/SearchV2Builder;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchV2Builder;->_builder:Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;->withOptions(Lcom/dropbox/core/v2/files/SearchOptions;)Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;

    return-object p0
.end method
