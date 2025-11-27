.class Lcom/flyersoft/moonreaderp/PrefFontPick$12;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick;->setFontReplaceItemProperties(Landroid/content/Context;Landroid/widget/LinearLayout;Landroid/view/View;Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$list:Ljava/util/ArrayList;

.field final synthetic val$replaceLay:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Ljava/util/ArrayList;Landroid/content/Context;Landroid/widget/LinearLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 406
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$list:Ljava/util/ArrayList;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$replaceLay:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 408
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    .line 409
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 410
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$list:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 411
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$list:Ljava/util/ArrayList;

    new-instance v1, Lcom/flyersoft/tools/A$Filter_Item;

    const-string v2, ""

    invoke-direct {v1, v2, v2}, Lcom/flyersoft/tools/A$Filter_Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 412
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 413
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$replaceLay:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$list:Ljava/util/ArrayList;

    invoke-static {v0, v1, p1, v2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$smsetFontReplaceItemProperties(Landroid/content/Context;Landroid/widget/LinearLayout;Landroid/view/View;Ljava/util/ArrayList;)V

    .line 414
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$context:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->tts_filter:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    .line 415
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 416
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$replaceLay:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$list:Ljava/util/ArrayList;

    invoke-static {v0, v1, p1, v2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$smsetFontReplaceItemProperties(Landroid/content/Context;Landroid/widget/LinearLayout;Landroid/view/View;Ljava/util/ArrayList;)V

    .line 417
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$replaceLay:Landroid/widget/LinearLayout;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-virtual {v0, p1, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    .line 418
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$replaceLay:Landroid/widget/LinearLayout;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->checkNightTextColors(Landroid/view/View;)V

    .line 419
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$replaceLay:Landroid/widget/LinearLayout;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFontPick$12$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefFontPick$12$1;-><init>(Lcom/flyersoft/moonreaderp/PrefFontPick$12;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    return-void

    .line 426
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$12;->val$replaceLay:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    return-void
.end method
