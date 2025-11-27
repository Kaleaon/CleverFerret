.class Lcom/flyersoft/moonreaderp/PrefAbout$1;
.super Landroid/os/Handler;
.source "PrefAbout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefAbout;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefAbout;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefAbout;Landroid/os/Looper;)V
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

    .line 120
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefAbout$1;->this$0:Lcom/flyersoft/moonreaderp/PrefAbout;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 0

    .line 122
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefAbout$1;->this$0:Lcom/flyersoft/moonreaderp/PrefAbout;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefAbout;->-$$Nest$mdisplayPromotion(Lcom/flyersoft/moonreaderp/PrefAbout;)V

    return-void
.end method
