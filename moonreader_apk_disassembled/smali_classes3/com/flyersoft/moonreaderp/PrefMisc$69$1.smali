.class Lcom/flyersoft/moonreaderp/PrefMisc$69$1;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$69;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc$69;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$69;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1768
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$69$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$69;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetFile(Ljava/lang/String;)V
    .locals 6

    .line 1772
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1773
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 1776
    :cond_0
    :goto_0
    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 1795
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$69$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$69;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc$69;->val$base:Landroid/widget/LinearLayout;

    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smcheckIfShowSearchForReplaceList(Landroid/view/View;Landroid/widget/LinearLayout;)V

    return-void

    :cond_1
    const/4 v2, 0x0

    .line 1779
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    add-int/lit8 v0, v0, 0x1

    .line 1780
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 1781
    const-string v0, "#->#"

    invoke-virtual {v3, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_0

    .line 1783
    sget-object v4, Lcom/flyersoft/tools/A;->ttsFilters:Ljava/util/ArrayList;

    new-instance v5, Lcom/flyersoft/tools/A$Filter_Item;

    invoke-virtual {v3, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v0, v0, 0x4

    invoke-virtual {v3, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v5, v2, v0}, Lcom/flyersoft/tools/A$Filter_Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1784
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    sget-object v2, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1785
    sget-object v2, Lcom/flyersoft/tools/A;->ttsFilters:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 1786
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$69$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$69;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefMisc$69;->val$base:Landroid/widget/LinearLayout;

    invoke-static {v2, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->setFilterItemProperties(Landroid/view/View;Landroid/view/View;)V

    .line 1788
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$69$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$69;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefMisc$69;->val$context:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->tts_filter:I

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 1789
    sget-object v2, Lcom/flyersoft/tools/A;->ttsFilters:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 1790
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$69$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$69;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefMisc$69;->val$base:Landroid/widget/LinearLayout;

    invoke-static {v2, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->setFilterItemProperties(Landroid/view/View;Landroid/view/View;)V

    .line 1791
    sget-object v2, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    const/4 v3, -0x2

    invoke-virtual {v2, v0, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    .line 1792
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightTextColors(Landroid/view/View;)V

    goto/16 :goto_0

    :cond_2
    return-void

    .line 1798
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$69$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$69;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefMisc$69;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$69$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$69;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefMisc$69;->val$context:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\" "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$69$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$69;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc$69;->val$context:Landroid/content/Context;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->not_exists:I

    .line 1799
    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1798
    invoke-static {v0, v1, p1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void
.end method
