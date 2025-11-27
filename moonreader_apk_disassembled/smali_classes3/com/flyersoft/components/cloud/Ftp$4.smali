.class Lcom/flyersoft/components/cloud/Ftp$4;
.super Ljava/lang/Object;
.source "Ftp.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Ftp;->showLogin(Landroid/content/Context;ZLcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Ftp;

.field final synthetic val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Ftp;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
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

    .line 320
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$4;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Ftp$4;->val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 323
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$4;->val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;

    if-eqz p1, :cond_0

    .line 324
    iget-object p2, p0, Lcom/flyersoft/components/cloud/Ftp$4;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/flyersoft/components/cloud/Ftp;->initConfig(Z)Z

    move-result p2

    const-string v0, "UNDO"

    invoke-interface {p1, p2, v0}, Lcom/flyersoft/components/cloud/Cloud$AfterLogin;->afterLogin(ZLjava/lang/String;)V

    :cond_0
    return-void
.end method
