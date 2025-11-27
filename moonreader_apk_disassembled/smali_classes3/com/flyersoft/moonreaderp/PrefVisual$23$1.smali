.class Lcom/flyersoft/moonreaderp/PrefVisual$23$1;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual$23;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefVisual$23;

.field final synthetic val$buttonView:Landroid/widget/CompoundButton;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual$23;Landroid/widget/CompoundButton;)V
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

    .line 716
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$23$1;->this$1:Lcom/flyersoft/moonreaderp/PrefVisual$23;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$23$1;->val$buttonView:Landroid/widget/CompoundButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    .line 719
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$23$1;->val$buttonView:Landroid/widget/CompoundButton;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    return-void
.end method
