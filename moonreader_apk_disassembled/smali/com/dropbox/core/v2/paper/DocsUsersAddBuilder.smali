.class public Lcom/dropbox/core/v2/paper/DocsUsersAddBuilder;
.super Ljava/lang/Object;
.source "DocsUsersAddBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;

.field private final _client:Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 34
    iput-object p1, p0, Lcom/dropbox/core/v2/paper/DocsUsersAddBuilder;->_client:Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;

    if-eqz p2, :cond_0

    .line 38
    iput-object p2, p0, Lcom/dropbox/core/v2/paper/DocsUsersAddBuilder;->_builder:Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;

    return-void

    .line 36
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_builder"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 32
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_client"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public start()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/paper/AddPaperDocUserMemberResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/paper/DocLookupErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 75
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DocsUsersAddBuilder;->_builder:Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;->build()Lcom/dropbox/core/v2/paper/AddPaperDocUser;

    move-result-object v0

    .line 76
    iget-object v1, p0, Lcom/dropbox/core/v2/paper/DocsUsersAddBuilder;->_client:Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;->docsUsersAdd(Lcom/dropbox/core/v2/paper/AddPaperDocUser;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public withCustomMessage(Ljava/lang/String;)Lcom/dropbox/core/v2/paper/DocsUsersAddBuilder;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DocsUsersAddBuilder;->_builder:Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;->withCustomMessage(Ljava/lang/String;)Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;

    return-object p0
.end method

.method public withQuiet(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/paper/DocsUsersAddBuilder;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/DocsUsersAddBuilder;->_builder:Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;->withQuiet(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;

    return-object p0
.end method
