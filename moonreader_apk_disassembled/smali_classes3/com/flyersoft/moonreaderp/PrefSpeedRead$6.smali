.class Lcom/flyersoft/moonreaderp/PrefSpeedRead$6;
.super Ljava/lang/Object;
.source "PrefSpeedRead.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefSpeedRead;->switchContronVisible()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSpeedRead;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 182
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$6;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 1

    .line 186
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$6;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->speedSeek:Lcom/flyersoft/views/CustomSeek;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/CustomSeek;->setVisibility(I)V

    .line 187
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$6;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->sizeSeek:Lcom/flyersoft/views/CustomSeek;

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/CustomSeek;->setVisibility(I)V

    .line 188
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$6;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordSeek:Lcom/flyersoft/views/CustomSeek;

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/CustomSeek;->setVisibility(I)V

    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method
