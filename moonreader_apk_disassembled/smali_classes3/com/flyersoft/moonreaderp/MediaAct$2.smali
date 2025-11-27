.class Lcom/flyersoft/moonreaderp/MediaAct$2;
.super Ljava/lang/Object;
.source "MediaAct.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/MediaAct;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/MediaAct;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/MediaAct;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 49
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/MediaAct$2;->this$0:Lcom/flyersoft/moonreaderp/MediaAct;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 0

    .line 51
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/MediaAct$2;->this$0:Lcom/flyersoft/moonreaderp/MediaAct;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/MediaAct;->isFinishing()Z

    move-result p1

    if-nez p1, :cond_0

    .line 52
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/MediaAct$2;->this$0:Lcom/flyersoft/moonreaderp/MediaAct;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/MediaAct;->-$$Nest$mdoFinish(Lcom/flyersoft/moonreaderp/MediaAct;)V

    :cond_0
    return-void
.end method
