.class Lcom/flyersoft/moonreaderp/ActivityTxt$100;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->do_tts_buttons(Landroid/view/View;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 11210
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$100;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 11213
    sget-boolean v0, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$100;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetcurrentTtsChapter(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v0

    sget v1, Lcom/flyersoft/tools/A;->lastChapter:I

    if-eq v0, v1, :cond_0

    .line 11214
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$100;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v1, -0x64

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mspeakCurrentPage(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    :cond_0
    return-void
.end method
