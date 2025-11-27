.class Lcom/flyersoft/moonreaderp/ActivityMain$31$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$31;->onLongClick(Landroid/view/View;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$31;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$31;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 3296
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$31$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$31;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 2

    .line 3298
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$31$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$31;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$31;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {}, Lcom/flyersoft/tools/A;->getHistory()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->openFile(Ljava/lang/String;)V

    return-void
.end method
