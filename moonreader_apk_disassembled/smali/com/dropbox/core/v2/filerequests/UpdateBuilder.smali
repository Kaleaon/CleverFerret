.class public Lcom/dropbox/core/v2/filerequests/UpdateBuilder;
.super Ljava/lang/Object;
.source "UpdateBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;

.field private final _client:Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 32
    iput-object p1, p0, Lcom/dropbox/core/v2/filerequests/UpdateBuilder;->_client:Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;

    if-eqz p2, :cond_0

    .line 36
    iput-object p2, p0, Lcom/dropbox/core/v2/filerequests/UpdateBuilder;->_builder:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;

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
.method public start()Lcom/dropbox/core/v2/filerequests/FileRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/filerequests/UpdateFileRequestErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 122
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateBuilder;->_builder:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->build()Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;

    move-result-object v0

    .line 123
    iget-object v1, p0, Lcom/dropbox/core/v2/filerequests/UpdateBuilder;->_client:Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;->update(Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;)Lcom/dropbox/core/v2/filerequests/FileRequest;

    move-result-object v0

    return-object v0
.end method

.method public withDeadline(Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;)Lcom/dropbox/core/v2/filerequests/UpdateBuilder;
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateBuilder;->_builder:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->withDeadline(Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;)Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;

    return-object p0
.end method

.method public withDescription(Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/UpdateBuilder;
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateBuilder;->_builder:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->withDescription(Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;

    return-object p0
.end method

.method public withDestination(Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/UpdateBuilder;
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateBuilder;->_builder:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->withDestination(Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;

    return-object p0
.end method

.method public withOpen(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/filerequests/UpdateBuilder;
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateBuilder;->_builder:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->withOpen(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;

    return-object p0
.end method

.method public withTitle(Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/UpdateBuilder;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateBuilder;->_builder:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;->withTitle(Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;

    return-object p0
.end method
