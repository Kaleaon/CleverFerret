.class Lcom/flyersoft/moonreaderp/ActivityMain$131$1;
.super Ljava/lang/Thread;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$131;->onFinish(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$131;

.field final synthetic val$bookFiles:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$131;Ljava/util/ArrayList;)V
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

    .line 11755
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$131$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$131;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$131$1;->val$bookFiles:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 11758
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$131$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$131;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$131;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$131$1;->val$bookFiles:Ljava/util/ArrayList;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshelfImportBooksFinal(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/util/ArrayList;)V

    return-void
.end method
