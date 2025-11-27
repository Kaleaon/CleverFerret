.class Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$4;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 7819
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 7822
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->subShelfFromMenu:Z

    .line 7823
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msaveLastSub(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 7824
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfCollections:Ljava/util/ArrayList;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$BookCollection;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshelfCollectionClick(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/tools/BookDb$BookCollection;)V

    return-void
.end method
