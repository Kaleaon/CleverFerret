.class Lcom/flyersoft/moonreaderp/PrefVisual$1;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefVisual;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 178
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$1;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 181
    sget-boolean v0, Lcom/flyersoft/tools/A;->eink:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual$1;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    sget v2, Lcom/flyersoft/tools/A;->prefvp:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ScrollView;->scrollTo(II)V

    return-void

    .line 184
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual$1;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    sget v2, Lcom/flyersoft/tools/A;->prefvp:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    return-void
.end method
