.class Lcom/flyersoft/moonreaderp/ActivityMain$76;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->showShelfCategory(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$favs:Ljava/util/ArrayList;

.field final synthetic val$tmps:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;[Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 6877
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$76;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$76;->val$tmps:[Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$76;->val$favs:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 3

    .line 6879
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$76;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->subShelfFromMenu:Z

    .line 6880
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$76;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msaveLastSub(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 6881
    const-string v0, ""

    sput-object v0, Lcom/flyersoft/tools/A;->shelf_sub_author:Ljava/lang/String;

    const/4 v2, -0x1

    .line 6882
    sput v2, Lcom/flyersoft/tools/A;->shelf_last_item:I

    .line 6883
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$76;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mforceHideSelectState(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    .line 6884
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$76;->val$tmps:[Ljava/lang/String;

    array-length v2, v2

    if-ge p1, v2, :cond_0

    .line 6885
    sput-object v0, Lcom/flyersoft/tools/A;->shelf_sub_collection:Ljava/lang/String;

    .line 6886
    sput p1, Lcom/flyersoft/tools/A;->shelf_category:I

    .line 6887
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$76;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    .line 6889
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$76;->val$tmps:[Ljava/lang/String;

    array-length v0, v0

    if-le p1, v0, :cond_1

    .line 6890
    sput v1, Lcom/flyersoft/tools/A;->shelf_category:I

    .line 6891
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$76;->val$favs:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$76;->val$tmps:[Ljava/lang/String;

    array-length v2, v2

    sub-int/2addr p1, v2

    sub-int/2addr p1, v1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$BookCollection;

    invoke-static {p1}, Lcom/flyersoft/tools/BookDb;->encodeCollection(Lcom/flyersoft/tools/BookDb$BookCollection;)Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/flyersoft/tools/A;->shelf_sub_collection:Ljava/lang/String;

    .line 6892
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$76;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    :cond_1
    return-void
.end method
