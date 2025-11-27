.class Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter$2;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 12518
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 12520
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 12521
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annotBooks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    return-void

    .line 12523
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$AllAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->annotBooks:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowOneBookAnnots(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V

    return-void
.end method
