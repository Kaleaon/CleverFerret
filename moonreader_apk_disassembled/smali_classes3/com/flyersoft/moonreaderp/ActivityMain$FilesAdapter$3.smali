.class Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$3;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1744
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1746
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1747
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->isSelectedState:Z

    if-eqz v1, :cond_0

    .line 1748
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->inverseChecked(I)V

    return-void

    .line 1751
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mdoFileItemClick(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/view/View;I)V

    return-void
.end method
