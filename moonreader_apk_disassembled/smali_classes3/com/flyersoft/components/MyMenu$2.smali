.class Lcom/flyersoft/components/MyMenu$2;
.super Ljava/lang/Object;
.source "MyMenu.java"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/MyMenu;->initMenu()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/MyMenu;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/MyMenu;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 199
    iput-object p1, p0, Lcom/flyersoft/components/MyMenu$2;->this$0:Lcom/flyersoft/components/MyMenu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss()V
    .locals 1

    .line 201
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu$2;->this$0:Lcom/flyersoft/components/MyMenu;

    invoke-static {v0}, Lcom/flyersoft/components/MyMenu;->-$$Nest$fgetmOnDismissListener(Lcom/flyersoft/components/MyMenu;)Landroid/widget/PopupWindow$OnDismissListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 202
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu$2;->this$0:Lcom/flyersoft/components/MyMenu;

    invoke-static {v0}, Lcom/flyersoft/components/MyMenu;->-$$Nest$fgetmOnDismissListener(Lcom/flyersoft/components/MyMenu;)Landroid/widget/PopupWindow$OnDismissListener;

    move-result-object v0

    invoke-interface {v0}, Landroid/widget/PopupWindow$OnDismissListener;->onDismiss()V

    :cond_0
    const/4 v0, 0x1

    .line 203
    invoke-static {v0}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Z)V

    return-void
.end method
