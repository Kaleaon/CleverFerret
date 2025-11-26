.class Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$3;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 8722
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 8724
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 8725
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->isSelectedState:Z

    if-eqz v1, :cond_0

    .line 8726
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    iget v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->index:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->inverseChecked(I)V

    return-void

    .line 8728
    :cond_0
    invoke-virtual {v0}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroup()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 8729
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v1, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->index:I

    const/4 v2, 0x0

    invoke-static {p1, v1, v0, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowGroupBooksDialog(Lcom/flyersoft/moonreaderp/ActivityMain;ILcom/flyersoft/tools/BookDb$BookInfo;Z)V

    return-void

    .line 8730
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v1, v2, v0, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->verifyShelfBook(Landroid/content/Context;Lcom/flyersoft/tools/BookDb$BookInfo;Ljava/util/ArrayList;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 8731
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 8732
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    sput-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->openBookView:Landroid/view/View;

    .line 8733
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->openFile(Ljava/lang/String;)V

    :cond_3
    return-void
.end method
