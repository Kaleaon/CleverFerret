.class Lcom/flyersoft/components/cloud/WebDav$8;
.super Ljava/lang/Thread;
.source "WebDav.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/WebDav;->verifyWebDav(Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
    .locals 0

    .line 290
    iput-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$8;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/WebDav$8;->val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    const/4 v0, 0x0

    .line 293
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sput-object v1, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->ok:Ljava/lang/Boolean;

    const/4 v1, 0x1

    .line 296
    :try_start_0
    invoke-static {}, Lcom/flyersoft/components/cloud/webdav/http/WHttp;->getInstance()Lcom/flyersoft/components/cloud/webdav/http/WHttp;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flyersoft/components/cloud/webdav/http/WHttp;->reset()V

    .line 297
    new-instance v2, Lcom/flyersoft/components/cloud/webdav/WebDavFile;

    invoke-static {}, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->getWebDavUrl()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;-><init>(Ljava/lang/String;)V

    .line 298
    invoke-virtual {v2, v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->exists(Z)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    sput-object v3, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->ok:Ljava/lang/Boolean;

    .line 299
    iget-object v2, v2, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->err:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v2

    .line 301
    invoke-static {v2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 302
    invoke-static {v2}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    .line 305
    :goto_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "webdav"

    invoke-virtual {v3, v4, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget-object v3, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->ok:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    const-string v4, "ok"

    invoke-interface {v0, v4, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 306
    sget-object v0, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->ok:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 307
    invoke-static {}, Lcom/flyersoft/tools/A;->getFavFolders()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v1

    :goto_1
    if-ltz v0, :cond_1

    .line 308
    invoke-static {}, Lcom/flyersoft/tools/A;->getFavFolders()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    sget-object v3, Lcom/flyersoft/tools/A;->WEBDAV_TAG:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 309
    invoke-static {}, Lcom/flyersoft/tools/A;->getFavFolders()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 312
    :cond_1
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$8;->val$context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/flyersoft/components/cloud/WebDav$8$1;

    invoke-direct {v1, p0, v2}, Lcom/flyersoft/components/cloud/WebDav$8$1;-><init>(Lcom/flyersoft/components/cloud/WebDav$8;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
