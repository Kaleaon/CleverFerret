.class Lcom/flyersoft/views/RulerView$16$1;
.super Ljava/lang/Object;
.source "RulerView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/RulerView$16;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/RulerView$16;

.field final synthetic val$dlgView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/RulerView$16;Landroid/view/View;)V
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

    .line 770
    iput-object p1, p0, Lcom/flyersoft/views/RulerView$16$1;->this$0:Lcom/flyersoft/views/RulerView$16;

    iput-object p2, p0, Lcom/flyersoft/views/RulerView$16$1;->val$dlgView:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 773
    iget-object v0, p0, Lcom/flyersoft/views/RulerView$16$1;->val$dlgView:Landroid/view/View;

    iget-object v1, p0, Lcom/flyersoft/views/RulerView$16$1;->this$0:Lcom/flyersoft/views/RulerView$16;

    iget-object v1, v1, Lcom/flyersoft/views/RulerView$16;->val$con:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->reading_ruler:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->scrollToTitle(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method
