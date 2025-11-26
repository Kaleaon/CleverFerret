.class Lcom/flyersoft/views/RulerView$14;
.super Ljava/lang/Object;
.source "RulerView.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/RulerView;->showRulerResetDialog(Landroid/content/Context;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$showRulerCb:Z


# direct methods
.method constructor <init>(Landroid/content/Context;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 724
    iput-object p1, p0, Lcom/flyersoft/views/RulerView$14;->val$con:Landroid/content/Context;

    iput-boolean p2, p0, Lcom/flyersoft/views/RulerView$14;->val$showRulerCb:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 727
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$14;->val$con:Landroid/content/Context;

    iget-boolean v0, p0, Lcom/flyersoft/views/RulerView$14;->val$showRulerCb:Z

    invoke-static {p1, v0}, Lcom/flyersoft/views/RulerView;->showRulerOptions(Landroid/content/Context;Z)V

    return-void
.end method
