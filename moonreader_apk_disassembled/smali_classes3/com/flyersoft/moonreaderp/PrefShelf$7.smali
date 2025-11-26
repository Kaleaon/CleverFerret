.class Lcom/flyersoft/moonreaderp/PrefShelf$7;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelf;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShelf;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 293
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$7;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 296
    sget-boolean v0, Lcom/flyersoft/tools/A;->eink:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 297
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$7;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    sget v2, Lcom/flyersoft/tools/A;->prefOp:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ScrollView;->scrollTo(II)V

    return-void

    .line 299
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$7;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShelf;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    sget v2, Lcom/flyersoft/tools/A;->prefOp:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    return-void
.end method
