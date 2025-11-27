.class Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;
.super Ljava/lang/Object;
.source "PrefYearStatistics.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;Landroid/view/View;)V
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

    .line 651
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;->val$v:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 8

    .line 653
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->selectedBooks:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    goto/16 :goto_1

    .line 655
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;->val$v:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 656
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->selectedBooks:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->filename:Ljava/lang/String;

    .line 657
    const-string v2, " \""

    if-nez p1, :cond_2

    .line 658
    invoke-static {v1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 659
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    sget v7, Lcom/flyersoft/moonreaderp/R$string;->filename:I

    .line 660
    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "\" "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    sget v7, Lcom/flyersoft/moonreaderp/R$string;->not_exists:I

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 659
    invoke-static {v3, v4, v5}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 662
    :cond_1
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v4, 0x0

    invoke-virtual {v3, v1, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->importSingleBook(Ljava/lang/String;Z)V

    :cond_2
    :goto_0
    const/4 v3, 0x1

    if-ne p1, v3, :cond_3

    .line 665
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    invoke-direct {p1, v3}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->selectedBooks:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$ReadStatistics;->filename:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->delete:I

    .line 666
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->read_statistics:I

    .line 667
    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\"?"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 666
    invoke-virtual {p1, v2}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1$1;

    invoke-direct {v2, p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1$1;-><init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder$1$1;ILjava/lang/String;)V

    const v0, 0x104000a

    .line 668
    invoke-virtual {p1, v0, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    .line 676
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_3
    :goto_1
    return-void
.end method
