.class Lcom/flyersoft/moonreaderp/PrefColorPick$1;
.super Landroid/os/Handler;
.source "PrefColorPick.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefColorPick;->initView(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefColorPick;Landroid/os/Looper;)V
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

    .line 136
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 139
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefColorPick$1;->this$0:Lcom/flyersoft/moonreaderp/PrefColorPick;

    const/4 v0, -0x1

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->-$$Nest$msetRGBColor(Lcom/flyersoft/moonreaderp/PrefColorPick;I)V

    return-void
.end method
