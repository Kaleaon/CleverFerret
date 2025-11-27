.class Lcom/flyersoft/moonreaderp/ActivityMain$150;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


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

.field final synthetic val$checked:[Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;[Z)V
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

    .line 13848
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$150;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$150;->val$checked:[Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    .line 13850
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$150;->val$checked:[Z

    const/4 v0, 0x3

    aput-boolean p2, p1, v0

    if-eqz p2, :cond_0

    const/16 p1, 0x8

    .line 13851
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object p2

    invoke-virtual {p2}, Lcom/flyersoft/components/cloud/Cloud;->isLogin()Z

    move-result p2

    if-nez p2, :cond_0

    .line 13852
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$150;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, v1}, Lcom/flyersoft/components/cloud/Cloud;->showLogin(Landroid/content/Context;ZLcom/flyersoft/components/cloud/Cloud$AfterLogin;)V

    :cond_0
    return-void
.end method
