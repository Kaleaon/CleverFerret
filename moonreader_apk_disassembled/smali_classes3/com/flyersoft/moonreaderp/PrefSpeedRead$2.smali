.class Lcom/flyersoft/moonreaderp/PrefSpeedRead$2;
.super Ljava/lang/Object;
.source "PrefSpeedRead.java"

# interfaces
.implements Lcom/flyersoft/views/CustomSeek$OnProgressChanged;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefSpeedRead;->initView()V
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

    .line 142
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$2;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onValueRecive(I)V
    .locals 2

    .line 145
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$2;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->touched:Z

    .line 146
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$2;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->-$$Nest$msetTextSize(Lcom/flyersoft/moonreaderp/PrefSpeedRead;I)V

    return-void
.end method
