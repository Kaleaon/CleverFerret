.class Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;
.super Ljava/lang/Object;
.source "DualFavLay.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;

.field final synthetic val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

.field final synthetic val$itemCount:I

.field final synthetic val$onTop:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;ZLcom/flyersoft/tools/BookDb$BookCollection;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
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

    .line 489
    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->this$2:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;

    iput-boolean p2, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->val$onTop:Z

    iput-object p3, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iput p4, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->val$itemCount:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 8

    .line 491
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->this$2:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->this$0:Lcom/flyersoft/components/DualFavLay;

    invoke-static {v0}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$msaveLastSub(Lcom/flyersoft/components/DualFavLay;)V

    if-nez p1, :cond_1

    .line 493
    iget-boolean v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->val$onTop:Z

    if-eqz v0, :cond_0

    .line 494
    sget v0, Lcom/flyersoft/tools/A;->dualFavType:I

    iget-object v1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/components/DualFavLay;->removeFromLastFavTop(ILjava/lang/String;)V

    goto :goto_0

    .line 496
    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->dualFavType:I

    iget-object v1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/components/DualFavLay;->addToLastFavTop(ILjava/lang/String;)V

    .line 497
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->this$2:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->sortItems()V

    .line 498
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->this$2:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->notifyDataSetChanged()V

    .line 501
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->this$2:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;

    invoke-static {v0}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;->-$$Nest$msupportSearch(Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;)Z

    move-result v0

    const/4 v1, 0x5

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v0, :cond_2

    sget v0, Lcom/flyersoft/tools/A;->dualFavType:I

    if-ne v0, v1, :cond_5

    :cond_2
    iget v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->val$itemCount:I

    sub-int/2addr v0, v3

    if-ne p1, v0, :cond_5

    .line 502
    sget p1, Lcom/flyersoft/tools/A;->dualFavType:I

    if-ne p1, v1, :cond_4

    .line 503
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_3

    .line 504
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->goToQuickFolderTab(Ljava/lang/String;)V

    .line 505
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->this$2:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;

    iget-object p1, p1, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    iget-object p1, p1, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object p1, p1, Lcom/flyersoft/components/DualFavLay;->popupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    return-void

    .line 507
    :cond_4
    new-instance p1, Lcom/flyersoft/views/ClearableEditText;

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/flyersoft/views/ClearableEditText;-><init>(Landroid/content/Context;)V

    .line 508
    invoke-virtual {p1, v3}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 509
    sget-object v0, Lcom/flyersoft/tools/A;->dualKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 510
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->search:I

    .line 511
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->this$2:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;

    iget-object v3, v3, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    iget-object v3, v3, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object v3, v3, Lcom/flyersoft/components/DualFavLay;->selectedName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 512
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1$1;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1$1;-><init>(Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;Landroid/widget/EditText;)V

    const p1, 0x104000a

    .line 513
    invoke-virtual {v0, p1, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->cancel:I

    .line 521
    invoke-virtual {p1, v0, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 526
    :cond_5
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_9

    const/4 v0, 0x4

    if-ne p1, v3, :cond_7

    .line 528
    sget v1, Lcom/flyersoft/tools/A;->dualFavType:I

    if-ne v1, v3, :cond_6

    .line 529
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v5, v5, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldName:Ljava/lang/String;

    iget-object v6, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v6, v6, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    iget-object v7, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-boolean v7, v7, Lcom/flyersoft/tools/BookDb$BookCollection;->multiType:Z

    .line 530
    invoke-static {v5, v6, v2, v7}, Lcom/flyersoft/tools/BookDb;->getBooks(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v5

    .line 529
    invoke-virtual {v1, v4, v5, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateBookFavorites(Landroid/content/Context;Ljava/util/ArrayList;Z)V

    .line 531
    :cond_6
    sget v1, Lcom/flyersoft/tools/A;->dualFavType:I

    if-ne v1, v0, :cond_7

    .line 532
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v5, v5, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-virtual {v1, v4, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->renameBookTags(Landroid/content/Context;Ljava/lang/String;)V

    :cond_7
    const/4 v1, 0x2

    if-ne p1, v1, :cond_9

    .line 535
    sget p1, Lcom/flyersoft/tools/A;->dualFavType:I

    if-ne p1, v3, :cond_8

    .line 536
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v1

    iget-object v3, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    iget-object v4, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v4, v4, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldName:Ljava/lang/String;

    iget-object v5, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v5, v5, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    iget-object v6, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-boolean v6, v6, Lcom/flyersoft/tools/BookDb$BookCollection;->multiType:Z

    .line 537
    invoke-static {v4, v5, v2, v6}, Lcom/flyersoft/tools/BookDb;->getBooks(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v2

    .line 536
    invoke-virtual {p1, v1, v3, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->deleteBookFavority(Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 538
    :cond_8
    sget p1, Lcom/flyersoft/tools/A;->dualFavType:I

    if-ne p1, v0, :cond_9

    .line 539
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->deleteBookTag(Landroid/content/Context;Ljava/lang/String;)V

    :cond_9
    return-void
.end method
