.class Lcom/flyersoft/moonreaderp/PrefMisc$47;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->showFullScreenSettings(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefMisc;Z)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$cb2:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1340
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$47;->val$cb2:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1343
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$47;->val$cb2:Landroid/widget/CheckBox;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 1344
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$47;->val$cb2:Landroid/widget/CheckBox;

    const v1, -0x777778

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setTextColor(I)V

    return-void
.end method
