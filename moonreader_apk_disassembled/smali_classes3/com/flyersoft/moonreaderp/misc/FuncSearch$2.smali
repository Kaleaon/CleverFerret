.class Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;
.super Ljava/lang/Object;
.source "FuncSearch.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/misc/FuncSearch;->scrollToTitle(Landroid/view/View;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$root:Landroid/view/View;

.field final synthetic val$target:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/view/View;Landroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 300
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;->val$root:Landroid/view/View;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;->val$target:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 303
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;->val$root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 304
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;->val$target:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;->val$root:Landroid/view/View;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->getRelativeTop(Landroid/view/View;Landroid/view/View;)I

    move-result v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;->val$target:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getHeight()I

    move-result v1

    sub-int/2addr v0, v1

    const/high16 v1, 0x42c80000    # 100.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    sub-int/2addr v0, v1

    .line 305
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;->val$root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    instance-of v1, v1, Landroid/widget/ScrollView;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 306
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;->val$root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ScrollView;

    invoke-virtual {v1, v2, v0}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    .line 307
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;->val$root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    instance-of v1, v1, Landroidx/core/widget/NestedScrollView;

    if-eqz v1, :cond_1

    .line 308
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;->val$root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v1, v2, v0}, Landroidx/core/widget/NestedScrollView;->smoothScrollTo(II)V

    .line 310
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;->val$target:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    .line 311
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;->val$target:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "<b>"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "</b>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 312
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;->val$target:Landroid/widget/TextView;

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Lcom/flyersoft/tools/miscellaneous/AnimalTools;->startJdllyAnimal(Landroid/view/View;FZ)V

    .line 313
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;->val$root:Landroid/view/View;

    new-instance v2, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2$1;

    invoke-direct {v2, p0, v0}, Lcom/flyersoft/moonreaderp/misc/FuncSearch$2$1;-><init>(Lcom/flyersoft/moonreaderp/misc/FuncSearch$2;Ljava/lang/CharSequence;)V

    const-wide/16 v3, 0x4b0

    invoke-virtual {v1, v2, v3, v4}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
