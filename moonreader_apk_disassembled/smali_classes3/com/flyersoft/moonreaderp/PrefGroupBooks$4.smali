.class Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;
.super Ljava/lang/Object;
.source "PrefGroupBooks.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefGroupBooks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 526
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 9

    .line 528
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-eqz v0, :cond_0

    .line 529
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    .line 531
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 532
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v2, 0x7

    goto :goto_0

    :cond_1
    const/4 v2, 0x6

    :goto_0
    add-int/lit8 v3, v2, -0x2

    .line 534
    new-array v4, v3, [Ljava/lang/String;

    .line 536
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->book_information:I

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    .line 537
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getDownloadCoverTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x1

    aput-object v5, v4, v7

    if-eqz v1, :cond_2

    .line 539
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v7, Lcom/flyersoft/moonreaderp/R$string;->add_to_desktop:I

    invoke-virtual {v5, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x2

    aput-object v5, v4, v7

    :cond_2
    add-int/lit8 v5, v2, -0x4

    .line 540
    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v7}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v7

    sget v8, Lcom/flyersoft/moonreaderp/R$string;->send_file:I

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v5

    add-int/lit8 v2, v2, -0x3

    .line 541
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v7, Lcom/flyersoft/moonreaderp/R$string;->remove_from_group:I

    invoke-virtual {v5, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v2

    .line 543
    new-instance v2, Lcom/flyersoft/components/MyMenu;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v2, v5}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v2

    new-instance v5, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;

    invoke-direct {v5, p0, v0, v1, v3}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;-><init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;Lcom/flyersoft/tools/BookDb$BookInfo;ZI)V

    invoke-virtual {v2, v4, v5}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    .line 590
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyMenu;->setBuilderAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    invoke-static {}, Lcom/flyersoft/components/MyMenu;->getYoffInDialog()I

    move-result v1

    invoke-virtual {v0, p1, v6, v1}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;II)V

    return-void
.end method
