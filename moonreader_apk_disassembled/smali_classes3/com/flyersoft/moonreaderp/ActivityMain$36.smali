.class Lcom/flyersoft/moonreaderp/ActivityMain$36;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->setFavoriteOnDrawer()V
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

    .line 3432
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$36;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    const/4 p1, 0x1

    .line 3435
    sput p1, Lcom/flyersoft/tools/A;->shelf_category:I

    .line 3436
    const-string p2, ""

    sput-object p2, Lcom/flyersoft/tools/A;->shelf_sub_author:Ljava/lang/String;

    .line 3437
    iget-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$36;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p4, p4, Lcom/flyersoft/moonreaderp/ActivityMain;->favList:Landroid/widget/ListView;

    invoke-virtual {p4}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p4

    check-cast p4, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;

    iget-object p4, p4, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;->favs:Ljava/util/ArrayList;

    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result p4

    if-nez p4, :cond_0

    goto :goto_0

    .line 3438
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$36;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->favList:Landroid/widget/ListView;

    invoke-virtual {p2}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;->favs:Ljava/util/ArrayList;

    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/tools/BookDb$BookCollection;

    invoke-static {p2}, Lcom/flyersoft/tools/BookDb;->encodeCollection(Lcom/flyersoft/tools/BookDb$BookCollection;)Ljava/lang/String;

    move-result-object p2

    :goto_0
    sput-object p2, Lcom/flyersoft/tools/A;->shelf_sub_collection:Ljava/lang/String;

    .line 3439
    sget p2, Lcom/flyersoft/tools/A;->lastTab:I

    if-eq p2, p1, :cond_3

    .line 3440
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$36;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    const/4 p3, 0x0

    if-eqz p2, :cond_1

    .line 3441
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$36;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    invoke-virtual {p2, p3}, Lcom/flyersoft/views/BookShelfView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    .line 3442
    :cond_1
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$36;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->coverflow:Lcom/flyersoft/views/CoverFlow;

    if-eqz p2, :cond_2

    .line 3443
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$36;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->coverflow:Lcom/flyersoft/views/CoverFlow;

    invoke-virtual {p2, p3}, Lcom/flyersoft/views/CoverFlow;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 3444
    :cond_2
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$36;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p2, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->setTabType(I)V

    goto :goto_1

    :cond_3
    const/4 p2, -0x1

    .line 3446
    sput p2, Lcom/flyersoft/tools/A;->shelf_last_item:I

    .line 3447
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$36;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mforceHideSelectState(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    .line 3448
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$36;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    .line 3450
    :goto_1
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$36;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetShelfTypeText(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 3451
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$36;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    iget-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$36;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/ActivityMain;->startDrawer:Landroid/widget/FrameLayout;

    sget-boolean p4, Lcom/flyersoft/tools/A;->eink:Z

    xor-int/2addr p1, p4

    invoke-virtual {p2, p3, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->closeDrawer(Landroid/view/View;Z)V

    return-void
.end method
