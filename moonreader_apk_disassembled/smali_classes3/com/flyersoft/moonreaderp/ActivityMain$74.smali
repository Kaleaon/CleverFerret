.class Lcom/flyersoft/moonreaderp/ActivityMain$74;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/components/DualFavLay$SubItemClick;


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

    .line 6845
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$74;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(ILcom/flyersoft/tools/BookDb$BookCollection;)V
    .locals 1

    const/4 v0, 0x0

    .line 6848
    sput v0, Lcom/flyersoft/tools/A;->shelf_last_offset:I

    .line 6849
    sput p1, Lcom/flyersoft/tools/A;->shelf_category:I

    .line 6850
    const-string p1, ""

    sput-object p1, Lcom/flyersoft/tools/A;->shelf_sub_author:Ljava/lang/String;

    .line 6851
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$74;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshelfCollectionClick(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/tools/BookDb$BookCollection;)V

    return-void
.end method
