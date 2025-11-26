.class Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$2;
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

    .line 412
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 415
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    .line 416
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 417
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->book_author:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    .line 418
    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->search:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$2$1;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$2$1;-><init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$2;Ljava/lang/String;)V

    const p1, 0x104000a

    .line 419
    invoke-virtual {v0, p1, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    .line 425
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_0
    return-void
.end method
