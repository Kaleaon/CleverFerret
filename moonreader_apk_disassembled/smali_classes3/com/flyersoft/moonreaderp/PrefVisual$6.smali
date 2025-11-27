.class Lcom/flyersoft/moonreaderp/PrefVisual$6;
.super Landroid/os/Handler;
.source "PrefVisual.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual;->setSpinnerEvent()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefVisual;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual;Landroid/os/Looper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 369
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$6;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 371
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$6;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefVisual;->flip_type_sp:Landroid/widget/Spinner;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefVisual$6$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$6$1;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual$6;)V

    invoke-virtual {p1, v0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 387
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$6;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefVisual;->encodeSp:Landroid/widget/Spinner;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefVisual$6$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$6$2;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual$6;)V

    invoke-virtual {p1, v0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    return-void
.end method
