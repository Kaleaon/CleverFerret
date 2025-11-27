.class Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$2;
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

    .line 1732
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1734
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1735
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->isSelectedState:Z

    if-eqz v1, :cond_0

    .line 1736
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->inverseChecked(I)V

    return-void

    .line 1738
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    .line 1739
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->setChecked(I)V

    return-void
.end method
