.class public Lcom/dropbox/core/v2/sharing/CreateSharedLinkArg$Builder;
.super Ljava/lang/Object;
.source "CreateSharedLinkArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/CreateSharedLinkArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final path:Ljava/lang/String;

.field protected pendingUpload:Lcom/dropbox/core/v2/sharing/PendingUploadMode;

.field protected shortUrl:Z


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 125
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/CreateSharedLinkArg$Builder;->path:Ljava/lang/String;

    const/4 p1, 0x0

    .line 126
    iput-boolean p1, p0, Lcom/dropbox/core/v2/sharing/CreateSharedLinkArg$Builder;->shortUrl:Z

    const/4 p1, 0x0

    .line 127
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/CreateSharedLinkArg$Builder;->pendingUpload:Lcom/dropbox/core/v2/sharing/PendingUploadMode;

    return-void

    .line 123
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'path\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/sharing/CreateSharedLinkArg;
    .locals 4

    .line 172
    new-instance v0, Lcom/dropbox/core/v2/sharing/CreateSharedLinkArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/CreateSharedLinkArg$Builder;->path:Ljava/lang/String;

    iget-boolean v2, p0, Lcom/dropbox/core/v2/sharing/CreateSharedLinkArg$Builder;->shortUrl:Z

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/CreateSharedLinkArg$Builder;->pendingUpload:Lcom/dropbox/core/v2/sharing/PendingUploadMode;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/sharing/CreateSharedLinkArg;-><init>(Ljava/lang/String;ZLcom/dropbox/core/v2/sharing/PendingUploadMode;)V

    return-object v0
.end method

.method public withPendingUpload(Lcom/dropbox/core/v2/sharing/PendingUploadMode;)Lcom/dropbox/core/v2/sharing/CreateSharedLinkArg$Builder;
    .locals 0

    .line 161
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/CreateSharedLinkArg$Builder;->pendingUpload:Lcom/dropbox/core/v2/sharing/PendingUploadMode;

    return-object p0
.end method

.method public withShortUrl(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/CreateSharedLinkArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 142
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/sharing/CreateSharedLinkArg$Builder;->shortUrl:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 145
    iput-boolean p1, p0, Lcom/dropbox/core/v2/sharing/CreateSharedLinkArg$Builder;->shortUrl:Z

    return-object p0
.end method
