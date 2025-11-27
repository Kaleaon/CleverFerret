.class Lcom/flyersoft/moonreaderp/ActivityTxt$93;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->speakHandler()Landroid/os/Handler;
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

    .line 10437
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$93;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 10439
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$93;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v1, p1, Landroid/os/Message;->what:I

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-static {v0, v1, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoSpeakHandlerEvent(Lcom/flyersoft/moonreaderp/ActivityTxt;ILjava/lang/Object;)V

    return-void
.end method
