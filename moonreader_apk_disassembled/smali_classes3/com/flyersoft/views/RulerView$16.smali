.class Lcom/flyersoft/views/RulerView$16;
.super Ljava/lang/Object;
.source "RulerView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/RulerView;->showRulerTapEventOptions(Landroid/content/Context;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$con:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 766
    iput-object p1, p0, Lcom/flyersoft/views/RulerView$16;->val$con:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 769
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$16;->val$con:Landroid/content/Context;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/flyersoft/components/DragSort/ReaderBar;->customizeBottomIcons(Landroid/content/Context;Z)Landroid/view/View;

    move-result-object p1

    .line 770
    new-instance v0, Lcom/flyersoft/views/RulerView$16$1;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/views/RulerView$16$1;-><init>(Lcom/flyersoft/views/RulerView$16;Landroid/view/View;)V

    const-wide/16 v1, 0x50

    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
