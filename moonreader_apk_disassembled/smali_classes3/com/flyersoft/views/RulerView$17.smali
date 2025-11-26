.class Lcom/flyersoft/views/RulerView$17;
.super Ljava/lang/Object;
.source "RulerView.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/RulerView;->showRulerTapEventOptions(Landroid/content/Context;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$doubleCb:Landroid/widget/CheckBox;

.field final synthetic val$longCb:Landroid/widget/CheckBox;

.field final synthetic val$singleCb:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 783
    iput-object p1, p0, Lcom/flyersoft/views/RulerView$17;->val$longCb:Landroid/widget/CheckBox;

    iput-object p2, p0, Lcom/flyersoft/views/RulerView$17;->val$singleCb:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/flyersoft/views/RulerView$17;->val$doubleCb:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 786
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$17;->val$longCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/views/RulerView;->hasLongTap:Z

    .line 787
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$17;->val$singleCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/views/RulerView;->hasSingleTap:Z

    .line 788
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$17;->val$doubleCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/views/RulerView;->hasDoubleTap:Z

    .line 789
    invoke-static {}, Lcom/flyersoft/views/RulerView;->saveSettings()V

    return-void
.end method
