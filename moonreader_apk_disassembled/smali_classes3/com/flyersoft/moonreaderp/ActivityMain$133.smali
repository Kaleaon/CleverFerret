.class Lcom/flyersoft/moonreaderp/ActivityMain$133;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->initStatisticsAnnotLv()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 12190
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 12192
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->annotsLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getAdapter(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    .line 12193
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->getSelectedCount()I

    move-result v0

    const/4 v1, 0x1

    if-lez v0, :cond_2

    .line 12194
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    .line 12195
    :goto_0
    iget-object v3, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    array-length v3, v3

    if-ge v2, v3, :cond_1

    .line 12196
    iget-object v3, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    aget-boolean v3, v3, v2

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-le v3, v2, :cond_0

    .line 12197
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 12198
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetannotLastBookFile(Lcom/flyersoft/moonreaderp/ActivityMain;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2, v0, v1}, Lcom/flyersoft/moonreaderp/PrefChapters;->doShare(Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;Z)V

    return-void

    .line 12200
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetannotLastBookFile(Lcom/flyersoft/moonreaderp/ActivityMain;)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$133;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    invoke-static {p1, v0, v2, v1}, Lcom/flyersoft/moonreaderp/PrefChapters;->doShare(Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;Z)V

    return-void
.end method
