.class Lcom/flyersoft/moonreaderp/ActivityMain$47;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroidx/appcompat/widget/SearchView$OnCloseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->initActionItems()V
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

    .line 4331
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$47;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClose()Z
    .locals 1

    .line 4333
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$47;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetActionFilterVisible(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    const/4 v0, 0x0

    return v0
.end method
