.class Lcom/flyersoft/views/RulerView$1;
.super Ljava/lang/Object;
.source "RulerView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/RulerView;->init(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/RulerView;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/RulerView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 111
    iput-object p1, p0, Lcom/flyersoft/views/RulerView$1;->this$0:Lcom/flyersoft/views/RulerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 114
    iget-object v0, p0, Lcom/flyersoft/views/RulerView$1;->this$0:Lcom/flyersoft/views/RulerView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/RulerView;->showRuler(Z)V

    .line 115
    iget-object v0, p0, Lcom/flyersoft/views/RulerView$1;->this$0:Lcom/flyersoft/views/RulerView;

    invoke-virtual {v0}, Lcom/flyersoft/views/RulerView;->setRulerTouchEvent()V

    return-void
.end method
