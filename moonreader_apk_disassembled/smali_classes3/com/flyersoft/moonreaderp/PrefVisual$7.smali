.class Lcom/flyersoft/moonreaderp/PrefVisual$7;
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

    .line 465
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$7;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onValueRecive(I)V
    .locals 1

    .line 468
    div-int/lit8 p1, p1, 0xa

    sput p1, Lcom/flyersoft/tools/A;->paragraphSpace:I

    .line 469
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$7;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$madjustParagraphSpacing(Lcom/flyersoft/moonreaderp/PrefVisual;Z)V

    return-void
.end method
