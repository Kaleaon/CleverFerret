.class Lcom/flyersoft/moonreaderp/PrefMisc$83;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->setFilterItemProperties(Landroid/view/View;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$base:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2080
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$83;->val$base:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 2082
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 2083
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 2084
    sget-object v2, Lcom/flyersoft/tools/A;->ttsFilters:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v1, v2, :cond_0

    .line 2085
    sget-object v1, Lcom/flyersoft/tools/A;->ttsFilters:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/tools/A$Filter_Item;

    const-string v3, ""

    invoke-direct {v2, v3, v3}, Lcom/flyersoft/tools/A$Filter_Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2086
    sget-object v1, Lcom/flyersoft/tools/A;->ttsFilters:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 2087
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$83;->val$base:Landroid/view/View;

    invoke-static {v1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->setFilterItemProperties(Landroid/view/View;Landroid/view/View;)V

    .line 2088
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->tts_filter:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    .line 2089
    sget-object v0, Lcom/flyersoft/tools/A;->ttsFilters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 2090
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$83;->val$base:Landroid/view/View;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->setFilterItemProperties(Landroid/view/View;Landroid/view/View;)V

    .line 2091
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-virtual {v0, p1, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    .line 2092
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->checkNightTextColors(Landroid/view/View;)V

    .line 2093
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->scrollToBottom(Landroid/view/View;)V

    goto :goto_0

    .line 2095
    :cond_0
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 2096
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->saveFilterList()V

    .line 2098
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$83;->val$base:Landroid/view/View;

    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smcheckIfShowSearchForReplaceList(Landroid/view/View;Landroid/widget/LinearLayout;)V

    return-void
.end method
