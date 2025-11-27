.class Lcom/flyersoft/moonreaderp/ActivityMain$166;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/tools/T$FileResultOK;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->workAsSimpleBookViewer()V
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

    .line 14136
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$166;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isResultOk(Ljava/lang/String;)Z
    .locals 3

    const/4 v0, 0x1

    .line 14139
    new-array v1, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 14140
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 14141
    invoke-static {p1}, Lcom/flyersoft/tools/A;->isReadableFile(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 14142
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$166;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mopenAttachmentFile(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V

    return v0

    .line 14145
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 14147
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$166;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->finish()V

    return v2
.end method
