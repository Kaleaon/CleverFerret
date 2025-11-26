.class Lcom/flyersoft/moonreaderp/ActivityMain$125$1$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefEditBook$OnBookEdited;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/ActivityMain$125$1;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$125$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 11322
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$125$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSaveBookInfo()V
    .locals 2

    .line 11324
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$125$1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$125;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$125$1;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$125;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getShelfBooksAdapter()Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;)V

    .line 11325
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$125$1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$125;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateFavRvAdapter()V

    return-void
.end method
