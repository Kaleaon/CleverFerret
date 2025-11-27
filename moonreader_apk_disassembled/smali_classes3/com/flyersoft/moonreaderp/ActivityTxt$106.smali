.class Lcom/flyersoft/moonreaderp/ActivityTxt$106;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showTtsOptionsButton()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/os/Looper;)V
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

    .line 11576
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$106;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 11579
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$106;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetttsButtonPressed(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$106;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_panel_visible:Z

    if-eqz p1, :cond_0

    .line 11580
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$106;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mshowTtsPanel(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    :cond_0
    return-void
.end method
