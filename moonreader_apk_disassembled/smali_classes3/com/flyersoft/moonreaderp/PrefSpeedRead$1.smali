.class Lcom/flyersoft/moonreaderp/PrefSpeedRead$1;
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

    .line 135
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$1;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onValueRecive(I)V
    .locals 1

    .line 138
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$1;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->touched:Z

    .line 139
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$1;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->speedSeek:Lcom/flyersoft/views/CustomSeek;

    invoke-virtual {p1}, Lcom/flyersoft/views/CustomSeek;->getCurrent()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->speedReadWPM:I

    return-void
.end method
