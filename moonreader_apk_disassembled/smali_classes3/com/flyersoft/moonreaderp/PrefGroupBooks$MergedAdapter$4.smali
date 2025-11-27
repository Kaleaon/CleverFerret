.class Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$4;
.super Ljava/lang/Object;
.source "PrefGroupBooks.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 506
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 508
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iget-boolean v0, v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->inItemDragging:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 510
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->mShowRemoveButton:Z

    if-eqz v0, :cond_1

    .line 511
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->showRemoveButton(Z)V

    return-void

    .line 515
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 516
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v1, v2, v0, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->verifyShelfBook(Landroid/content/Context;Lcom/flyersoft/tools/BookDb$BookInfo;Ljava/util/ArrayList;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 517
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 518
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    sput-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->openBookView:Landroid/view/View;

    .line 519
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->openFile(Ljava/lang/String;)V

    :cond_3
    :goto_0
    return-void
.end method
