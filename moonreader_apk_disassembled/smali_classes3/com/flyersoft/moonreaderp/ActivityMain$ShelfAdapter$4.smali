.class Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$4;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


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

    .line 8739
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 2

    .line 8741
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 8742
    iget p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->index:I

    .line 8743
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ge p1, v0, :cond_1

    .line 8744
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->isSelectedState:Z

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 8746
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    .line 8747
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->setChecked(I)V

    :cond_1
    return v1
.end method
