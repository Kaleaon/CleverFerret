.class Lcom/flyersoft/moonreaderp/ActivityMain$153;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->showFavFolderSelector()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 13872
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$153;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    const/4 v0, 0x6

    .line 13874
    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flyersoft/components/cloud/Cloud;->isLogin()Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_0

    .line 13875
    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$153;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v2, v1}, Lcom/flyersoft/components/cloud/Cloud;->showLogin(Landroid/content/Context;ZLcom/flyersoft/components/cloud/Cloud$AfterLogin;)V

    return-void

    .line 13877
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, v0, v2}, Lcom/flyersoft/moonreaderp/PrefMisc;->showCloudOptions(Landroid/content/Context;IZ)V

    return-void
.end method
