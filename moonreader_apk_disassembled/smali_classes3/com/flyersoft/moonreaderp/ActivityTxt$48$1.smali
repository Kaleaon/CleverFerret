.class Lcom/flyersoft/moonreaderp/ActivityTxt$48$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$48;->done(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$48;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$48;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 4201
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$48$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$48;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 4204
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$48$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$48;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$48;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$48$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$48;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$48;->val$isPageDown:Z

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfPageScroll(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4205
    sget-boolean v0, Lcom/radaee/pdf/Global;->textReflow:Z

    if-nez v0, :cond_0

    .line 4206
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$48$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$48;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$48;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$48$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$48;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$48;->val$isPageDown:Z

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showPageAnimation(Z)V

    :cond_0
    return-void
.end method
