.class public Lcom/dropbox/core/v2/DbxClientV2Base;
.super Ljava/lang/Object;
.source "DbxClientV2Base.java"


# instance fields
.field protected final _client:Lcom/dropbox/core/v2/DbxRawClientV2;

.field private final account:Lcom/dropbox/core/v2/account/DbxUserAccountRequests;

.field private final auth:Lcom/dropbox/core/v2/auth/DbxUserAuthRequests;

.field private final check:Lcom/dropbox/core/v2/check/DbxUserCheckRequests;

.field private final contacts:Lcom/dropbox/core/v2/contacts/DbxUserContactsRequests;

.field private final fileProperties:Lcom/dropbox/core/v2/fileproperties/DbxUserFilePropertiesRequests;

.field private final fileRequests:Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;

.field private final files:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

.field private final openid:Lcom/dropbox/core/v2/openid/DbxUserOpenidRequests;

.field private final paper:Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;

.field private final sharing:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

.field private final users:Lcom/dropbox/core/v2/users/DbxUserUsersRequests;


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->_client:Lcom/dropbox/core/v2/DbxRawClientV2;

    .line 43
    new-instance v0, Lcom/dropbox/core/v2/account/DbxUserAccountRequests;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/account/DbxUserAccountRequests;-><init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V

    iput-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->account:Lcom/dropbox/core/v2/account/DbxUserAccountRequests;

    .line 44
    new-instance v0, Lcom/dropbox/core/v2/auth/DbxUserAuthRequests;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/auth/DbxUserAuthRequests;-><init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V

    iput-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->auth:Lcom/dropbox/core/v2/auth/DbxUserAuthRequests;

    .line 45
    new-instance v0, Lcom/dropbox/core/v2/check/DbxUserCheckRequests;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/check/DbxUserCheckRequests;-><init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V

    iput-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->check:Lcom/dropbox/core/v2/check/DbxUserCheckRequests;

    .line 46
    new-instance v0, Lcom/dropbox/core/v2/contacts/DbxUserContactsRequests;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/contacts/DbxUserContactsRequests;-><init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V

    iput-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->contacts:Lcom/dropbox/core/v2/contacts/DbxUserContactsRequests;

    .line 47
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/DbxUserFilePropertiesRequests;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/fileproperties/DbxUserFilePropertiesRequests;-><init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V

    iput-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->fileProperties:Lcom/dropbox/core/v2/fileproperties/DbxUserFilePropertiesRequests;

    .line 48
    new-instance v0, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;-><init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V

    iput-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->fileRequests:Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;

    .line 49
    new-instance v0, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;-><init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V

    iput-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->files:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    .line 50
    new-instance v0, Lcom/dropbox/core/v2/openid/DbxUserOpenidRequests;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/openid/DbxUserOpenidRequests;-><init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V

    iput-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->openid:Lcom/dropbox/core/v2/openid/DbxUserOpenidRequests;

    .line 51
    new-instance v0, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;-><init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V

    iput-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->paper:Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;

    .line 52
    new-instance v0, Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;-><init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V

    iput-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->sharing:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

    .line 53
    new-instance v0, Lcom/dropbox/core/v2/users/DbxUserUsersRequests;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/users/DbxUserUsersRequests;-><init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V

    iput-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->users:Lcom/dropbox/core/v2/users/DbxUserUsersRequests;

    return-void
.end method


# virtual methods
.method public account()Lcom/dropbox/core/v2/account/DbxUserAccountRequests;
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->account:Lcom/dropbox/core/v2/account/DbxUserAccountRequests;

    return-object v0
.end method

.method public auth()Lcom/dropbox/core/v2/auth/DbxUserAuthRequests;
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->auth:Lcom/dropbox/core/v2/auth/DbxUserAuthRequests;

    return-object v0
.end method

.method public check()Lcom/dropbox/core/v2/check/DbxUserCheckRequests;
    .locals 1

    .line 80
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->check:Lcom/dropbox/core/v2/check/DbxUserCheckRequests;

    return-object v0
.end method

.method public contacts()Lcom/dropbox/core/v2/contacts/DbxUserContactsRequests;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->contacts:Lcom/dropbox/core/v2/contacts/DbxUserContactsRequests;

    return-object v0
.end method

.method public fileProperties()Lcom/dropbox/core/v2/fileproperties/DbxUserFilePropertiesRequests;
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->fileProperties:Lcom/dropbox/core/v2/fileproperties/DbxUserFilePropertiesRequests;

    return-object v0
.end method

.method public fileRequests()Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;
    .locals 1

    .line 109
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->fileRequests:Lcom/dropbox/core/v2/filerequests/DbxUserFileRequestsRequests;

    return-object v0
.end method

.method public files()Lcom/dropbox/core/v2/files/DbxUserFilesRequests;
    .locals 1

    .line 118
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->files:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    return-object v0
.end method

.method public openid()Lcom/dropbox/core/v2/openid/DbxUserOpenidRequests;
    .locals 1

    .line 127
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->openid:Lcom/dropbox/core/v2/openid/DbxUserOpenidRequests;

    return-object v0
.end method

.method public paper()Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;
    .locals 1

    .line 136
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->paper:Lcom/dropbox/core/v2/paper/DbxUserPaperRequests;

    return-object v0
.end method

.method public sharing()Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;
    .locals 1

    .line 145
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->sharing:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

    return-object v0
.end method

.method public users()Lcom/dropbox/core/v2/users/DbxUserUsersRequests;
    .locals 1

    .line 154
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxClientV2Base;->users:Lcom/dropbox/core/v2/users/DbxUserUsersRequests;

    return-object v0
.end method
