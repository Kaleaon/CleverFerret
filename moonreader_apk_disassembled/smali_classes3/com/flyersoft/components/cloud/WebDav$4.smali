.class Lcom/flyersoft/components/cloud/WebDav$4;
.super Ljava/lang/Object;
.source "WebDav.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/WebDav;->showLogin(Landroid/content/Context;ZLcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/WebDav;

.field final synthetic val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/WebDav;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
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

    .line 215
    iput-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$4;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/WebDav$4;->val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 218
    iget-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$4;->val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;

    if-eqz p1, :cond_0

    const/4 p2, 0x0

    .line 219
    invoke-static {p2}, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->initWebDav(Z)Z

    move-result p2

    const-string v0, "UNDO"

    invoke-interface {p1, p2, v0}, Lcom/flyersoft/components/cloud/Cloud$AfterLogin;->afterLogin(ZLjava/lang/String;)V

    :cond_0
    return-void
.end method
