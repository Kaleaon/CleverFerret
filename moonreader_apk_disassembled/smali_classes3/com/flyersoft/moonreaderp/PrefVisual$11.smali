.class Lcom/flyersoft/moonreaderp/PrefVisual$11;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Lcom/flyersoft/views/CustomSeek$OnProgressChanged;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual;->loadSettings()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefVisual;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 501
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$11;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onValueRecive(I)V
    .locals 0

    int-to-float p1, p1

    .line 504
    invoke-static {p1}, Lcom/flyersoft/tools/A;->dr(F)I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->topMargin:I

    .line 505
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$11;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->adjustMargin()V

    return-void
.end method
