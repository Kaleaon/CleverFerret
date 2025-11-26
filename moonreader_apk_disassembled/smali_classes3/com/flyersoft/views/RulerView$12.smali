.class Lcom/flyersoft/views/RulerView$12;
.super Ljava/lang/Object;
.source "RulerView.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/RulerView;->showRulerOptions(Landroid/content/Context;Z)V
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

    .line 699
    iput-object p1, p0, Lcom/flyersoft/views/RulerView$12;->val$con:Landroid/content/Context;

    iput-boolean p2, p0, Lcom/flyersoft/views/RulerView$12;->val$showRulerCb:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 702
    iget-object p1, p0, Lcom/flyersoft/views/RulerView$12;->val$con:Landroid/content/Context;

    iget-boolean p2, p0, Lcom/flyersoft/views/RulerView$12;->val$showRulerCb:Z

    invoke-static {p1, p2}, Lcom/flyersoft/views/RulerView;->-$$Nest$smshowRulerTapEventOptions(Landroid/content/Context;Z)V

    return-void
.end method
