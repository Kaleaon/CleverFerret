.class Lcom/flyersoft/moonreaderp/PrefMisc$119;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->showStdCloudOptions(Landroid/content/Context;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$cloudType:I

.field final synthetic val$dlg:Lcom/flyersoft/components/MyDialog;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/MyDialog;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3330
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$119;->val$dlg:Lcom/flyersoft/components/MyDialog;

    iput p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$119;->val$cloudType:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 3332
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$119;->val$dlg:Lcom/flyersoft/components/MyDialog;

    if-eqz p1, :cond_0

    .line 3333
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->dismiss()V

    :cond_0
    const/4 p1, 0x1

    .line 3334
    new-array p1, p1, [Ljava/lang/Object;

    const-string v0, "unlink"

    const/4 v1, 0x0

    aput-object v0, p1, v1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 3335
    iget p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$119;->val$cloudType:I

    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/cloud/Cloud;->unlink()V

    return-void
.end method
