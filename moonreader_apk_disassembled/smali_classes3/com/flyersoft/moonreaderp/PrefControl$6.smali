.class Lcom/flyersoft/moonreaderp/PrefControl$6;
.super Landroid/os/Handler;
.source "PrefControl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefControl;->syncMediaPlayPauseKeys()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefControl;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefControl;Landroid/os/Looper;)V
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

    .line 207
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$6;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 209
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$6;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcHeadsetKey:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Spinner;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefControl$6$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefControl$6$1;-><init>(Lcom/flyersoft/moonreaderp/PrefControl$6;)V

    invoke-virtual {p1, v0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 220
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$6;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pcMediaPause:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Spinner;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefControl$6$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefControl$6$2;-><init>(Lcom/flyersoft/moonreaderp/PrefControl$6;)V

    invoke-virtual {p1, v0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    return-void
.end method
