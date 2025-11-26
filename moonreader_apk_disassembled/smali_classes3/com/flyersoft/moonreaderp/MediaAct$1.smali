.class Lcom/flyersoft/moonreaderp/MediaAct$1;
.super Ljava/lang/Object;
.source "MediaAct.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


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

    .line 44
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/MediaAct$1;->this$0:Lcom/flyersoft/moonreaderp/MediaAct;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 1

    .line 46
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/MediaAct$1;->this$0:Lcom/flyersoft/moonreaderp/MediaAct;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/MediaAct;->progressBar:Landroid/widget/ProgressBar;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void
.end method
