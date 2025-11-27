.class Lcom/flyersoft/components/MyDialog$1;
.super Ljava/lang/Object;
.source "MyDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/MyDialog;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/MyDialog;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 164
    iput-object p1, p0, Lcom/flyersoft/components/MyDialog$1;->this$0:Lcom/flyersoft/components/MyDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 166
    iget-object v0, p0, Lcom/flyersoft/components/MyDialog$1;->this$0:Lcom/flyersoft/components/MyDialog;

    iget-object v0, v0, Lcom/flyersoft/components/MyDialog;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    if-eqz v0, :cond_0

    .line 167
    iget-object v0, p0, Lcom/flyersoft/components/MyDialog$1;->this$0:Lcom/flyersoft/components/MyDialog;

    iget-object v0, v0, Lcom/flyersoft/components/MyDialog;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    .line 168
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/components/MyDialog$1;->this$0:Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->dismiss()V

    return-void
.end method
