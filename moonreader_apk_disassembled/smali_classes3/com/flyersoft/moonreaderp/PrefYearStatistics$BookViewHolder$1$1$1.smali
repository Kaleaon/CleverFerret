.class Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1$1;
.super Ljava/lang/Object;
.source "PrefYearStatistics.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$3:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;

.field final synthetic val$filename:Ljava/lang/String;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 668
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1$1;->this$3:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;

    iput p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1$1;->val$position:I

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1$1;->val$filename:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 671
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1$1;->this$3:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->selectedBooks:Ljava/util/ArrayList;

    iget p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1$1;->val$position:I

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 672
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1$1;->this$3:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->rv:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 673
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1$1;->val$filename:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/BookDb;->deleteStatistics(Ljava/lang/String;)I

    return-void
.end method
