.class Lcom/flyersoft/moonreaderp/ActivityMain$101;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefGroupPick$OnGroupSelect;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->addSelectedToGroup(Landroid/view/View;Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$okBooks:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 9307
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101;->val$okBooks:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Lcom/flyersoft/tools/BookDb$BookInfo;I)V
    .locals 6

    if-eqz p1, :cond_4

    .line 9311
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101;->val$okBooks:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 9313
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101;->val$okBooks:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    const/4 v0, 0x5

    if-gt p2, v0, :cond_0

    .line 9314
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101;->val$okBooks:Ljava/util/ArrayList;

    invoke-static {p2, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$maddOkBooksToGroup(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/tools/BookDb$BookInfo;Ljava/util/ArrayList;)V

    return-void

    .line 9316
    :cond_0
    :goto_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101;->val$okBooks:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    invoke-static {}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$sfgetMAX_GROUP_BOOKS_FOR_SELECT()I

    move-result v1

    const/4 v2, 0x1

    if-le p2, v1, :cond_1

    .line 9317
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101;->val$okBooks:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v2

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 9318
    :cond_1
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101;->val$okBooks:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    new-array p2, p2, [Ljava/lang/String;

    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 9319
    :goto_1
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101;->val$okBooks:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_2

    .line 9320
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101;->val$okBooks:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v4, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    aput-object v4, p2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 9321
    :cond_2
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101;->val$okBooks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Z

    .line 9322
    :goto_2
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101;->val$okBooks:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_3

    if-ge v1, v0, :cond_3

    .line 9323
    aput-boolean v2, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 9325
    :cond_3
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->add_to_group:I

    .line 9326
    invoke-virtual {v4, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ": "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Lcom/flyersoft/tools/BookDb$BookInfo;->getGroupName(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityMain$101$2;

    invoke-direct {v1, p0, v3}, Lcom/flyersoft/moonreaderp/ActivityMain$101$2;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$101;[Z)V

    .line 9327
    invoke-virtual {v0, p2, v3, v1}, Lcom/flyersoft/components/MyDialog;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$101$1;

    invoke-direct {v0, p0, v3, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$101$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$101;[ZLcom/flyersoft/tools/BookDb$BookInfo;)V

    const p1, 0x104000a

    .line 9332
    invoke-virtual {p2, p1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 p2, 0x1040000

    const/4 v0, 0x0

    .line 9342
    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 9343
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    :cond_4
    if-lez p2, :cond_5

    .line 9346
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mforceHideSelectState(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    .line 9347
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$101;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    :cond_5
    return-void
.end method
