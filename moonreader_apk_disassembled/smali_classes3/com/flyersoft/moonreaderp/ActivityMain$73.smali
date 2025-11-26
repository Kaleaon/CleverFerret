.class Lcom/flyersoft/moonreaderp/ActivityMain$73;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/components/DualFavLay$MainItemClick;


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

.field final synthetic val$shelf_category:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;I)V
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

    .line 6829
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$73;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$73;->val$shelf_category:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(IZ)V
    .locals 2

    const/4 v0, 0x0

    .line 6832
    sput v0, Lcom/flyersoft/tools/A;->shelf_last_offset:I

    .line 6833
    iget v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$73;->val$shelf_category:I

    if-eq v1, p1, :cond_0

    .line 6834
    sput v0, Lcom/flyersoft/tools/A;->shelf_last_item:I

    :cond_0
    if-nez p1, :cond_1

    .line 6836
    const-string v0, ""

    sput-object v0, Lcom/flyersoft/tools/A;->shelf_sub_collection:Ljava/lang/String;

    .line 6837
    sput-object v0, Lcom/flyersoft/tools/A;->shelf_sub_author:Ljava/lang/String;

    .line 6838
    sput p1, Lcom/flyersoft/tools/A;->shelf_category:I

    .line 6839
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$73;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 6842
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$73;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowFavoriteBooks(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V

    :cond_2
    return-void
.end method
