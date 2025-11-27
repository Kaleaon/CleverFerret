.class Lcom/flyersoft/views/NewCurl3D$1$1;
.super Ljava/lang/Object;
.source "NewCurl3D.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/NewCurl3D$1;->onDrawFrame()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/views/NewCurl3D$1;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/NewCurl3D$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 429
    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$1$1;->this$1:Lcom/flyersoft/views/NewCurl3D$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 431
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1$1;->this$1:Lcom/flyersoft/views/NewCurl3D$1;

    iget-object v0, v0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-object v0, v0, Lcom/flyersoft/views/NewCurl3D;->afterFlipCurl:Lcom/flyersoft/tools/A$AfterFlipCurl;

    if-eqz v0, :cond_0

    .line 432
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1$1;->this$1:Lcom/flyersoft/views/NewCurl3D$1;

    iget-object v0, v0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-object v0, v0, Lcom/flyersoft/views/NewCurl3D;->afterFlipCurl:Lcom/flyersoft/tools/A$AfterFlipCurl;

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$1$1;->this$1:Lcom/flyersoft/views/NewCurl3D$1;

    iget-object v1, v1, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-boolean v1, v1, Lcom/flyersoft/views/NewCurl3D;->turnSuccess:Z

    invoke-interface {v0, v1}, Lcom/flyersoft/tools/A$AfterFlipCurl;->Finished(Z)V

    :cond_0
    return-void
.end method
