.class Lcom/flyersoft/moonreaderp/ActivityMain$15;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->focusLastFile(Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$target:I


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

    .line 1462
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$15;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$15;->val$target:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1465
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$15;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iget v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$15;->val$target:I

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$15;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->fileColumn:I

    div-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->myScrollTo(I)Z

    return-void
.end method
