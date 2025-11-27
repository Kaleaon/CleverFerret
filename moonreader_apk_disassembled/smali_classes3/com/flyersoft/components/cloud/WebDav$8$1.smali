.class Lcom/flyersoft/components/cloud/WebDav$8$1;
.super Ljava/lang/Object;
.source "WebDav.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/WebDav$8;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/WebDav$8;

.field final synthetic val$err:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/WebDav$8;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 312
    iput-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$8$1;->this$0:Lcom/flyersoft/components/cloud/WebDav$8;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/WebDav$8$1;->val$err:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 315
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$8$1;->this$0:Lcom/flyersoft/components/cloud/WebDav$8;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/WebDav$8;->val$context:Landroid/content/Context;

    sget-object v1, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->ok:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v2, p0, Lcom/flyersoft/components/cloud/WebDav$8$1;->val$err:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/flyersoft/components/cloud/WebDav;->showLoginResult(Landroid/content/Context;ZLjava/lang/String;)V

    .line 316
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$8$1;->this$0:Lcom/flyersoft/components/cloud/WebDav$8;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/WebDav$8;->val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;

    if-eqz v0, :cond_0

    .line 317
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$8$1;->this$0:Lcom/flyersoft/components/cloud/WebDav$8;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/WebDav$8;->val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;

    sget-object v1, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->ok:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v2, p0, Lcom/flyersoft/components/cloud/WebDav$8$1;->val$err:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/flyersoft/components/cloud/Cloud$AfterLogin;->afterLogin(ZLjava/lang/String;)V

    :cond_0
    return-void
.end method
