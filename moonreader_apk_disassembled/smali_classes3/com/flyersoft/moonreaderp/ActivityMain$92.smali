.class Lcom/flyersoft/moonreaderp/ActivityMain$92;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
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

    .line 8969
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 11

    .line 8971
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-eqz v0, :cond_0

    .line 8972
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    .line 8974
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 8975
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v1

    .line 8976
    invoke-virtual {v0}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroup()Z

    move-result v2

    const/4 v3, 0x4

    if-eqz v2, :cond_1

    const/4 v2, 0x4

    goto :goto_0

    :cond_1
    if-eqz v1, :cond_2

    const/4 v2, 0x7

    goto :goto_0

    :cond_2
    const/4 v2, 0x6

    .line 8977
    :goto_0
    new-array v4, v2, [Ljava/lang/String;

    .line 8979
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {}, Lcom/flyersoft/tools/A;->getShelfTopBooks()Ljava/util/ArrayList;

    move-result-object v6

    iget-object v7, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->remove_from_top:I

    goto :goto_1

    :cond_3
    sget v6, Lcom/flyersoft/moonreaderp/R$string;->put_on_top:I

    :goto_1
    invoke-virtual {v5, v6}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    .line 8980
    const-string v5, "-"

    const/4 v7, 0x1

    aput-object v5, v4, v7

    .line 8981
    invoke-virtual {v0}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroup()Z

    move-result v5

    const/4 v8, 0x3

    const/4 v9, 0x2

    if-eqz v5, :cond_4

    .line 8982
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v7, Lcom/flyersoft/moonreaderp/R$array;->operations:I

    invoke-static {v5, v7, v6}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v9

    .line 8983
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v7, Lcom/flyersoft/moonreaderp/R$string;->clear_group:I

    invoke-virtual {v5, v7}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    goto :goto_3

    .line 8985
    :cond_4
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v10, Lcom/flyersoft/moonreaderp/R$string;->book_information:I

    invoke-virtual {v5, v10}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v9

    .line 8986
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v5}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getDownloadCoverTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    if-eqz v1, :cond_5

    .line 8988
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v8, Lcom/flyersoft/moonreaderp/R$string;->add_to_desktop:I

    invoke-virtual {v5, v8}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v3

    :cond_5
    add-int/lit8 v5, v2, -0x2

    .line 8989
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v10, Lcom/flyersoft/moonreaderp/R$string;->send_file:I

    invoke-virtual {v8, v10}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v5

    add-int/lit8 v5, v2, -0x1

    .line 8990
    sget v8, Lcom/flyersoft/tools/A;->shelf_category:I

    if-ne v8, v7, :cond_6

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v8, Lcom/flyersoft/moonreaderp/R$string;->remove_frome_favorites:I

    invoke-virtual {v7, v8}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v7

    goto :goto_2

    .line 8991
    :cond_6
    iget-object v7, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v8, Lcom/flyersoft/moonreaderp/R$array;->shelf_popup:I

    invoke-static {v7, v8, v9}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v7

    :goto_2
    aput-object v7, v4, v5

    .line 8994
    :goto_3
    new-instance v5, Lcom/flyersoft/components/MyMenu;

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v5, v7}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v5

    new-instance v7, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;

    invoke-direct {v7, p0, v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$92;Lcom/flyersoft/tools/BookDb$BookInfo;ZI)V

    invoke-virtual {v5, v4, v7}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    .line 9066
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->coverflow_detail:Landroid/widget/TextView;

    if-ne p1, v1, :cond_7

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->baseFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v1

    div-int/2addr v1, v3

    goto :goto_4

    :cond_7
    const/4 v1, 0x0

    :goto_4
    invoke-virtual {v0, p1, v1, v6}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;II)V

    return-void
.end method
