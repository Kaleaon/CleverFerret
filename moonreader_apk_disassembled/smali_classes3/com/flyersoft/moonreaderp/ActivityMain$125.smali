.class Lcom/flyersoft/moonreaderp/ActivityMain$125;
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

    .line 11299
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 10

    .line 11301
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v5

    .line 11302
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of v3, v0, Lcom/flyersoft/tools/BookDb$BookInfo;

    if-eqz v5, :cond_0

    const/4 v0, 0x5

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    .line 11303
    :goto_0
    new-array v6, v0, [Ljava/lang/String;

    .line 11304
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    if-eqz v3, :cond_1

    check-cast v1, Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    goto :goto_1

    :cond_1
    check-cast v1, Ljava/lang/String;

    :goto_1
    move-object v2, v1

    if-nez v3, :cond_3

    .line 11305
    invoke-static {v2}, Lcom/flyersoft/tools/BookDb;->getBook(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v1

    if-eqz v1, :cond_2

    goto :goto_2

    .line 11306
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "#html#"

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v7, Lcom/flyersoft/moonreaderp/R$string;->book_information:I

    invoke-virtual {v4, v7}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v7, "("

    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v8, Lcom/flyersoft/moonreaderp/R$string;->save_to_shelf:I

    invoke-virtual {v7, v8}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ")"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/flyersoft/components/MyMenu;->addItemDescription(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_3

    .line 11305
    :cond_3
    :goto_2
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->book_information:I

    invoke-virtual {v1, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_3
    const/4 v4, 0x0

    .line 11306
    aput-object v1, v6, v4

    .line 11307
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getDownloadCoverTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const/4 v7, 0x1

    aput-object v1, v6, v7

    if-eqz v5, :cond_4

    .line 11309
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v8, Lcom/flyersoft/moonreaderp/R$string;->add_to_desktop:I

    invoke-virtual {v1, v8}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v8, 0x2

    aput-object v1, v6, v8

    :cond_4
    add-int/lit8 v1, v0, -0x2

    .line 11310
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v9, Lcom/flyersoft/moonreaderp/R$string;->send_file:I

    invoke-virtual {v8, v9}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v1

    sub-int/2addr v0, v7

    if-eqz v3, :cond_5

    .line 11311
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->remove_frome_favorites:I

    invoke-virtual {v1, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_4

    .line 11312
    :cond_5
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v7, Lcom/flyersoft/moonreaderp/R$array;->shelf_read_history:I

    invoke-static {v1, v7, v4}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    :goto_4
    aput-object v1, v6, v0

    .line 11314
    new-instance v0, Lcom/flyersoft/components/MyMenu;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v7

    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;

    move-object v1, p0

    move-object v4, p1

    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$125;Ljava/lang/String;ZLandroid/view/View;Z[Ljava/lang/String;)V

    invoke-virtual {v7, v6, v0}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    .line 11352
    invoke-virtual {p1, v4}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;)V

    return-void
.end method
