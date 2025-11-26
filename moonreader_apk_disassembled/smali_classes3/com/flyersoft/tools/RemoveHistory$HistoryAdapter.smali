.class public Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;
.super Landroid/widget/BaseAdapter;
.source "RemoveHistory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/RemoveHistory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HistoryAdapter"
.end annotation


# instance fields
.field con:Landroid/content/Context;

.field list:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field onItemRemove:Landroid/content/DialogInterface$OnClickListener;

.field onRemoveClick:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/content/DialogInterface$OnClickListener;",
            ")V"
        }
    .end annotation

    .line 55
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 85
    new-instance v0, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter$1;-><init>(Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;->onRemoveClick:Landroid/view/View$OnClickListener;

    .line 56
    iput-object p1, p0, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;->con:Landroid/content/Context;

    .line 57
    iput-object p2, p0, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;->list:Ljava/util/ArrayList;

    .line 58
    iput-object p3, p0, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;->onItemRemove:Landroid/content/DialogInterface$OnClickListener;

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 66
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    if-eqz p2, :cond_0

    goto :goto_0

    .line 74
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;->con:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget p3, Lcom/flyersoft/moonreaderp/R$layout;->history_item_removable:I

    const/4 v0, 0x0

    invoke-virtual {p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 75
    :goto_0
    sget p3, Lcom/flyersoft/moonreaderp/R$id;->text:I

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    .line 76
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->op:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 77
    invoke-static {p2}, Lcom/flyersoft/tools/A;->checkNightTextColors(Landroid/view/View;)V

    .line 78
    iget-object v1, p0, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;->list:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 80
    iget-object p1, p0, Lcom/flyersoft/tools/RemoveHistory$HistoryAdapter;->onRemoveClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 81
    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenWidth()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setMinimumWidth(I)V

    return-object p2
.end method
