.class Lcom/flyersoft/moonreaderp/ActivityMain$148;
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

    .line 13834
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$148;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$148;->val$checked:[Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 13836
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$148;->val$checked:[Z

    const/4 v0, 0x1

    aput-boolean p2, p1, v0

    if-eqz p2, :cond_0

    const/4 p1, 0x4

    .line 13837
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object p2

    invoke-virtual {p2}, Lcom/flyersoft/components/cloud/Cloud;->isLogin()Z

    move-result p2

    if-nez p2, :cond_0

    .line 13838
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$148;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, p2}, Lcom/flyersoft/components/cloud/Cloud;->validateAccount(Landroid/content/Context;)Z

    :cond_0
    return-void
.end method
