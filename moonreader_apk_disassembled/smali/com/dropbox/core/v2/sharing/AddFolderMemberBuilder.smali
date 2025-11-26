.class public Lcom/dropbox/core/v2/sharing/AddFolderMemberBuilder;
.super Ljava/lang/Object;
.source "AddFolderMemberBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/sharing/AddFolderMemberArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;Lcom/dropbox/core/v2/sharing/AddFolderMemberArg$Builder;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 32
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberBuilder;->_client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

    if-eqz p2, :cond_0

    .line 36
    iput-object p2, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberBuilder;->_builder:Lcom/dropbox/core/v2/sharing/AddFolderMemberArg$Builder;

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
.method public start()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/sharing/AddFolderMemberErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 75
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberBuilder;->_builder:Lcom/dropbox/core/v2/sharing/AddFolderMemberArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/sharing/AddFolderMemberArg$Builder;->build()Lcom/dropbox/core/v2/sharing/AddFolderMemberArg;

    move-result-object v0

    .line 76
    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberBuilder;->_client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;->addFolderMember(Lcom/dropbox/core/v2/sharing/AddFolderMemberArg;)V

    return-void
.end method

.method public withCustomMessage(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/AddFolderMemberBuilder;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberBuilder;->_builder:Lcom/dropbox/core/v2/sharing/AddFolderMemberArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/AddFolderMemberArg$Builder;->withCustomMessage(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/AddFolderMemberArg$Builder;

    return-object p0
.end method

.method public withQuiet(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/AddFolderMemberBuilder;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/AddFolderMemberBuilder;->_builder:Lcom/dropbox/core/v2/sharing/AddFolderMemberArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/AddFolderMemberArg$Builder;->withQuiet(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/AddFolderMemberArg$Builder;

    return-object p0
.end method
