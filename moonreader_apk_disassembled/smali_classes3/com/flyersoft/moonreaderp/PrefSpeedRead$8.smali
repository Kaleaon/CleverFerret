.class Lcom/flyersoft/moonreaderp/PrefSpeedRead$8;
.super Ljava/lang/Object;
.source "PrefSpeedRead.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefSpeedRead;->startSpeedRead(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSpeedRead;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 273
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$8;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 276
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$8;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->touched:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$8;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->speedSeek:Lcom/flyersoft/views/CustomSeek;

    invoke-virtual {v0}, Lcom/flyersoft/views/CustomSeek;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 277
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$8;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->-$$Nest$mswitchContronVisible(Lcom/flyersoft/moonreaderp/PrefSpeedRead;)V

    :cond_0
    return-void
.end method
