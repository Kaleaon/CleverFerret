.class Lcom/flyersoft/moonreaderp/ActivityTxt$169;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->layoutHBar(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$showPen:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 16754
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$169;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$169;->val$showPen:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 16757
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$169;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->hBar:Lcom/flyersoft/views/HighlightLay;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Lcom/flyersoft/views/HighlightLay;->measure(II)V

    .line 16758
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$169;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$169;->val$showPen:Z

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->layoutHBar(Z)V

    return-void
.end method
