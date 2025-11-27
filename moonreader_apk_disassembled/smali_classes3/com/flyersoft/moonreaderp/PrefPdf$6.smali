.class Lcom/flyersoft/moonreaderp/PrefPdf$6;
.super Landroid/os/Handler;
.source "PrefPdf.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefPdf;->setFlipSpinnerEvent()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefPdf;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefPdf;Landroid/os/Looper;)V
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

    .line 228
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefPdf$6;->this$0:Lcom/flyersoft/moonreaderp/PrefPdf;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 231
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefPdf$6;->this$0:Lcom/flyersoft/moonreaderp/PrefPdf;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefPdf;->flip_type_sp:Landroid/widget/Spinner;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefPdf$6$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefPdf$6$1;-><init>(Lcom/flyersoft/moonreaderp/PrefPdf$6;)V

    invoke-virtual {p1, v0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    return-void
.end method
