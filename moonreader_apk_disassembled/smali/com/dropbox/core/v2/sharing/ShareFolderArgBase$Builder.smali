.class public Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;
.super Ljava/lang/Object;
.source "ShareFolderArgBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/ShareFolderArgBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected accessInheritance:Lcom/dropbox/core/v2/sharing/AccessInheritance;

.field protected aclUpdatePolicy:Lcom/dropbox/core/v2/sharing/AclUpdatePolicy;

.field protected forceAsync:Z

.field protected memberPolicy:Lcom/dropbox/core/v2/sharing/MemberPolicy;

.field protected final path:Ljava/lang/String;

.field protected sharedLinkPolicy:Lcom/dropbox/core/v2/sharing/SharedLinkPolicy;

.field protected viewerInfoPolicy:Lcom/dropbox/core/v2/sharing/ViewerInfoPolicy;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 202
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 206
    const-string v0, "(/(.|[\\r\\n])*)|(ns:[0-9]+(/.*)?)|(id:.*)"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 209
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->path:Ljava/lang/String;

    const/4 p1, 0x0

    .line 210
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->aclUpdatePolicy:Lcom/dropbox/core/v2/sharing/AclUpdatePolicy;

    const/4 v0, 0x0

    .line 211
    iput-boolean v0, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->forceAsync:Z

    .line 212
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->memberPolicy:Lcom/dropbox/core/v2/sharing/MemberPolicy;

    .line 213
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->sharedLinkPolicy:Lcom/dropbox/core/v2/sharing/SharedLinkPolicy;

    .line 214
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->viewerInfoPolicy:Lcom/dropbox/core/v2/sharing/ViewerInfoPolicy;

    .line 215
    sget-object p1, Lcom/dropbox/core/v2/sharing/AccessInheritance;->INHERIT:Lcom/dropbox/core/v2/sharing/AccessInheritance;

    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->accessInheritance:Lcom/dropbox/core/v2/sharing/AccessInheritance;

    return-void

    .line 207
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'path\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 204
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'path\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/sharing/ShareFolderArgBase;
    .locals 8

    .line 325
    new-instance v0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->path:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->aclUpdatePolicy:Lcom/dropbox/core/v2/sharing/AclUpdatePolicy;

    iget-boolean v3, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->forceAsync:Z

    iget-object v4, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->memberPolicy:Lcom/dropbox/core/v2/sharing/MemberPolicy;

    iget-object v5, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->sharedLinkPolicy:Lcom/dropbox/core/v2/sharing/SharedLinkPolicy;

    iget-object v6, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->viewerInfoPolicy:Lcom/dropbox/core/v2/sharing/ViewerInfoPolicy;

    iget-object v7, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->accessInheritance:Lcom/dropbox/core/v2/sharing/AccessInheritance;

    invoke-direct/range {v0 .. v7}, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/sharing/AclUpdatePolicy;ZLcom/dropbox/core/v2/sharing/MemberPolicy;Lcom/dropbox/core/v2/sharing/SharedLinkPolicy;Lcom/dropbox/core/v2/sharing/ViewerInfoPolicy;Lcom/dropbox/core/v2/sharing/AccessInheritance;)V

    return-object v0
.end method

.method public withAccessInheritance(Lcom/dropbox/core/v2/sharing/AccessInheritance;)Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 310
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->accessInheritance:Lcom/dropbox/core/v2/sharing/AccessInheritance;

    return-object p0

    .line 313
    :cond_0
    sget-object p1, Lcom/dropbox/core/v2/sharing/AccessInheritance;->INHERIT:Lcom/dropbox/core/v2/sharing/AccessInheritance;

    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->accessInheritance:Lcom/dropbox/core/v2/sharing/AccessInheritance;

    return-object p0
.end method

.method public withAclUpdatePolicy(Lcom/dropbox/core/v2/sharing/AclUpdatePolicy;)Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;
    .locals 0

    .line 227
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->aclUpdatePolicy:Lcom/dropbox/core/v2/sharing/AclUpdatePolicy;

    return-object p0
.end method

.method public withForceAsync(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 245
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->forceAsync:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 248
    iput-boolean p1, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->forceAsync:Z

    return-object p0
.end method

.method public withMemberPolicy(Lcom/dropbox/core/v2/sharing/MemberPolicy;)Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;
    .locals 0

    .line 262
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->memberPolicy:Lcom/dropbox/core/v2/sharing/MemberPolicy;

    return-object p0
.end method

.method public withSharedLinkPolicy(Lcom/dropbox/core/v2/sharing/SharedLinkPolicy;)Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;
    .locals 0

    .line 276
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->sharedLinkPolicy:Lcom/dropbox/core/v2/sharing/SharedLinkPolicy;

    return-object p0
.end method

.method public withViewerInfoPolicy(Lcom/dropbox/core/v2/sharing/ViewerInfoPolicy;)Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;
    .locals 0

    .line 289
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/ShareFolderArgBase$Builder;->viewerInfoPolicy:Lcom/dropbox/core/v2/sharing/ViewerInfoPolicy;

    return-object p0
.end method
