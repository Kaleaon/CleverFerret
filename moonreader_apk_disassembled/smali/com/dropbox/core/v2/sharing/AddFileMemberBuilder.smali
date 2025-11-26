.class public Lcom/dropbox/core/v2/sharing/AddFileMemberBuilder;
.super Ljava/lang/Object;
.source "AddFileMemberBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;

.field private final _client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 34
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberBuilder;->_client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

    if-eqz p2, :cond_0

    .line 38
    iput-object p2, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberBuilder;->_builder:Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;

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
            "Lcom/dropbox/core/v2/sharing/FileMemberActionResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/sharing/AddFileMemberErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 110
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberBuilder;->_builder:Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->build()Lcom/dropbox/core/v2/sharing/AddFileMemberArgs;

    move-result-object v0

    .line 111
    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberBuilder;->_client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;->addFileMember(Lcom/dropbox/core/v2/sharing/AddFileMemberArgs;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public withAccessLevel(Lcom/dropbox/core/v2/sharing/AccessLevel;)Lcom/dropbox/core/v2/sharing/AddFileMemberBuilder;
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberBuilder;->_builder:Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->withAccessLevel(Lcom/dropbox/core/v2/sharing/AccessLevel;)Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;

    return-object p0
.end method

.method public withAddMessageAsComment(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/AddFileMemberBuilder;
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberBuilder;->_builder:Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->withAddMessageAsComment(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;

    return-object p0
.end method

.method public withCustomMessage(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/AddFileMemberBuilder;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberBuilder;->_builder:Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->withCustomMessage(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;

    return-object p0
.end method

.method public withQuiet(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/AddFileMemberBuilder;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFileMemberBuilder;->_builder:Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;->withQuiet(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/AddFileMemberArgs$Builder;

    return-object p0
.end method
